# `MacroModelling.jl`

**Author: Thore Kockerols (@thorek1)**

`MacroModelling.jl` is a package for developing and solving dynamic stochastic general equilibrium (DSGE) models. The package provides functions for creating, calibrating, simulating and estimating discrete-time DSGE models. These kind of models are typicaly used to decsribe the behaviour of a macroeconomy and are particularly suited for counterfactual analysis (economic policy evaluation) and exploring/quantifying specific mechanisms (academic research). These models are difficult to work with because they consist of a nonlinear system of equations describing a stochastic control problem.

The goal of `MacroModelling.jl` is to reduce coding time and speed up model development.

As of now the package can:

- parse a model written with user friendly syntax (variables are followed by time indices `...[2], [1], [0], [-1], [-2]...`, or `[x]` for shocks)
- (tries to) solve the model only knowing the model equations and parameter values (no steady state file needed)
- calculate first, second, and third order perturbation solutions using (forward or reverse-mode) automatic differentiation (AD)
- calculate (generalised) impulse response functions, simulate the model, or do conditional forecasts
- calibrate parameters using (non stochastic) steady state relationships
- match model moments
- estimate the model on data (Kalman filter using first order perturbation)
- **differentiate** (forward AD) the model solution (first order perturbation), Kalman filter loglikelihood (reverse-mode AD), model moments, steady state, **with respect to the parameters**

The package is not:

- guaranteed to find the non stochastic steady state
- the fastest package around if you already have a fast way to find the NSSS

The former has to do with the fact that solving systems of nonlinear equations is hard (an active area of research). Especially in cases where the values of the solution are far apart (have a high standard deviation - e.g. `sol = [-46.324, .993457, 23523.3856]`), the algorithms have a hard time finding a solution. The recommended way to tackle this is to set bounds in the [`@parameters`](@ref) part (e.g. `r < 0.2`), so that the initial points are closer to the final solution (think of steady state interest rates not being higher than 20% - meaning not being higher than 0.2 or 1.2 depending on the definition).

The latter has to do with the fact that julia code is fast once compiled, and that the package can spend more time finding the non stochastic steady state. This means that it takes more time from executing the code to define the model and parameters for the first time to seeing the first plots than with most other packages. But, once the functions are compiled and the non stochastic steady state has been found the user can benefit from the object oriented nature of the package and generate outputs or change parameters very fast.

The package contains the following models in the `models` folder:

