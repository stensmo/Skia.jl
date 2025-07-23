# Skia in Julia

Support for the Skia libary in Julia. Draw 2D drawings using GPU (OpenGL). Skia is the 2D drawing library used by Chrome and other browsers to draw web pages. The library is suited for, e.g., real time plotting/visualization on all platforms. 

Currently, it works on Linux, Mac and FreeBSD. Windows support is coming. Metal will be supported in the future as well as Vulkan.

```julia

using Skia
using GLFW

function draw(canvas) 



    #canvas->drawColor(SK_ColorWHITE);
    colorBackground::UInt32 = 0xFFFFFFFF::UInt32
    sk_canvas_clear(canvas, colorBackground )

   
    
    #SkPaint paint;
    paint = sk_paint_new()
    #paint.setStyle(SkPaint::kFill_Style);
    sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_FILL)

    #paint.setAntiAlias(true);
    sk_paint_set_antialias(paint, true)

    #paint.setStrokeWidth(4);
    sk_paint_set_stroke_width(paint, 4.0f0)

    
    #paint.setColor(0xff4285F4);
    sk_paint_set_color(paint, 0xff4285F4::UInt32)


    #SkRect rect = SkRect::MakeXYWH(10, 10, 100, 160);
    rect = sk_rect_makexywh(10.0f0, 10.0f0, 100.0f0, 160.0f0)


    #canvas->drawRect(rect, paint);
    sk_canvas_draw_rect(canvas, rect, paint)


    #SkRRect oval;
    #oval.setOval(rect);
    #oval.offset(40, 80);
    oval = sk_rect_makexywh(50.0f0, 90.0f0, 100.0f0, 160.0f0)
    #paint.setColor(0xffDB4437);
    sk_paint_set_color(paint, 0xffDB4437::UInt32)
    #canvas->drawRRect(oval, paint);
    sk_canvas_draw_oval(canvas, oval, paint)

    #paint.setColor(0xff0F9D58);
    sk_paint_set_color(paint, 0xff0F9D58::UInt32)
    
    #canvas->drawCircle(180, 50, 25, paint);
    sk_canvas_draw_circle(canvas, 180.0f0, 50.0f0, 25.0f0, paint)

    #rect.offset(80, 50);
    rect = sk_rect_offset(rect, 80.0f0, 50.0f0)

    #paint.setColor(0xffF4B400);
    sk_paint_set_color(paint, 0xffF4B400::UInt32)

    #paint.setStyle(SkPaint::kStroke_Style);
    sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_STROKE)

    #canvas->drawRoundRect(rect, 10, 10, paint);
    sk_canvas_draw_round_rect(canvas, rect, 10.0f0, 10.0f0, paint)
end



function main()
    WIDTH::Int32 = 512
    HEIGHT::Int32 = 512
    window, sContext, canvas, surface = Skia.init_GLFW(GLFW, WIDTH, HEIGHT)
    draw(canvas)
    Skia.gr_direct_context_flush_and_submit(sContext, false)

    snapshot = sk_surface_make_image_snapshot(surface)

    
    compression_level::Int32 = 100
    png = sk_encode_png(sContext, snapshot, compression_level)

    sk_write_data_to_file("skia_output.png", png)

    Skia.SwapBuffers(GLFW, window)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.WaitEvents()
    end

    GLFW.DestroyWindow(window)

end

```


```julia

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


```

This is how you can use Skia to create a PDF

```julia
using Skia

page_width::Float32 = 800
page_height::Float32 = 800

timeZoneMinutes::Int16 = 0
year::UInt16 = 2025
month::UInt8 = 06

dayOfWeek::UInt8 = 01
day::UInt8 = 1
hour::UInt8 = 2
minute::UInt8 = 3
second::UInt8 = 4



creation = sk_date_time_t(timeZoneMinutes, year, month, dayOfWeek, day, hour, minute, second)

modified = sk_date_time_t(timeZoneMinutes, year, month, dayOfWeek, day, hour, minute, second)
dpi = 300
encodingQuality = 1

metadata = Ref(sk_metadata_t(pointer("title"), pointer("author"), pointer("subject"), pointer("keywords"), pointer("creator"), pointer("producer"), creation, modified, dpi, 0, encodingQuality))

fileWstream = sk_file_wstream_new("test.pdf")

stream = sk_file_wstream_as_wstream(fileWstream)

document = sk_document_make_pdf(stream, metadata)
canvas = sk_document_begin_page(document, page_width, page_height)

paint = sk_paint_new()
rect = Ref(sk_rect_t(100, 200, 300, 500))

paintColor::UInt32 = 0xFF0000FF

sk_paint_set_color(paint, paintColor)

	
sk_canvas_draw_rect(canvas,rect, paint)

sk_document_end_page(document)

sk_document_close(document)

sk_file_wstream_flush(fileWstream)

```
