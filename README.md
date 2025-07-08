# Skia in Julia

Support for the Skia libary in Julia. Skia is the 2D drawing library used by Chrome and other browsers to draw web pages. The library is suited for e.g. real time plotting on all platforms. 

Currently, it works on Linux, and sample code is only provided for OpenGL. Vulkan support will be added, and hopefully Metal support as well. Mac and Windows will be added later.

```julia

using Skia
using GLFW



function runLoop()


    WIDTH::Int32 = 960
    HEIGHT::Int32 = 640

    window, sContext, canvas = Skia.init_GLFW(WIDTH, HEIGHT)


    x::Float32 = 100.0
    y::Float32 = 100.0
    radius::Float32 = 50.0


    paint = sk_paint_new()

    sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_FILL)

    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)

        GLFW.PollEvents()

        paintColor::UInt32 = 0xFF000000::UInt32
        sk_paint_set_color(paint, paintColor)

        sk_canvas_draw_circle(canvas, x, y, radius, paint)

        y+=1
        

        paintColorBall::UInt32 = 0xFF00FF00::UInt32

        
        sk_paint_set_color(paint, paintColorBall)

        sk_canvas_draw_circle(canvas, x, y, radius, paint)


        Skia.gr_direct_context_flush_and_submit(sContext, false)

        # Swap front and back buffers
        GLFW.SwapBuffers(window)

        
    end

    GLFW.DestroyWindow(window)

end


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
