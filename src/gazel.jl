module gazel
include("feed.jl")
include("cal_contr.jl")
include("control.jl")



function __init__()
    #check_deps()

    # Get the name of the display
    display = _getDisplay()

    # setup constants
    eqn(i,p,s) =  i * 0.3
    i0 = 0.5
    s_span = (0.0,10.0)

    # setup problem
    prob = ODEProblem(eqn,i0,s_span)

    # solve the ODE and convert the descretized soln into an array
    sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8, dt=0.1, save_everystep=true)
    arsol = Array(sol)
    
    # start the feed
    _start(display, arsol)

end

end # Gazel
