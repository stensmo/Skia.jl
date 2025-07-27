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

fontmgr = sk_fontmgr_ref_default()

weight::Int32 = Int32(Skia.SK_FONT_STYLE_WEIGHT_NORMAL)
width::Int32 = Int32(Skia.SK_FONT_STYLE_WIDTH_NORMAL)

fontStyle = sk_fontstyle_new( weight, width, Skia.SK_FONT_STYLE_SLANT_UPRIGHT)
typeface = sk_fontmgr_match_family_style(fontmgr, Skia.getDefaultFont(), fontStyle)

font = sk_font_new_with_values(typeface, 64.0f0, 1.0f0, 0.0f0)

blob1 = sk_textblob_make_from_string("Hello Skia from Julia!", font, sk_text_encoding_t(0))

paint = sk_paint_new()
rect = Ref(sk_rect_t(100, 200, 300, 500))

paintColor::UInt32 = 0xFF0000FF

sk_paint_set_color(paint, paintColor)

	
sk_canvas_draw_rect(canvas,rect, paint)

sk_canvas_draw_text_blob(canvas, blob1, 20.0f0, 64.0f0, paint)

sk_document_end_page(document)

sk_document_close(document)

sk_file_wstream_flush(fileWstream)

sk_file_wstream_delete(fileWstream);


