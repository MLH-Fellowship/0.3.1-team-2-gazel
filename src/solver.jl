using DifferentialEquations
#here t denotes sensitivity, 0.3 is a constant which can be changed later after testing
eqn(i,p,s) =  i * 0.3
#I've taken u0 to as 0.0, whereas this should be the current intensity value
i0 = 0.0
#=this would just generate a sol object from which any value of intensity corresponding to
a certain sensitivity value can be generated
eg :  sol(115)
=#
s_span = (0.0,100.0)
#I've taken a value of 1/3.0; might have to change this after testing
prob = ODEProblem(eqn,i0,s_span)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8, dt=0.1)
print(sol)
#=
On printing sol, you'll find 2 lists, one for t, one for u
here t is s
u is intensity
=#

println(sol(3.0))
