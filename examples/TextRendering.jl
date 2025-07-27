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
    sk_font_set_edging(font1, Skia.SK_FONT_EDGING_SUBPIXEL_ANTIALIAS)

    #font2.setEdging(SkFont::Edging::kAntiAlias);
     sk_font_set_edging(font2, Skia.SK_FONT_EDGING_SUBPIXEL_ANTIALIAS)
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