include("models/Backus_Kehoe_Kydland_1992.jl")
SS = get_SS(Backus_Kehoe_Kydland_1992)

@test isapprox(SS(["A{F}","K{H}","L{F}","LGM"]),[0.606436, 11.0148, 0.696782, 0.278732],rtol = 1e-4)

var_dec = get_var_decomp(Backus_Kehoe_Kydland_1992)

@test isapprox(var_dec(["K{F}","Y{H}","Z{F}"],"E{F}") * 100, [51.34, 42.44, 52.59],rtol = 1e-3)
@test isapprox(var_dec(["K{F}","Y{H}","Z{F}"],"E{H}") * 100, [48.66, 57.56, 47.41],rtol = 1e-3)

Backus_Kehoe_Kydland_1992 = nothing




include("models/NAWM_EAUS_2008.jl")
SS = get_SS(NAWM_EAUS_2008)

@test isapprox(SS([:EAUS_RER,:EA_Y,:EA_K,:EA_C,:US_Y,:US_K]),[0.937577, 3.62701, 33.4238, 2.18955, 3.92449, 33.6712],rtol = 1e-5)

var_dec = get_var_decomp(NAWM_EAUS_2008)

@test isapprox(var_dec(:EAUS_RER,[:EA_EPSR,:EA_EPSRP,:US_EPSTAUN]) * 100, [22.15, 54.99, 0.03],rtol = 1e-3)
@test isapprox(var_dec(:EA_Y,[:EA_EPSR,:EA_EPSZ,:US_EPSZ]) * 100, [50.02, 13.54, 4.35],rtol = 1e-3)
@test isapprox(var_dec(:US_K,[:EA_EPSRP,:US_EPSR,:US_EPSZ]) * 100, [17.48, 26.83, 27.76],rtol = 1e-3)

NAWM_EAUS_2008 = nothing


include("models/SGU_2003_debt_premium.jl")
moments = get_moments(SGU_2003_debt_premium, derivatives = false)

@test isapprox(moments[1][4:8],[0.7442,exp(0.00739062),exp(-1.07949),exp(1.22309),exp(-3.21888)],rtol = 1e-5)

corrr = get_correlation(SGU_2003_debt_premium)

@test isapprox(corrr(:i,:r),0.0114,rtol = 1e-3)
@test isapprox(corrr(:i,:k),0.4645,rtol = 1e-3)

SGU_2003_debt_premium = nothing


include("models/Baxter_and_King_1993.jl")
moments = get_moments(Baxter_and_King_1993, derivatives = false)

@test isapprox(moments[1][end-1:end],[0.334599,5.29504],rtol = 1e-3)

corrr = get_correlation(Baxter_and_King_1993)

@test isapprox(corrr(:k,:l),0.8553,rtol = 1e-3)
@test isapprox(corrr(:r,:w),-0.9898,rtol = 1e-3)

Baxter_and_King_1993 = nothing




include("models/JQ_2012_RBC.jl")
moments = get_moments(JQ_2012_RBC, derivatives = false)

@test isapprox(moments[1][1:6],[1.01158,3.63583,0.811166,0.114801,0.251989,10.0795],rtol = 1e-5)

var_dec = get_variance_decomposition(JQ_2012_RBC)

@test isapprox(var_dec(:R,:) * 100, [67.43,32.57],rtol = 1e-4)
@test isapprox(var_dec(:k,:) * 100, [17.02,82.98],rtol = 1e-4)
@test isapprox(var_dec(:c,:) * 100, [13.12,86.88],rtol = 1e-4)

JQ_2012_RBC = nothing



include("models/Ireland_2004.jl")
moments = get_moments(Ireland_2004, derivatives = false)

@test isapprox(moments[2],[0.0709,0.0015,0.0077,0.0153,0.0075,0.0163,0.0062],atol = 1e-4)

var_dec = get_variance_decomposition(Ireland_2004)

@test isapprox(var_dec(:π̂,:) * 100, [4.51, 0.91, 87.44, 7.14],rtol = 1e-4)

Ireland_2004 = nothing




include("models/GNSS_2010.jl")
moments = get_moments(GNSS_2010, derivatives = false)

@test isapprox(moments[1]([:x,:C,:Y,:D,:BE,:BH,:B],:),exp.([0.182322,0.1305,0.273583,1.04257,0.674026,0.144027,1.13688]),rtol = 1e-5)