- [Aguiar and Gopinath (2007)](https://www.journals.uchicago.edu/doi/10.1086/511283) `Aguiar_Gopinath_2007.jl`
- [Ascari and Sbordone (2014)](https://www.aeaweb.org/articles?id=10.1257/jel.52.3.679) `Ascari_sbordone_2014.jl`
- [Backus, Kehoe, and Kydland (1992)](https://www.jstor.org/stable/2138686) `Backus_Kehoe_Kydland_1992`
- [Baxter and King (1993)](https://www.jstor.org/stable/2117521) `Baxter_and_King_1993.jl`
- [Caldara et al. (2012)](https://www.sciencedirect.com/science/article/abs/pii/S1094202511000433) `Caldara_et_al_2012.jl`
- [Gali (2015)](https://press.princeton.edu/books/hardcover/9780691164786/monetary-policy-inflation-and-the-business-cycle) - Chapter 3 `Gali_2015_chapter_3_nonlinear.jl`
- [Gali and Monacelli (2005)](https://crei.cat/wp-content/uploads/users/pages/roes8739.pdf) - CPI inflation-based Taylor rule `Gali_Monacelli_2005_CITR.jl`
- [Gerali, Neri, Sessa, and Signoretti (2010)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1538-4616.2010.00331.x) `GNSS_2010.jl`
- [Ghironi and Melitz (2005)](https://faculty.washington.edu/ghiro/GhiroMeliQJE0805.pdf) `Ghironi_Melitz_2005.jl`
- [Ireland (2004)](http://irelandp.com/pubs/tshocksnk.pdf) `Ireland_2004.jl`
- [Jermann and Quadrini (2012)](https://www.aeaweb.org/articles?id=10.1257/aer.102.1.238) - RBC `JQ_2012_RBC.jl`
- [New Area-Wide Model (2008)](https://www.ecb.europa.eu/pub/pdf/scpwps/ecbwp944.pdf) - Euro Area - US `NAWM_EAUS_2008.jl`
- [Schmitt-Grohé and Uribe (2003)](https://www.sciencedirect.com/science/article/abs/pii/S0022199602000569) - debt premium `SGU_2003_debt_premium.jl`
- [Schorfheide (2000)](https://onlinelibrary.wiley.com/doi/abs/10.1002/jae.582) `FS2000.jl`
- [Smets and Wouters (2003)](https://onlinelibrary.wiley.com/doi/10.1162/154247603770383415) `SW03.jl`
- [Smets and Wouters (2007)](https://www.aeaweb.org/articles?id=10.1257/aer.97.3.586) `SW07.jl`

## Comparison with other packages

||MacroModelling.jl|[dynare](https://www.dynare.org)|[RISE](https://github.com/jmaih/RISE_toolbox)|[NBTOOLBOX](https://github.com/Coksp1/NBTOOLBOX/tree/main/Documentation)|[IRIS](https://iris.igpmn.org)|[DSGE.jl](https://github.com/FRBNY-DSGE/DSGE.jl)|[StateSpaceEcon.jl](https://bankofcanada.github.io/DocsEcon.jl/dev/)|[SolveDSGE.jl](https://github.com/RJDennis/SolveDSGE.jl)|[dolo.py](https://www.econforge.org/dolo.py/)|[DifferentiableStateSpaceModels.jl](https://github.com/HighDimensionalEconLab/DifferentiableStateSpaceModels.jl)|[gEcon](http://gecon.r-forge.r-project.org)|[GDSGE](https://www.gdsge.com)|[Taylor Projection](https://sites.google.com/site/orenlevintal/taylor-projection)
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
**Host language**|julia|MATLAB|MATLAB|MATLAB|MATLAB|julia|julia|julia|Python|julia|R|MATLAB|MATLAB|
**Non stochastic steady state solver**|*symbolic* or numerical solver of independent blocks; symbolic removal of variables redundant in steady state; inclusion of calibration equations in problem|numerical solver of independent blocks or user-supplied values/functions|numerical solver of independent blocks or user-supplied values/functions|user-supplied steady state file or numerical solver|numerical solver of independent blocks or user-supplied values/functions||numerical solver of independent blocks or user-supplied values/functions|numerical solver|numerical solver or user supplied values/equations|numerical solver or user supplied values/equations|numerical solver; inclusion of calibration equations in problem|||
**Automatic declaration of variables and parameters**|yes|||||||||||||
**Derivatives (Automatic Differentiation) wrt parameters**|yes|||||||||yes - for all 1st, 2nd order perturbation solution related output *if user supplied steady state equations*|||
**Perturbation solution order**|1, 2, 3|k|1 to 5|1|1|1|1|1, 2, 3|1, 2, 3|1, 2|1||1 to 5|
**Automatic derivation of first order conditions**|||||||||||yes||
**Handles occasionally binding constraints**||yes|yes|||yes||yes|yes|||yes||
**Global solution**||||||||yes|yes|||yes||
**Estimation**|yes|yes|yes|yes|yes|yes|||||yes|||
**Balanced growth path**||yes|yes|yes|yes|yes|yes|||||||
**Model input**|macro (julia)|text file|text file|text file|text file|text file|module (julia)|text file|text file|macro (julia)|text file|text file|text file|
**Timing convention**|end-of-period|end-of-period|end-of-period|end-of-period|end-of-period||end-of-period|start-of-period|end-of-period|start-of-period|end-of-period|start-of-period|start-of-period|

## Bibliography

Durbin, J, and Koopman, S. J. (2012), "Time Series Analysis by State Space Methods, 2nd edn", Oxford University Press.

Levintal, O., (2017), "Fifth-Order Perturbation Solution to DSGE models", Journal of Economic Dynamics and Control, 80, pp. 1---16.

Villemot, S., (2011), "Solving rational expectations models at first order: what Dynare does", Dynare Working Papers 2, CEPREMAP.
