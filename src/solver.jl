using DifferentialEquations
using DataStructures
#here t denotes sensitivity, 0.3 is a constant which can be changed later after testing
eqn(i,p,s) =  i * 0.3
i0 = 0.5  #intial brightness
#=this would just generate a sol object from which any value of intensity corresponding to
a certain sensitivity value can be generated
eg :  sol(115)
=#
s_span = (0.0,10.0)
#I've taken a value of 1/3.0; might have to change this after testing
prob = ODEProblem(eqn,i0,s_span)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8, dt=0.1, save_everystep=true)
print(sol)
#=
On printing sol, you'll find 2 lists, one for t, one for u
here t is s
u is intensity
=#
arsol = Array(sol)
println(arsol)        #solution array

#############
#This part should logically be in  a different script. Will break down while integration
#############
#I've assumed my current intensity to be 1.0, hence i computed its index
searchsortedfirst(arsol,1.0) #result 12
#Assumed required intensity to be 7.0 (Note : intensity can't be more than 10); will have to discuss solution handling
searchsortedfirst(arsol,7.0) # result 34
 #now iterate through 12 to 34 and change brightness accordingly
