
import Dates
using MacroModelling
using Serialization
using StatsPlots
import Turing
import Turing: NUTS, HMC, PG, IS, sample, logpdf, Truncated#, Normal, Beta, Gamma, InverseGamma,
using CSV, DataFrames, AxisKeys
using Zygote, MCMCChains
# using ComponentArrays, Optimization, OptimizationNLopt, OptimizationOptimisers
import DynamicPPL: logjoint
import DynamicPPL
import ChainRulesCore: @ignore_derivatives, ignore_derivatives
import Pigeons
import Optim, LineSearches
using Random
Random.seed!(1)
# ]add CSV, DataFrames, Zygote, AxisKeys, MCMCChains, Turing, DynamicPPL, Pigeons, StatsPlots
println("Threads used: ", Threads.nthreads())

# smpler = "pigeons" #
# smple = "medium" #
# mdl = "nonlinear" # 
# algo = "pruned_second_order"
# chns = 1 #
# scns = 10
# fltr = "inversion"

smpler = ENV["sampler"] # "pigeons" #
smple = ENV["sample"] # "original" #
mdl = ENV["model"] # "linear" # 
fltr = ENV["filter"] # "kalman" # 
algo = ENV["algorithm"] # "kalman" # 
chns = Meta.parse(ENV["chains"]) # "4" # 
scns = Meta.parse(ENV["scans"]) # "4" # 

println("Sampler: $smpler")
println("Sample: $smple")
println("Model: $mdl")
println("Chains: $chns")
println("Filter: $fltr")
println("Algorithm: $algo")
println("Scans: $scns")
println(pwd())

if smple == "extended"
    smpl = "1966Q1-2020Q1"
    sample_idx = 75:291
    dat = CSV.read("./MacroModelling.jl/benchmark/usmodel_extended.csv", DataFrame)
elseif smple == "short"
    smpl = "1966Q1-2004Q4"
    sample_idx = 71:230
    dat = CSV.read("./MacroModelling.jl/benchmark/usmodel.csv", DataFrame)
elseif smple == "medium"
    smpl = "1960Q1-2004Q4"
    sample_idx = 47:230
    dat = CSV.read("./MacroModelling.jl/benchmark/usmodel.csv", DataFrame)
elseif smple == "long"
    smpl = "1947Q2-2004Q4"
    sample_idx = 1:230
    dat = CSV.read("./MacroModelling.jl/benchmark/usmodel.csv", DataFrame)
elseif smple == "full"
    smpl = "1966Q1-2023Q4"
    sample_idx = 75:306
    dat = CSV.read("./MacroModelling.jl/benchmark/usmodel_extended.csv", DataFrame)
end

# define callback
# Define the path for the CSV file
csv_file_path = "sw07_$(mdl)_$(fltr)_$(algo)_$(smpler)_$(smpl)_samples.csv"

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
    include("../models/Smets_Wouters_2007_linear.jl")
    Smets_Wouters_2007 = Smets_Wouters_2007_linear
elseif mdl == "nonlinear"
    include("../models/Smets_Wouters_2007.jl")
end


