
import Dates
using MacroModelling
using Serialization
using StatsPlots
import Turing
import Turing: NUTS, PG, IS, sample, logpdf, Truncated#, Normal, Beta, Gamma, InverseGamma,
using Random, CSV, DataFrames, Zygote, AxisKeys, MCMCChains
# using ComponentArrays, Optimization, OptimizationNLopt, OptimizationOptimisers
import DynamicPPL: logjoint
import DynamicPPL
import ChainRulesCore: @ignore_derivatives, ignore_derivatives
import Pigeons
import Random
Random.seed!(1)
# ]add CSV, DataFrames, Zygote, AxisKeys, MCMCChains, Turing, DynamicPPL, Pigeons, StatsPlots
println("Threads used: ", Threads.nthreads())

smpler = "nuts" #
smple = "original" #
mdl = "nonlinear" # 
chns = 1 # 
scns = 1000

println("Sampler: $smpler")
println("Sample: $smple")
println("Model: $mdl")
println("Chains: $chns")
println("Scans: $scns")


if smple == "extended"
    smpl = "1966Q1-2020Q1"
    sample_idx = 75:291
    dat = CSV.read("test/data/usmodel_extended.csv", DataFrame)
elseif smple == "original"
    smpl = "1966Q1-2004Q4"
    sample_idx = 75:230
    dat = CSV.read("test/data/usmodel.csv", DataFrame)
elseif smple == "full"
    smpl = "1966Q1-2023Q4"
    sample_idx = 75:306
    dat = CSV.read("test/data/usmodel_extended.csv", DataFrame)
end
    
# define callback
# Define the path for the CSV file
csv_file_path = "sw07_$(mdl)_$(smpler)_$(smpl)_samples.csv"

# Initialize a DataFrame to store the data
df = DataFrame(iteration = Float64[])

function callback(rng, model, sampler, sample, state, i; kwargs...)
    # Prepare a row for the DataFrame
    row = Dict("iteration" => Float64(i))
    for (name, value) in sample.θ
        row[string(name)] = value
    end
    
    # If the DataFrame `df` does not have columns for these names, add them
    for name in keys(row)
        if !any(name .== names(df))
            df[!, name] = Union{Missing, Any}[missing for _ in 1:nrow(df)]
        end
    end
    
    # Append the new data to the DataFrame
    push!(df, row)
    
    # Write the updated DataFrame to the CSV file
    # Note: To avoid performance issues, consider writing periodically instead of on every callback
    CSV.write(csv_file_path, df, append=true)
end

if mdl == "linear"
    include("../models/SW07.jl")
elseif mdl == "nonlinear"
    include("../models/SW07_nonlinear.jl")
    SW07 = SW07_nonlinear
end


# load data
data = KeyedArray(Array(dat)',Variable = Symbol.(strip.(names(dat))), Time = 1:size(dat)[1])

# declare observables
observables = [:dy, :dc, :dinve, :labobs, :pinfobs, :dw, :robs]

# Subsample
# subset observables in data
data = data(observables, sample_idx)

# Handling distributions with varying parameters using arraydist
dists = [
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_ea
InverseGamma(0.1, 2.0, 0.025,5.0, μσ = true), # z_eb
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_eg
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_eqs
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_em
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_epinf
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true), # z_ew
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhoa
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhob
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhog
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhoqs
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhoms
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # crhopinf
Beta(0.5, 0.2, 0.001,0.9999, μσ = true), # crhow
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # cmap
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true), # cmaw
Normal(4.0, 1.5,   2.0, 15.0), # csadjcost
Normal(1.50,0.375, 0.25, 3.0), # csigma
Beta(0.7, 0.1, 0.001, 0.99, μσ = true), # chabb
Beta(0.5, 0.1, 0.3, 0.95, μσ = true), # cprobw
Normal(2.0, 0.75, 0.25, 10.0), # csigl
Beta(0.5, 0.10, 0.5, 0.95, μσ = true), # cprobp
Beta(0.5, 0.15, 0.01, 0.99, μσ = true), # cindw
Beta(0.5, 0.15, 0.01, 0.99, μσ = true), # cindp
Beta(0.5, 0.15, 0.01, 0.99999, μσ = true), # czcap
Normal(1.25, 0.125, 1.0, 3.0), # cfc
Normal(1.5, 0.25, 1.0, 3.0), # crpi
Beta(0.75, 0.10, 0.5, 0.975, μσ = true), # crr
Normal(0.125, 0.05, 0.001, 0.5), # cry
Normal(0.125, 0.05, 0.001, 0.5), # crdy
Gamma(0.625, 0.1, 0.1, 2.0, μσ = true), # constepinf
Gamma(0.25, 0.1, 0.01, 2.0, μσ = true), # constebeta
Normal(0.0, 2.0, -10.0, 10.0), # constelab
Normal(0.4, 0.10, 0.1, 0.8), # ctrend
Normal(0.5, 0.25, 0.01, 2.0), # cgy
Normal(0.3, 0.05, 0.01, 1.0), # calfa
]

