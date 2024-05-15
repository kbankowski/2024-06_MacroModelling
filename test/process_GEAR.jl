using MacroModelling
using DynarePreprocessor_jll
using JSON

translate_mod_file("models/GEAR_baseline.mod")

include("../models/GEAR_baseline_adj.jl")