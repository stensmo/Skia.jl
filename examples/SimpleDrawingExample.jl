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