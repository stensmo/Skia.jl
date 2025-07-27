using Skia

page_width::Float32 = 800
page_height::Float32 = 800

function draw(canvas, font) 



    blob1 = sk_textblob_make_from_string("Hello Skia from Julia!", font, sk_text_encoding_t(0))


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

    sk_canvas_draw_text_blob(canvas, blob1, 200.0f0, 300.0f0, paint)

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




fileWstream = sk_file_wstream_new("CreateSVGExample.svg")

stream = sk_file_wstream_as_wstream(fileWstream)

bounds = Ref(sk_rect_t(0, 0, 800, 800))

flags = UInt32(0)


canvas = sk_surface_make_canvas_svg(bounds, stream, flags)

fontmgr = sk_fontmgr_ref_default()
weight::Int32 = Int32(Skia.SK_FONT_STYLE_WEIGHT_NORMAL)
width::Int32 = Int32(Skia.SK_FONT_STYLE_WIDTH_NORMAL)

fontStyle = sk_fontstyle_new( weight, width, Skia.SK_FONT_STYLE_SLANT_UPRIGHT)
typeface = sk_fontmgr_match_family_style(fontmgr, Skia.getDefaultFont(), fontStyle)

font = sk_font_new_with_values(typeface, 64.0f0, 1.0f0, 0.0f0)


draw(canvas, font)


sk_file_wstream_flush(fileWstream)

sk_file_wstream_delete(fileWstream);


