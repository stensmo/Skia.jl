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