# load data
data = KeyedArray(Array(dat)',Variable = Symbol.(strip.(names(dat))), Time = 1:size(dat)[1])

# declare observables
observables_old = [:dy, :dc, :dinve, :labobs, :pinfobs, :dw, :robs] # note that :dw was renamed to :dwobs in linear model in order to avoid confusion with nonlinear model

# Subsample
# subset observables in data
data = data(observables_old, sample_idx)

observables = [:dy, :dc, :dinve, :labobs, :pinfobs, :dwobs, :robs] # note that :dw was renamed to :dwobs in linear model in order to avoid confusion with nonlinear model

data = rekey(data, :Variable => observables)

llh = get_loglikelihood(Smets_Wouters_2007, data, Smets_Wouters_2007.parameter_values, presample_periods = 4, filter = Symbol(fltr), algorithm = Symbol(algo), initial_covariance = :diagonal)

# Handling distributions with varying parameters using arraydist
dists = [
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 1     z_ea
InverseGamma(0.1, 2.0, 0.025,5.0, μσ = true),   # 2     z_eb
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 3     z_eg
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 4     z_eqs
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 5     z_em
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 6     z_epinf
InverseGamma(0.1, 2.0, 0.01, 3.0, μσ = true),   # 7     z_ew
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 8     crhoa
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 9     crhob
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 10    crhog
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 11    crhoqs
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 12    crhoms
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 13    crhopinf
Beta(0.5, 0.2, 0.001,0.9999, μσ = true),        # 14    crhow
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 15    cmap
Beta(0.5, 0.2, 0.01, 0.9999, μσ = true),        # 16    cmaw
Normal(4.0, 1.5,   2.0, 15.0),                  # 17    csadjcost
Normal(1.50,0.375, 0.25, 3.0),                  # 18    csigma 
Beta(0.7, 0.1, 0.001, 0.99, μσ = true),         # 19    chabb
Beta(0.5, 0.1, 0.3, 0.95, μσ = true),           # 20    cprobw
Normal(2.0, 0.75, 0.25, 10.0),                  # 21    csigl
Beta(0.5, 0.10, 0.5, 0.95, μσ = true),          # 22    cprobp 
Beta(0.5, 0.15, 0.01, 0.99, μσ = true),         # 23    cindw      -> ιʷ
Beta(0.5, 0.15, 0.01, 0.99, μσ = true),         # 24    cindp      -> ιᵖ
Beta(0.5, 0.15, 0.01, 0.99999, μσ = true),      # 25    czcap      -> ψ
Normal(1.25, 0.125, 1.0, 3.0),                  # 26    cfc        -> Φ
Normal(1.5, 0.25, 1.0, 3.0),                    # 27    crpi
Beta(0.75, 0.10, 0.5, 0.975, μσ = true),        # 28    crr
Normal(0.125, 0.05, 0.001, 0.5),                # 29    cry
Normal(0.125, 0.05, 0.001, 0.5),                # 30    crdy
Gamma(0.625, 0.1, 0.1, 2.0, μσ = true),         # 31    constepinf
Gamma(0.25, 0.1, 0.01, 2.0, μσ = true),         # 32    constebeta -> 100(β⁻¹ - 1)
Normal(0.0, 2.0, -10.0, 10.0),                  # 33    constelab  -> l̄
Normal(0.4, 0.10, 0.1, 0.8),                    # 34    ctrend     -> γ̄
Normal(0.5, 0.25, 0.01, 2.0),                   # 35    cgy        -> ρᵍᵃ
Normal(0.3, 0.05, 0.01, 1.0),                   # 36    calfa
]

Turing.@model function SW07_loglikelihood_function(data, m, observables, fixed_parameters)
    all_params ~ Turing.arraydist(dists)

    z_ea, z_eb, z_eg, z_eqs, z_em, z_epinf, z_ew, crhoa, crhob, crhog, crhoqs, crhoms, crhopinf, crhow, cmap, cmaw, csadjcost, csigma, chabb, cprobw, csigl, cprobp, cindw, cindp, czcap, cfc, crpi, crr, cry, crdy, constepinf, constebeta, constelab, ctrend, cgy, calfa = all_params

    ctou, clandaw, cg, curvp, curvw = fixed_parameters

    if DynamicPPL.leafcontext(__context__) !== DynamicPPL.PriorContext() 
        parameters_combined = [ctou, clandaw, cg, curvp, curvw, calfa, csigma, cfc, cgy, csadjcost, chabb, cprobw, csigl, cprobp, cindw, cindp, czcap, crpi, crr, cry, crdy, crhoa, crhob, crhog, crhoqs, crhoms, crhopinf, crhow, cmap, cmaw, constelab, constepinf, constebeta, ctrend, z_ea, z_eb, z_eg, z_em, z_ew, z_eqs, z_epinf]

        llh = get_loglikelihood(m, data(observables), parameters_combined, presample_periods = 4, filter = Symbol(fltr), algorithm = Symbol(algo), initial_covariance = :diagonal)

        Turing.@addlogprob! llh 
    end
end

fixed_parameters = Smets_Wouters_2007.parameter_values[indexin([:ctou,:clandaw,:cg,:curvp,:curvw],Smets_Wouters_2007.parameters)]

dir_name = "sw07_$(mdl)_$(fltr)_$(algo)_$(smpler)_$(smpl)_samples_$(chns)_chains"

if !isdir(dir_name) mkdir(dir_name) end

cd(dir_name)

println("Current working directory: ", pwd())

SW07_loglikelihood = SW07_loglikelihood_function(data, Smets_Wouters_2007, observables, fixed_parameters)

SS(Smets_Wouters_2007, parameters = [:crhoms => 0.01, :crhopinf => 0.01, :crhow => 0.01,:cmap => 0.01,:cmaw => 0.01], algorithm = Symbol(algo))(observables)

inits = [Dict(get_parameters(Smets_Wouters_2007, values = true))[string(i)] for i in [:z_ea, :z_eb, :z_eg, :z_eqs, :z_em, :z_epinf, :z_ew, :crhoa, :crhob, :crhog, :crhoqs, :crhoms, :crhopinf, :crhow, :cmap, :cmaw, :csadjcost, :csigma, :chabb, :cprobw, :csigl, :cprobp, :cindw, :cindp, :czcap, :cfc, :crpi, :crr, :cry, :crdy, :constepinf, :constebeta, :constelab, :ctrend, :cgy, :calfa]]

#find starting value
if !(smpler == "pigeons")
    function calculate_posterior_loglikelihood(parameters, fixed_parameters, prior_distribuions, model, data)
        log_lik = 0.0

        for (dist, val) in zip(prior_distribuions, parameters)
            log_lik -= logpdf(dist, val)
        end

        z_ea, z_eb, z_eg, z_eqs, z_em, z_epinf, z_ew, crhoa, crhob, crhog, crhoqs, crhoms, crhopinf, crhow, cmap, cmaw, csadjcost, csigma, chabb, cprobw, csigl, cprobp, cindw, cindp, czcap, cfc, crpi, crr, cry, crdy, constepinf, constebeta, constelab, ctrend, cgy, calfa = parameters

        ctou, clandaw, cg, curvp, curvw = fixed_parameters

        parameters_combined = [ctou, clandaw, cg, curvp, curvw, calfa, csigma, cfc, cgy, csadjcost, chabb, cprobw, csigl, cprobp, cindw, cindp, czcap, crpi, crr, cry, crdy, crhoa, crhob, crhog, crhoqs, crhoms, crhopinf, crhow, cmap, cmaw, constelab, constepinf, constebeta, ctrend, z_ea, z_eb, z_eg, z_em, z_ew, z_eqs, z_epinf]

        log_lik -= get_loglikelihood(model, data, parameters_combined, verbose = false, presample_periods = 4, filter = Symbol(fltr), algorithm = Symbol(algo), initial_covariance = :diagonal)

        return log_lik
    end

    calculate_posterior_loglikelihood(inits, fixed_parameters, dists, Smets_Wouters_2007, data)



    bounds = [0.01 3.0
    0.025 5.0
    0.01 3.0
    0.01 3.0
    0.01 3.0
    0.01 3.0
    0.01 3.0
    0.01 0.9999
    0.01 0.9999
    0.01 0.9999
    0.01 0.9999
    0.01 0.9999
    0.01 0.9999
    0.00 10.9999
    0.01 0.9999
    0.01 0.9999
    2.0 15.0
    0.25 3.0
    0.001 0.99
    0.3 0.95
    0.25 10.0
    0.5 0.95
    0.01 0.99
    0.01 0.99
    0.01 0.9999
    1.0 3.0
    1.0 3.0
    0.5 0.975
    0.001 0.5
    0.001 0.5
    0.1 2.0
    0.01 2.0
    -10.0 10.0
    0.1 0.8
    0.01 2.0
    0.01 1.0]

    lbs = bounds[:,1]
    ubs = bounds[:,2]

    sol = Optim.optimize(x -> calculate_posterior_loglikelihood(x, fixed_parameters, dists, Smets_Wouters_2007, data),
                                lbs, ubs, inits, 
                                Optim.SAMIN(verbosity = 2), 
                                # Optim.ParticleSwarm(lower = lbs, upper = ubs), 
                                # Optim.NelderMead(), 
                                Optim.Options(#f_abstol = eps(), 
                                                # g_tol= 1e-30,
                                                # iterations = 50000,
                                                show_trace = false,
                                                extended_trace = false)
                                )


    inits = sol.minimizer
end

if smpler == "is"
    samps = Turing.sample(SW07_loglikelihood, IS(), scns, progress = true, callback = callback, initial_params = inits)
elseif smpler == "pg"
    samps = Turing.sample(SW07_loglikelihood, PG(100), scns, progress = true, callback = callback, initial_params = inits)
elseif smpler == "nuts"    
    samps = Turing.sample(SW07_loglikelihood, NUTS(adtype = Turing.AutoZygote()), scns, progress = true, callback = callback, initial_params = inits)
elseif smpler == "pigeons"
    # generate a Pigeons log potential
    sw07_lp = Pigeons.TuringLogPotential(SW07_loglikelihood)

    # find a feasible starting point
    pt = Pigeons.pigeons(target = sw07_lp, n_rounds = 0, n_chains = 1)
    
    replica = pt.replicas[end]
    XMAX = deepcopy(replica.state)
    LPmax = sw07_lp(replica.state)

    i = 0

    while !isfinite(LPmax) && i < 1000
        Pigeons.sample_iid!(sw07_lp, replica, pt.shared)
        new_LP = sw07_lp(replica.state)
        if new_LP > LPmax
            global LPmax = new_LP
            global XMAX  = deepcopy(replica.state)
        end
        global i += 1
    end
    
    # define a specific initialization for this model
    Pigeons.initialization(::Pigeons.TuringLogPotential{typeof(SW07_loglikelihood)}, ::AbstractRNG, ::Int64) = deepcopy(XMAX)

    pt = Pigeons.pigeons(target = sw07_lp,
                checkpoint = true,
                record = [Pigeons.traces; Pigeons.round_trip; Pigeons.record_default(); Pigeons.disk],
                n_chains = chns,
                n_rounds = scns,
                multithreaded = true)

    samps = MCMCChains.Chains(Pigeons.get_sample(pt))
end

dt = Dates.format(Dates.now(), "yyyy-mm-dd_HH")
serialize("samples_$(dt)h.jls", samps)

my_plot = StatsPlots.plot(samps)
StatsPlots.savefig(my_plot, "samples_$(dt)h.png")
StatsPlots.savefig(my_plot, "../samples_latest.png")

#Base.show(samps)
#println(Base.show(samps))
Base.show(stdout, MIME"text/plain"(), samps)