Turing.@model function SW07_loglikelihood_function(data, m, observables,fixed_parameters)
    all_params ~ Turing.arraydist(dists)

    z_ea, z_eb, z_eg, z_eqs, z_em, z_epinf, z_ew, crhoa, crhob, crhog, crhoqs, crhoms, crhopinf, crhow, cmap, cmaw, csadjcost, csigma, chabb, cprobw, csigl, cprobp, cindw, cindp, czcap, cfc, crpi, crr, cry, crdy, constepinf, constebeta, constelab, ctrend, cgy, calfa = all_params

    ctou, clandaw, cg, curvp, curvw = fixed_parameters

    if DynamicPPL.leafcontext(__context__) !== DynamicPPL.PriorContext() 
        parameters_combined = [ctou,clandaw,cg,curvp,curvw,calfa,csigma,cfc,cgy,csadjcost,chabb,cprobw,csigl,cprobp,cindw,cindp,czcap,crpi,crr,cry,crdy,crhoa,crhob,crhog,crhoqs,crhoms,crhopinf,crhow,cmap,cmaw,constelab,z_ea,z_eb,z_eg,z_eqs,z_em,z_epinf,z_ew,ctrend,constepinf,constebeta]

        kalman_prob = get_loglikelihood(m, data(observables), parameters_combined)

        Turing.@addlogprob! kalman_prob 
    end
end

SW07.parameter_values[indexin([:crhoms, :crhopinf, :crhow, :cmap, :cmaw],SW07.parameters)] .= 0.02

fixed_parameters = SW07.parameter_values[indexin([:ctou,:clandaw,:cg,:curvp,:curvw],SW07.parameters)]


dir_name = "sw07_$(mdl)_$(smpler)_$(smpl)_samples_$(chns)_chains"

if !isdir(dir_name) mkdir(dir_name) end

cd(dir_name)

println("Current working directory: ", pwd())

SW07_loglikelihood = SW07_loglikelihood_function(data, SW07, observables, fixed_parameters)

if smpler == "is"
    n_samples = 1000
    
    samps = Turing.sample(SW07_loglikelihood, IS(), n_samples, progress = true, callback = callback)#, init_params = sol)
elseif smpler == "pg"
    n_samples = 1000
    
    samps = Turing.sample(SW07_loglikelihood, PG(100), n_samples, progress = true, callback = callback)#, init_params = sol)
elseif smpler == "nuts"    
    samps = Turing.sample(SW07_loglikelihood, NUTS(adtype = Turing.AutoZygote()), 10, progress = true, callback = callback)#, init_params = sol)
    samps = Turing.sample(SW07_loglikelihood, NUTS(), 10, progress = true, callback = callback)
elseif smpler == "pigeons"
    # generate a Pigeons log potential
    sw07_lp = Pigeons.TuringLogPotential(SW07_loglikelihood)

    # find a feasible starting point
    pt = Pigeons.pigeons(target = sw07_lp, n_rounds = 0, n_chains = 1)
    
    replica = pt.replicas[end]
    XMAX = deepcopy(replica.state)
    LPmax = sw07_lp(XMAX)

    i = 0

    while !isfinite(LPmax) && i < 1000
        Pigeons.sample_iid!(sw07_lp, replica, pt.shared)
        new_LP = sw07_lp(replica.state)
        if new_LP > LPmax
            LPmax = new_LP
            XMAX  = deepcopy(replica.state)
        end
        i += 1
    end
    
    # define a specific initialization for this model
    Pigeons.initialization(::Pigeons.TuringLogPotential{typeof(SW07_loglikelihood)}, ::AbstractRNG, ::Int64) = deepcopy(XMAX)

    pt = Pigeons.pigeons(target = sw07_lp,
                checkpoint = true,
                record = [Pigeons.traces; Pigeons.round_trip; Pigeons.record_default(); Pigeons.disk],
                n_chains = chns,
                n_rounds = scns,
                multithreaded = false)

    samps = MCMCChains.Chains(Pigeons.get_sample(pt))
end

dt = Dates.format(Dates.now(), "yyyy-mm-dd_HH")
serialize("samples_$(dt)h.jls", samps)

my_plot = StatsPlots.plot(samps)
StatsPlots.savefig(my_plot, "samples_$(dt)h.png")

#Base.show(samps)
#println(Base.show(samps))
Base.show(stdout, MIME"text/plain"(), samps)
  