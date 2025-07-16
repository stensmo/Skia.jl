
# Do not benchmark this code. It uses vsync to lock to your monitor refresh rate for easy visualization/animation. vsync can easily be turned off

using  OrdinaryDiffEq, DiffEqCallbacks

using Skia
using GLFW


# Diff Eq for a ball
function f(du, u, p, t)
    du[1] = u[2]
    du[2] = -p[1]
end

function condition(u, t, integrator) # Event when condition(u,t,integrator) == 0
    u[1]
end

function affect!(integrator)
    integrator.u[2] = -integrator.p[2]*integrator.u[2]
end

cb = ContinuousCallback(condition, affect!)

u0 = [1.0, 0.0]
tspan = (0.0, 4.0)
p = [9.8, 0.8]
prob = ODEProblem(f, u0, tspan, p)


sol = solve(prob, Tsit5(), callback = cb, dtmax=Skia.getMonitorTimeStep(GLFW))


function runLoop(u, canvas, paint, sContext)


    x::Float32 = 100.0
    y::Float32 = 100.0
    radius::Float32 = 50.0

    vectorLen = length(u)

    for timeStep = 1:vectorLen


        GLFW.PollEvents()

        colorBackground::UInt32 = 0xFF000000::UInt32
        sk_canvas_clear(canvas, colorBackground )

        y=500.0-u[timeStep][1]*400.0
        x=300.0
        
   
        paintColorBall::UInt32 = 0xFF00FF00::UInt32

        sk_paint_set_color(paint, paintColorBall)

        sk_canvas_draw_circle(canvas, x, y, radius, paint)


        Skia.gr_direct_context_flush_and_submit(sContext, false)

        # Swap front and back buffers

        Skia.SwapBuffers(GLFW, window)

    
    end

end


WIDTH::Int32 = 960
HEIGHT::Int32 = 640

window, sContext, canvas = Skia.init_GLFW(GLFW, WIDTH, HEIGHT)


paint = sk_paint_new()

sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_FILL)

runLoop(sol.u, canvas, paint, sContext)

GLFW.DestroyWindow(window)

