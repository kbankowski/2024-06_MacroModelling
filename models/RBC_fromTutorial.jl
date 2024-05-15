using MacroModelling

@model RBC_fromTutorial begin
    1  /  c[0] = (β  /  c[1]) * (α * exp(z[1]) * k[0]^(α - 1) + (1 - δ))

    c[0] + k[0] = (1 - δ) * k[-1] + q[0]

    q[0] = exp(z[0]) * k[-1]^α

    z[0] = ρᶻ * z[-1] + σᶻ * ϵᶻ[x]
end

@parameters RBC_fromTutorial begin
    σᶻ= 0.01
    ρᶻ= 0.2
    δ = 0.02
    α = 0.5
    β = 0.95
end