using Skia
using Test




@testset "PDF Test" begin


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

fontmgr = sk_fontmgr_ref_default()

  noFamilies= sk_fontmgr_count_families(fontmgr)
  println("No families: $noFamilies")

  refFamilyName = sk_string_new_empty()

  for i=0:noFamilies-1


	sk_fontmgr_get_family_name(fontmgr, Int32(i), refFamilyName)

	famName = unsafe_string(sk_string_get_c_str(refFamilyName))
	println("Font famility: $(famName)")


  end




 font_size::Float32 = 14.0
  scaleX::Float32 = 1.0
  skewX::Float32 = 0.0


weight::Int32 = Int32(Skia.SK_FONT_STYLE_WEIGHT_NORMAL)
width::Int32 = Int32(Skia.SK_FONT_STYLE_WIDTH_NORMAL)

fontStyle = sk_fontstyle_new( weight, width, Skia.SK_FONT_STYLE_SLANT_UPRIGHT)

typeface = sk_fontmgr_match_family_style(fontmgr, "Arial", fontStyle)
println(typeface)

font = sk_font_new_with_values(typeface, font_size, scaleX, skewX)
println(font)


x::Float32 = 60.0
y::Float32 = 60.0



paintColor::UInt32 = 0xFF0000FF

sk_paint_set_color(paint, paintColor)

sk_canvas_draw_string(canvas, str, x, y, font, paint)

sk_canvas_draw_string(canvas, str, x, y+100.0, font, paint)

	
sk_canvas_draw_rect(canvas,rect, paint)

sk_document_end_page(document)

sk_document_close(document)

sk_file_wstream_flush(fileWstream)

@test isfile("test.pdf")


end