var_dec = get_var_decomp(GNSS_2010)

@test isapprox(var_dec(:B,:) * 100, [42.97, 19.31, 11.70,  0.36,  4.45,  1.41,  0.70,  0.00,  0.61,  12.54, 2.85, 2.72,  0.38],rtol = 1e-3)

GNSS_2010 = nothing





include("models/Ghironi_Melitz_2005.jl")
moments = get_moments(Ghironi_Melitz_2005, derivatives = false)

@test isapprox(moments[1]([:Nd,:Nd̄,:Ne,:Nē,:Nx,:Nx̄],:),[7.50695, 7.50695,0.192486, 0.192486, 1.57988, 1.57988],rtol = 1e-5)

var_dec = get_var_decomp(Ghironi_Melitz_2005)

@test isapprox(var_dec(:z̃x,:) * 100, [96.05, 3.95],rtol = 1e-3)
@test isapprox(var_dec(:C,:) * 100, [99.86, 0.14],rtol = 1e-3)
@test isapprox(var_dec(:Nx,:) * 100, [29.27, 70.73],rtol = 1e-3)

Ghironi_Melitz_2005 = nothing



include("models/Gali_Monacelli_2005_CITR.jl")
moments = get_moments(Gali_Monacelli_2005_CITR, derivatives = false)

@test isapprox(moments[2]([:a,:r,:s,:pi],:),[2.2942, 0.4943, 2.7590, 0.3295],atol = 1e-4)

var_dec = get_var_decomp(Gali_Monacelli_2005_CITR)

@test isapprox(var_dec(:pih,:) * 100, [62.06, 37.94],rtol = 1e-3)
@test isapprox(var_dec(:x,:) * 100, [56.22, 43.78],rtol = 1e-3)

Gali_Monacelli_2005_CITR = nothing





include("models/Gali_2015_chapter_3_nonlinear.jl")
moments = get_moments(Gali_2015_chapter_3_nonlinear, derivatives = false)

@test isapprox(moments[1]([:C,:N,:M_real,:Y],:),[0.95058, 0.934655, 0.915236, 0.95058],rtol = 1e-5)

var_dec = get_var_decomp(Gali_2015_chapter_3_nonlinear)

@test isapprox(var_dec(:C,:) * 100, [27.53, 0.72,  71.76],rtol = 1e-3)
@test isapprox(var_dec(:R,:) * 100, [15.37, 0.23, 84.40],rtol = 1e-3)
@test isapprox(var_dec(:Y,:) * 100, [27.53, 0.72, 71.76],rtol = 1e-3)

Gali_2015_chapter_3_nonlinear = nothing




include("models/Caldara_et_al_2012.jl")
moments = get_moments(Caldara_et_al_2012, derivatives = false)

@test isapprox(moments[1]([:Rᵏ,:V,:c,:i],:),[0.00908174, 0.687139, 0.724731, 0.18689],rtol = 1e-5)

@test isapprox(moments[2]([:Rᵏ,:V,:c,:i],:),[0.0022, 0.0061, 0.0566, 0.0528],atol = 1e-4)

Caldara_et_al_2012 = nothing




include("models/Ascari_Sbordone_2014.jl")
moments = get_moments(Ascari_Sbordone_2014, derivatives = false)

@test isapprox(log.(moments[1]([:i,:y,:psi,:phi],:)),[-4.59512, -1.09861, 1.25138, 1.35674],rtol = 1e-4)

var_dec = get_var_decomp(Ascari_Sbordone_2014)

@test isapprox(var_dec(:w,:) * 100, [2.02, 95.18, 2.80],rtol = 1e-3)
@test isapprox(var_dec(:y,:) * 100, [0.47, 99.41, 0.12],rtol = 1e-3)

Ascari_Sbordone_2014 = nothing



include("models/Aguiar_Gopinath_2007.jl")
moments = get_moments(Aguiar_Gopinath_2007, derivatives = false)

@test isapprox(moments[1]([:b,:c,:u,:ul],:),[0.0645177, 0.496156, -1.66644, -1.597],rtol = 1e-5)

var_dec = get_var_decomp(Aguiar_Gopinath_2007)

@test isapprox(var_dec(:c,:) * 100, [0.02, 99.98],rtol = 1e-3)
@test isapprox(var_dec(:i_y,:) * 100, [0.31, 99.69],rtol = 1e-3)

Aguiar_Gopinath_2007 = nothing