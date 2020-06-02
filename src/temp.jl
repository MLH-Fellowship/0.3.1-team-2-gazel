using DifferentialEquations
function control_eq!(du,u,p,t)
 du[1] = u[2]
 du[2] = (p[4] - (p[3] + p[4]) * u[1] - p[2] * u[2])/p[1]
end
u0 = [0.0,0.0]
tspan = (0.0,100.0)
p = [1.0,1.0,1.0,0.4]
prob = ODEProblem(control_eq!,u0,tspan,p)
sol = solve(prob)
print(sol)
