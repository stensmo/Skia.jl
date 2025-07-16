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