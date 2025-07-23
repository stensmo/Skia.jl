# Examples

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

    sk_write_data_to_file("simple_drawing_example.png", png)

    Skia.SwapBuffers(GLFW, window)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.WaitEvents()
    end

    GLFW.DestroyWindow(window)

end

```

```julia

using Skia
using GLFW



function draw(canvas) 

   
    
    #SkPaint paint;
    paint = sk_paint_new()


    #paint.setStyle(SkPaint::kStroke_Style);
    sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_STROKE)

    #paint.setAntiAlias(true);
    sk_paint_set_antialias(paint, true)

    #paint.setStrokeWidth(8);
    sk_paint_set_stroke_width(paint, 8f0)

    sk_paint_set_stroke_cap(paint, Skia.SK_STROKE_CAP_ROUND)

    #paint.setColor(0xff4285F4);
    sk_paint_set_color(paint, 0xff4285F4::UInt32)

    colorBackground::UInt32 = 0xFFFFFFFF::UInt32
    sk_canvas_clear(canvas, colorBackground )
    
    path = sk_path_new()
    sk_path_move_to(path, 10f0, 10f0)
    sk_path_quad_to(path, 256f0, 64f0, 128f0, 128f0)
    sk_path_quad_to(path, 10f0, 192f0, 250f0, 250f0)

    sk_canvas_draw_path(canvas, path, paint)



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

    sk_write_data_to_file("bezier_curves.png", png)

    Skia.SwapBuffers(GLFW, window)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.WaitEvents()
    end

    GLFW.DestroyWindow(window)

end

```

```julia
using Skia
using GLFW

function star()

    path = sk_path_new()

    R = 115.2f0
    C = 128.0f0
 
    sk_path_move_to(path, C + R, C)
  
    for i=1:8
        a::Float32 = 2.6927937f0 * i;
        
        sk_path_line_to(path, C + R * cos(a), C + R * sin(a))

    end
    return path;
end


function draw(canvas) 

   
    
    #SkPaint paint;
    paint = sk_paint_new()


    sk_paint_set_path_effect(paint, sk_path_effect_create_discrete(10.0f0, 4.0f0, UInt32(0)))


    #paint.setStyle(SkPaint::kStroke_Style);
    sk_paint_set_style(paint, Skia.SK_PAINT_STYLE_STROKE)

    #paint.setAntiAlias(true);
    sk_paint_set_antialias(paint, true)

    #paint.setStrokeWidth(2);
    sk_paint_set_stroke_width(paint, 2.0f0)

    #paint.setColor(0xff4285F4);
    sk_paint_set_color(paint, 0xff4285F4::UInt32)

    colorBackground::UInt32 = 0xFFFFFFFF::UInt32
    sk_canvas_clear(canvas, colorBackground )
    
    path = star()

    sk_canvas_draw_path(canvas, path, paint)



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

    sk_write_data_to_file("path_effects.png", png)

    Skia.SwapBuffers(GLFW, window)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.WaitEvents()
    end

    GLFW.DestroyWindow(window)

end
```

```julia
using Skia
using GLFW


function draw(canvas) 

    fontmgr = sk_fontmgr_ref_default()

    weight::Int32 = Int32(Skia.SK_FONT_STYLE_WEIGHT_NORMAL)
    width::Int32 = Int32(Skia.SK_FONT_STYLE_WIDTH_NORMAL)

    fontStyle = sk_fontstyle_new( weight, width, Skia.SK_FONT_STYLE_SLANT_UPRIGHT)
    typeface = sk_fontmgr_match_family_style(fontmgr, Skia.getDefaultFont(), fontStyle)

    #const char* fontFamily = nullptr;  // Default system family, if it exists.
    #SkFontStyle fontStyle;  // Default is normal weight, normal width,  upright slant.

    #sk_sp<SkTypeface> typeface = fontMgr->legacyMakeTypeface(fontFamily, fontStyle);

    #SkFont font1(typeface, 64.0f, 1.0f, 0.0f);
    font1 = sk_font_new_with_values(typeface, 64.0f0, 1.0f0, 0.0f0)

    #SkFont font2(typeface, 64.0f, 1.5f, 0.0f);
    font2 = sk_font_new_with_values(typeface, 64.0f0, 1.5f0, 0.0f0)


    #font1.setEdging(SkFont::Edging::kAntiAlias);
    # Not yet supported in Skia.jl. Fortunately AntiAlias is default


    #font2.setEdging(SkFont::Edging::kAntiAlias);
    # Not yet supported in Skia.jl. Fortunately AntiAlias is default

    # Note: MakeFromString may fail to produce expected results if the typeface
    # does not have glyphs for the characters in the string.  The characters
    # will not be kerned or shaped beyond a simple mapping from one Unicode
    # code point to one glyph with a default advance.
    #sk_sp<SkTextBlob> blob1 = SkTextBlob::MakeFromString("Skia", font1);
    blob1 = sk_textblob_make_from_string("Skia", font1, sk_text_encoding_t(0))
    #sk_sp<SkTextBlob> blob2 = SkTextBlob::MakeFromString("Skia", font2);
    blob2 = sk_textblob_make_from_string("Skia", font2, sk_text_encoding_t(0))



    paint1 = sk_paint_new()
    paint2 = sk_paint_new()
    paint3 = sk_paint_new()

    sk_paint_set_antialias(paint1, true)
    #paint1.setColor(SkColorSetARGB(0xFF, 0x42, 0x85, 0xF4))
    sk_paint_set_color(paint1, 0xff4285F4::UInt32)

    sk_paint_set_antialias(paint2, true)
    #paint2.setColor(SkColorSetARGB(0xFF, 0xDB, 0x44, 0x37));
    sk_paint_set_color(paint2, 0xffDB4437::UInt32)

    #paint2.setStyle(SkPaint::kStroke_Style);
    sk_paint_set_style(paint2, Skia.SK_PAINT_STYLE_STROKE)
    #paint2.setStrokeWidth(3.0f);
    sk_paint_set_stroke_width(paint2, 3.0f0)

    sk_paint_set_antialias(paint3, true)
    #paint3.setColor(SkColorSetARGB(0xFF, 0x0F, 0x9D, 0x58));
    sk_paint_set_color(paint3, 0xff0f9d58::UInt32)


    colorBackground::UInt32 = 0xFFFFFFFF::UInt32
    sk_canvas_clear(canvas, colorBackground )
    #canvas->drawTextBlob(blob1.get(), 20.0f, 64.0f, paint1);
    sk_canvas_draw_text_blob(canvas, blob1, 20.0f0, 64.0f0, paint1)
    #canvas->drawTextBlob(blob1.get(), 20.0f, 144.0f, paint2);
    sk_canvas_draw_text_blob(canvas, blob1, 20.0f0, 144.0f0, paint2)
    #canvas->drawTextBlob(blob2.get(), 20.0f, 224.0f, paint3);
    sk_canvas_draw_text_blob(canvas, blob2, 20.0f0, 224.0f0, paint3)



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

    sk_write_data_to_file("text_rendering.png", png)

    Skia.SwapBuffers(GLFW, window)
    
    while !GLFW.WindowShouldClose(window)
        GLFW.WaitEvents()
    end

    GLFW.DestroyWindow(window)

end
```

Animate an ODE in real time (no need to record a movie)

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

fileWstream = sk_file_wstream_new("CreatePDFExample.pdf")

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