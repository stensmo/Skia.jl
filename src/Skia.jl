module Skia

function _doc_external(fname)
    return ""
end


to_c_type(t::Type) = t
to_c_type_pairs(va_list) = map(enumerate(to_c_type.(va_list))) do (ind, type)
    :(va_list[$ind]::$type)
end

"""
$(_doc_external(:skiac_surface))
"""
mutable struct skiac_surface end

"""
$(_doc_external(:skiac_canvas))
"""
mutable struct skiac_canvas end

"""
$(_doc_external(:skiac_paint))
"""
mutable struct skiac_paint end

"""
$(_doc_external(:skiac_path))
"""
mutable struct skiac_path end

"""
$(_doc_external(:skiac_shader))
"""
mutable struct skiac_shader end

"""
$(_doc_external(:skiac_path_effect))
"""
mutable struct skiac_path_effect end

"""
$(_doc_external(:skiac_matrix))
"""
mutable struct skiac_matrix end

"""
$(_doc_external(:skiac_mask_filter))
"""
mutable struct skiac_mask_filter end

"""
$(_doc_external(:skiac_image_filter))
"""
mutable struct skiac_image_filter end

"""
$(_doc_external(:skiac_data))
"""
mutable struct skiac_data end

"""
$(_doc_external(:skiac_image))
"""
mutable struct skiac_image end

"""
$(_doc_external(:skiac_bitmap))
"""
mutable struct skiac_bitmap end

"""
$(_doc_external(:skiac_sk_string))
"""
mutable struct skiac_sk_string end

"""
$(_doc_external(:skiac_font_metrics))
"""
mutable struct skiac_font_metrics end

"""
$(_doc_external(:skiac_typeface))
"""
mutable struct skiac_typeface end

"""
$(_doc_external(:skiac_font_mgr))
"""
mutable struct skiac_font_mgr end

"""
$(_doc_external(:skiac_typeface_font_provider))
"""
mutable struct skiac_typeface_font_provider end

"""
$(_doc_external(:skiac_w_memory_stream))
"""
mutable struct skiac_w_memory_stream end

"""
$(_doc_external(:skiac_picture_recorder))
"""
mutable struct skiac_picture_recorder end

"""
$(_doc_external(:skiac_picture))
"""
mutable struct skiac_picture end

"""
$(_doc_external(:skiac_encoder))
"""
mutable struct skiac_encoder end

"""
    skiac_svg_surface

$(_doc_external(:skiac_svg_surface))
"""
struct skiac_svg_surface
    stream::Ptr{skiac_w_memory_stream}
    surface::Ptr{skiac_surface}
    canvas::Ptr{skiac_canvas}
end

"""
    skiac_font_collection

$(_doc_external(:skiac_font_collection))
"""
struct skiac_font_collection
    collection::Cint
    font_mgr::Cint
    assets::Cint
end

"""
    skiac_line_metrics

$(_doc_external(:skiac_line_metrics))
"""
struct skiac_line_metrics
    ascent::Cfloat
    descent::Cfloat
    left::Cfloat
    right::Cfloat
    width::Cfloat
    font_ascent::Cfloat
    font_descent::Cfloat
    alphabetic_baseline::Cfloat
end

"""
    skiac_rect

$(_doc_external(:skiac_rect))
"""
struct skiac_rect
    left::Cfloat
    top::Cfloat
    right::Cfloat
    bottom::Cfloat
end

"""
    skiac_transform

$(_doc_external(:skiac_transform))
"""
struct skiac_transform
    a::Cfloat
    b::Cfloat
    c::Cfloat
    d::Cfloat
    e::Cfloat
    f::Cfloat
end

"""
    skiac_point

$(_doc_external(:skiac_point))
"""
struct skiac_point
    x::Cfloat
    y::Cfloat
end

"""
    skiac_surface_data

$(_doc_external(:skiac_surface_data))
"""
struct skiac_surface_data
    ptr::Ptr{Cint}
    size::Cint
end

"""
    skiac_bitmap_info

$(_doc_external(:skiac_bitmap_info))
"""
struct skiac_bitmap_info
    bitmap::Ptr{skiac_bitmap}
    width::Cint
    height::Cint
    is_canvas::Bool
end

"""
    skiac_string

$(_doc_external(:skiac_string))
"""
struct skiac_string
    ptr::Ptr{Cchar}
    length::Cint
    sk_string::Ptr{Cint}
end

# typedef void ( * skiac_on_match_font_style ) ( int width , int weight , int slant , void * skiac_on_match_font_style_rust )
"""
$(_doc_external(:skiac_on_match_font_style))
"""
const skiac_on_match_font_style = Ptr{Cvoid}

"""
    skiac_sk_data

$(_doc_external(:skiac_sk_data))
"""
struct skiac_sk_data
    ptr::Ptr{Cint}
    size::Cint
    data::Ptr{skiac_data}
end

"""
    skiac_mapped_point

$(_doc_external(:skiac_mapped_point))
"""
struct skiac_mapped_point
    x::Cfloat
    y::Cfloat
end

"""
    skiac_clear_all_cache()

$(_doc_external(:skiac_clear_all_cache))
"""
function skiac_clear_all_cache()
    ccall((:skiac_clear_all_cache, skia2), Cvoid, ())
end

"""
    skiac_surface_create_rgba_premultiplied(width::Cint, height::Cint, cs::Cint)

$(_doc_external(:skiac_surface_create_rgba_premultiplied))
"""
function skiac_surface_create_rgba_premultiplied(width::Cint, height::Cint, cs::Cint)
    ccall((:skiac_surface_create_rgba_premultiplied, skia2), Ptr{skiac_surface}, (Cint, Cint, Cint), width, height, cs)
end

"""
    skiac_surface_create_svg(c_surface, width::Cint, height::Cint, alphaType::Cint, flag::Cint, cs::Cint)

$(_doc_external(:skiac_surface_create_svg))
"""
function skiac_surface_create_svg(c_surface, width::Cint, height::Cint, alphaType::Cint, flag::Cint, cs::Cint)
    ccall((:skiac_surface_create_svg, skia2), Cvoid, (Ptr{skiac_svg_surface}, Cint, Cint, Cint, Cint, Cint), c_surface, width, height, alphaType, flag, cs)
end

"""
    skiac_surface_create_rgba(width::Cint, height::Cint, cs::Cint)

$(_doc_external(:skiac_surface_create_rgba))
"""
function skiac_surface_create_rgba(width::Cint, height::Cint, cs::Cint)
    ccall((:skiac_surface_create_rgba, skia2), Ptr{skiac_surface}, (Cint, Cint, Cint), width, height, cs)
end

"""
    skiac_surface_destroy(c_surface)

$(_doc_external(:skiac_surface_destroy))
"""
function skiac_surface_destroy(c_surface)
    ccall((:skiac_surface_destroy, skia2), Cvoid, (Ptr{skiac_surface},), c_surface)
end

"""
    skiac_surface_copy_rgba(c_surface, x::Cint, y::Cint, width::Cint, height::Cint, cs::Cint)

$(_doc_external(:skiac_surface_copy_rgba))
"""
function skiac_surface_copy_rgba(c_surface, x::Cint, y::Cint, width::Cint, height::Cint, cs::Cint)
    ccall((:skiac_surface_copy_rgba, skia2), Ptr{skiac_surface}, (Ptr{skiac_surface}, Cint, Cint, Cint, Cint, Cint), c_surface, x, y, width, height, cs)
end

"""
    skiac_surface_get_canvas(c_surface)

$(_doc_external(:skiac_surface_get_canvas))
"""
function skiac_surface_get_canvas(c_surface)
    ccall((:skiac_surface_get_canvas, skia2), Ptr{skiac_canvas}, (Ptr{skiac_surface},), c_surface)
end

"""
    skiac_surface_get_width(c_surface)

$(_doc_external(:skiac_surface_get_width))
"""
function skiac_surface_get_width(c_surface)
    ccall((:skiac_surface_get_width, skia2), Cint, (Ptr{skiac_surface},), c_surface)
end

"""
    skiac_surface_get_height(c_surface)

$(_doc_external(:skiac_surface_get_height))
"""
function skiac_surface_get_height(c_surface)
    ccall((:skiac_surface_get_height, skia2), Cint, (Ptr{skiac_surface},), c_surface)
end

"""
    skiac_surface_read_pixels(c_surface, data)

$(_doc_external(:skiac_surface_read_pixels))
"""
function skiac_surface_read_pixels(c_surface, data)
    ccall((:skiac_surface_read_pixels, skia2), Cvoid, (Ptr{skiac_surface}, Ptr{skiac_surface_data}), c_surface, data)
end

"""
    skiac_surface_read_pixels_rect(c_surface, data, x::Cint, y::Cint, w::Cint, h::Cint, cs::Cint)

$(_doc_external(:skiac_surface_read_pixels_rect))
"""
function skiac_surface_read_pixels_rect(c_surface, data, x::Cint, y::Cint, w::Cint, h::Cint, cs::Cint)
    ccall((:skiac_surface_read_pixels_rect, skia2), Bool, (Ptr{skiac_surface}, Ptr{Cint}, Cint, Cint, Cint, Cint, Cint), c_surface, data, x, y, w, h, cs)
end

"""
    skiac_surface_png_data(c_surface, data)

$(_doc_external(:skiac_surface_png_data))
"""
function skiac_surface_png_data(c_surface, data)
    ccall((:skiac_surface_png_data, skia2), Cvoid, (Ptr{skiac_surface}, Ptr{skiac_sk_data}), c_surface, data)
end

"""
    skiac_surface_encode_data(c_surface, data, format::Cint, quality::Cint)

$(_doc_external(:skiac_surface_encode_data))
"""
function skiac_surface_encode_data(c_surface, data, format::Cint, quality::Cint)
    ccall((:skiac_surface_encode_data, skia2), Cvoid, (Ptr{skiac_surface}, Ptr{skiac_sk_data}, Cint, Cint), c_surface, data, format, quality)
end

"""
    skiac_surface_encode_stream(c_surface, format::Cint, quality::Cint, write_callback::Cint, context)

$(_doc_external(:skiac_surface_encode_stream))
"""
function skiac_surface_encode_stream(c_surface, format::Cint, quality::Cint, write_callback::Cint, context)
    ccall((:skiac_surface_encode_stream, skia2), Bool, (Ptr{skiac_surface}, Cint, Cint, Cint, Ptr{Cvoid}), c_surface, format, quality, write_callback, context)
end

"""
    skiac_surface_get_alpha_type(c_surface)

$(_doc_external(:skiac_surface_get_alpha_type))
"""
function skiac_surface_get_alpha_type(c_surface)
    ccall((:skiac_surface_get_alpha_type, skia2), Cint, (Ptr{skiac_surface},), c_surface)
end

"""
    skiac_surface_save(c_surface, path)

$(_doc_external(:skiac_surface_save))
"""
function skiac_surface_save(c_surface, path)
    ccall((:skiac_surface_save, skia2), Bool, (Ptr{skiac_surface}, Ptr{Cchar}), c_surface, path)
end

"""
    skiac_surface_get_bitmap(c_surface, info)

$(_doc_external(:skiac_surface_get_bitmap))
"""
function skiac_surface_get_bitmap(c_surface, info)
    ccall((:skiac_surface_get_bitmap, skia2), Cvoid, (Ptr{skiac_surface}, Ptr{skiac_bitmap_info}), c_surface, info)
end

"""
    skiac_canvas_clear(c_canvas, color::Cint)

$(_doc_external(:skiac_canvas_clear))
"""
function skiac_canvas_clear(c_canvas, color::Cint)
    ccall((:skiac_canvas_clear, skia2), Cvoid, (Ptr{skiac_canvas}, Cint), c_canvas, color)
end

"""
    skiac_canvas_set_transform(c_canvas, c_matrix)

$(_doc_external(:skiac_canvas_set_transform))
"""
function skiac_canvas_set_transform(c_canvas, c_matrix)
    ccall((:skiac_canvas_set_transform, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_matrix}), c_canvas, c_matrix)
end

"""
    skiac_canvas_concat(c_canvas, c_matrix)

$(_doc_external(:skiac_canvas_concat))
"""
function skiac_canvas_concat(c_canvas, c_matrix)
    ccall((:skiac_canvas_concat, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_matrix}), c_canvas, c_matrix)
end

"""
    skiac_canvas_scale(c_canvas, sx::Cfloat, sy::Cfloat)

$(_doc_external(:skiac_canvas_scale))
"""
function skiac_canvas_scale(c_canvas, sx::Cfloat, sy::Cfloat)
    ccall((:skiac_canvas_scale, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat, Cfloat), c_canvas, sx, sy)
end

"""
    skiac_canvas_translate(c_canvas, dx::Cfloat, dy::Cfloat)

$(_doc_external(:skiac_canvas_translate))
"""
function skiac_canvas_translate(c_canvas, dx::Cfloat, dy::Cfloat)
    ccall((:skiac_canvas_translate, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat, Cfloat), c_canvas, dx, dy)
end

"""
    skiac_canvas_rotate(c_canvas, degrees::Cfloat)

$(_doc_external(:skiac_canvas_rotate))
"""
function skiac_canvas_rotate(c_canvas, degrees::Cfloat)
    ccall((:skiac_canvas_rotate, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat), c_canvas, degrees)
end

"""
    skiac_canvas_get_total_transform(c_canvas)

$(_doc_external(:skiac_canvas_get_total_transform))
"""
function skiac_canvas_get_total_transform(c_canvas)
    ccall((:skiac_canvas_get_total_transform, skia2), skiac_transform, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_get_total_transform_matrix(c_canvas)

$(_doc_external(:skiac_canvas_get_total_transform_matrix))
"""
function skiac_canvas_get_total_transform_matrix(c_canvas)
    ccall((:skiac_canvas_get_total_transform_matrix, skia2), Ptr{skiac_matrix}, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_draw_color(c_canvas, r::Cfloat, g::Cfloat, b::Cfloat, a::Cfloat)

$(_doc_external(:skiac_canvas_draw_color))
"""
function skiac_canvas_draw_color(c_canvas, r::Cfloat, g::Cfloat, b::Cfloat, a::Cfloat)
    ccall((:skiac_canvas_draw_color, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat, Cfloat, Cfloat, Cfloat), c_canvas, r, g, b, a)
end

"""
    skiac_canvas_draw_image(c_canvas, c_bitmap, is_canvas::Bool, sx::Cfloat, sy::Cfloat, s_width::Cfloat, s_height::Cfloat, dx::Cfloat, dy::Cfloat, d_width::Cfloat, d_height::Cfloat, enable_smoothing::Bool, filter_quality::Cint, c_paint)

$(_doc_external(:skiac_canvas_draw_image))
"""
function skiac_canvas_draw_image(c_canvas, c_bitmap, is_canvas::Bool, sx::Cfloat, sy::Cfloat, s_width::Cfloat, s_height::Cfloat, dx::Cfloat, dy::Cfloat, d_width::Cfloat, d_height::Cfloat, enable_smoothing::Bool, filter_quality::Cint, c_paint)
    ccall((:skiac_canvas_draw_image, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_bitmap}, Bool, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Bool, Cint, Ptr{skiac_paint}), c_canvas, c_bitmap, is_canvas, sx, sy, s_width, s_height, dx, dy, d_width, d_height, enable_smoothing, filter_quality, c_paint)
end

"""
    skiac_canvas_draw_path(c_canvas, c_path, c_paint)

$(_doc_external(:skiac_canvas_draw_path))
"""
function skiac_canvas_draw_path(c_canvas, c_path, c_paint)
    ccall((:skiac_canvas_draw_path, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_path}, Ptr{skiac_paint}), c_canvas, c_path, c_paint)
end

"""
    skiac_canvas_draw_rect(c_canvas, x::Cfloat, y::Cfloat, w::Cfloat, h::Cfloat, c_paint)

$(_doc_external(:skiac_canvas_draw_rect))
"""
function skiac_canvas_draw_rect(c_canvas, x::Cfloat, y::Cfloat, w::Cfloat, h::Cfloat, c_paint)
    ccall((:skiac_canvas_draw_rect, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat, Cfloat, Cfloat, Cfloat, Ptr{skiac_paint}), c_canvas, x, y, w, h, c_paint)
end

"""
    skiac_canvas_draw_surface(c_canvas, c_surface, left::Cfloat, top::Cfloat, alpha::Cint, blend_mode::Cint, filter_quality::Cint)

$(_doc_external(:skiac_canvas_draw_surface))
"""
function skiac_canvas_draw_surface(c_canvas, c_surface, left::Cfloat, top::Cfloat, alpha::Cint, blend_mode::Cint, filter_quality::Cint)
    ccall((:skiac_canvas_draw_surface, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_surface}, Cfloat, Cfloat, Cint, Cint, Cint), c_canvas, c_surface, left, top, alpha, blend_mode, filter_quality)
end

"""
    skiac_canvas_draw_surface_rect(c_canvas, c_surface, sx::Cfloat, sy::Cfloat, sw::Cfloat, sh::Cfloat, dx::Cfloat, dy::Cfloat, dw::Cfloat, dh::Cfloat, filter_quality::Cint)

$(_doc_external(:skiac_canvas_draw_surface_rect))
"""
function skiac_canvas_draw_surface_rect(c_canvas, c_surface, sx::Cfloat, sy::Cfloat, sw::Cfloat, sh::Cfloat, dx::Cfloat, dy::Cfloat, dw::Cfloat, dh::Cfloat, filter_quality::Cint)
    ccall((:skiac_canvas_draw_surface_rect, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_surface}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint), c_canvas, c_surface, sx, sy, sw, sh, dx, dy, dw, dh, filter_quality)
end

"""
    skiac_canvas_get_line_metrics_or_draw_text(text, text_len::Cint, max_width::Cfloat, x::Cfloat, y::Cfloat, canvas_width::Cfloat, c_collection, font_size::Cfloat, weight::Cint, stretch::Cint, slant::Cint, font_family, baseline::Cint, align::Cint, direction::Cint, letter_spacing::Cfloat, world_spacing::Cfloat, c_paint, c_canvas, c_line_metrics)

$(_doc_external(:skiac_canvas_get_line_metrics_or_draw_text))
"""
function skiac_canvas_get_line_metrics_or_draw_text(text, text_len::Cint, max_width::Cfloat, x::Cfloat, y::Cfloat, canvas_width::Cfloat, c_collection, font_size::Cfloat, weight::Cint, stretch::Cint, slant::Cint, font_family, baseline::Cint, align::Cint, direction::Cint, letter_spacing::Cfloat, world_spacing::Cfloat, c_paint, c_canvas, c_line_metrics)
    ccall((:skiac_canvas_get_line_metrics_or_draw_text, skia2), Cvoid, (Ptr{Cchar}, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Ptr{skiac_font_collection}, Cfloat, Cint, Cint, Cint, Ptr{Cchar}, Cint, Cint, Cint, Cfloat, Cfloat, Ptr{skiac_paint}, Ptr{skiac_canvas}, Ptr{skiac_line_metrics}), text, text_len, max_width, x, y, canvas_width, c_collection, font_size, weight, stretch, slant, font_family, baseline, align, direction, letter_spacing, world_spacing, c_paint, c_canvas, c_line_metrics)
end

"""
    skiac_canvas_reset_transform(c_canvas)

$(_doc_external(:skiac_canvas_reset_transform))
"""
function skiac_canvas_reset_transform(c_canvas)
    ccall((:skiac_canvas_reset_transform, skia2), Cvoid, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_clip_rect(c_canvas, x::Cfloat, y::Cfloat, w::Cfloat, h::Cfloat)

$(_doc_external(:skiac_canvas_clip_rect))
"""
function skiac_canvas_clip_rect(c_canvas, x::Cfloat, y::Cfloat, w::Cfloat, h::Cfloat)
    ccall((:skiac_canvas_clip_rect, skia2), Cvoid, (Ptr{skiac_canvas}, Cfloat, Cfloat, Cfloat, Cfloat), c_canvas, x, y, w, h)
end

"""
    skiac_canvas_clip_path(c_canvas, c_path)

$(_doc_external(:skiac_canvas_clip_path))
"""
function skiac_canvas_clip_path(c_canvas, c_path)
    ccall((:skiac_canvas_clip_path, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_path}), c_canvas, c_path)
end

"""
    skiac_canvas_save(c_canvas)

$(_doc_external(:skiac_canvas_save))
"""
function skiac_canvas_save(c_canvas)
    ccall((:skiac_canvas_save, skia2), Cvoid, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_restore(c_canvas)

$(_doc_external(:skiac_canvas_restore))
"""
function skiac_canvas_restore(c_canvas)
    ccall((:skiac_canvas_restore, skia2), Cvoid, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_reset(c_canvas)

$(_doc_external(:skiac_canvas_reset))
"""
function skiac_canvas_reset(c_canvas)
    ccall((:skiac_canvas_reset, skia2), Cvoid, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_canvas_write_pixels(c_canvas, width::Cint, height::Cint, pixels, row_bytes::Cint, x::Cint, y::Cint)

$(_doc_external(:skiac_canvas_write_pixels))
"""
function skiac_canvas_write_pixels(c_canvas, width::Cint, height::Cint, pixels, row_bytes::Cint, x::Cint, y::Cint)
    ccall((:skiac_canvas_write_pixels, skia2), Cvoid, (Ptr{skiac_canvas}, Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), c_canvas, width, height, pixels, row_bytes, x, y)
end

"""
    skiac_canvas_write_pixels_dirty(c_canvas, width::Cint, height::Cint, pixels, row_bytes::Cint, length::Cint, x::Cfloat, y::Cfloat, dirty_x::Cfloat, dirty_y::Cfloat, dirty_width::Cfloat, dirty_height::Cfloat, cs::Cint)

$(_doc_external(:skiac_canvas_write_pixels_dirty))
"""
function skiac_canvas_write_pixels_dirty(c_canvas, width::Cint, height::Cint, pixels, row_bytes::Cint, length::Cint, x::Cfloat, y::Cfloat, dirty_x::Cfloat, dirty_y::Cfloat, dirty_width::Cfloat, dirty_height::Cfloat, cs::Cint)
    ccall((:skiac_canvas_write_pixels_dirty, skia2), Cvoid, (Ptr{skiac_canvas}, Cint, Cint, Ptr{Cint}, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint), c_canvas, width, height, pixels, row_bytes, length, x, y, dirty_x, dirty_y, dirty_width, dirty_height, cs)
end

"""
    skiac_canvas_draw_picture(c_canvas, c_picture, c_matrix, c_paint)

$(_doc_external(:skiac_canvas_draw_picture))
"""
function skiac_canvas_draw_picture(c_canvas, c_picture, c_matrix, c_paint)
    ccall((:skiac_canvas_draw_picture, skia2), Cvoid, (Ptr{skiac_canvas}, Ptr{skiac_picture}, Ptr{skiac_matrix}, Ptr{skiac_paint}), c_canvas, c_picture, c_matrix, c_paint)
end

"""
    skiac_canvas_destroy(c_canvas)

$(_doc_external(:skiac_canvas_destroy))
"""
function skiac_canvas_destroy(c_canvas)
    ccall((:skiac_canvas_destroy, skia2), Cvoid, (Ptr{skiac_canvas},), c_canvas)
end

"""
    skiac_paint_create()

$(_doc_external(:skiac_paint_create))
"""
function skiac_paint_create()
    ccall((:skiac_paint_create, skia2), Ptr{skiac_paint}, ())
end

"""
    skiac_paint_clone(c_paint)

$(_doc_external(:skiac_paint_clone))
"""
function skiac_paint_clone(c_paint)
    ccall((:skiac_paint_clone, skia2), Ptr{skiac_paint}, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_destroy(c_paint)

$(_doc_external(:skiac_paint_destroy))
"""
function skiac_paint_destroy(c_paint)
    ccall((:skiac_paint_destroy, skia2), Cvoid, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_style(c_paint, style::Cint)

$(_doc_external(:skiac_paint_set_style))
"""
function skiac_paint_set_style(c_paint, style::Cint)
    ccall((:skiac_paint_set_style, skia2), Cvoid, (Ptr{skiac_paint}, Cint), c_paint, style)
end

"""
    skiac_paint_set_color(c_paint, r::Cint, g::Cint, b::Cint, a::Cint)

$(_doc_external(:skiac_paint_set_color))
"""
function skiac_paint_set_color(c_paint, r::Cint, g::Cint, b::Cint, a::Cint)
    ccall((:skiac_paint_set_color, skia2), Cvoid, (Ptr{skiac_paint}, Cint, Cint, Cint, Cint), c_paint, r, g, b, a)
end

"""
    skiac_paint_set_alpha(c_paint, a::Cint)

$(_doc_external(:skiac_paint_set_alpha))
"""
function skiac_paint_set_alpha(c_paint, a::Cint)
    ccall((:skiac_paint_set_alpha, skia2), Cvoid, (Ptr{skiac_paint}, Cint), c_paint, a)
end

"""
    skiac_paint_get_alpha(c_paint)

$(_doc_external(:skiac_paint_get_alpha))
"""
function skiac_paint_get_alpha(c_paint)
    ccall((:skiac_paint_get_alpha, skia2), Cint, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_anti_alias(c_paint, aa::Bool)

$(_doc_external(:skiac_paint_set_anti_alias))
"""
function skiac_paint_set_anti_alias(c_paint, aa::Bool)
    ccall((:skiac_paint_set_anti_alias, skia2), Cvoid, (Ptr{skiac_paint}, Bool), c_paint, aa)
end

"""
    skiac_paint_set_blend_mode(c_paint, blend_mode::Cint)

$(_doc_external(:skiac_paint_set_blend_mode))
"""
function skiac_paint_set_blend_mode(c_paint, blend_mode::Cint)
    ccall((:skiac_paint_set_blend_mode, skia2), Cvoid, (Ptr{skiac_paint}, Cint), c_paint, blend_mode)
end

"""
    skiac_paint_get_blend_mode(c_paint)

$(_doc_external(:skiac_paint_get_blend_mode))
"""
function skiac_paint_get_blend_mode(c_paint)
    ccall((:skiac_paint_get_blend_mode, skia2), Cint, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_shader(c_paint, c_shader)

$(_doc_external(:skiac_paint_set_shader))
"""
function skiac_paint_set_shader(c_paint, c_shader)
    ccall((:skiac_paint_set_shader, skia2), Cvoid, (Ptr{skiac_paint}, Ptr{skiac_shader}), c_paint, c_shader)
end

"""
    skiac_paint_set_stroke_width(c_paint, width::Cfloat)

$(_doc_external(:skiac_paint_set_stroke_width))
"""
function skiac_paint_set_stroke_width(c_paint, width::Cfloat)
    ccall((:skiac_paint_set_stroke_width, skia2), Cvoid, (Ptr{skiac_paint}, Cfloat), c_paint, width)
end

"""
    skiac_paint_get_stroke_width(c_paint)

$(_doc_external(:skiac_paint_get_stroke_width))
"""
function skiac_paint_get_stroke_width(c_paint)
    ccall((:skiac_paint_get_stroke_width, skia2), Cfloat, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_stroke_cap(c_paint, cap::Cint)

$(_doc_external(:skiac_paint_set_stroke_cap))
"""
function skiac_paint_set_stroke_cap(c_paint, cap::Cint)
    ccall((:skiac_paint_set_stroke_cap, skia2), Cvoid, (Ptr{skiac_paint}, Cint), c_paint, cap)
end

"""
    skiac_paint_get_stroke_cap(c_paint)

$(_doc_external(:skiac_paint_get_stroke_cap))
"""
function skiac_paint_get_stroke_cap(c_paint)
    ccall((:skiac_paint_get_stroke_cap, skia2), Cint, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_stroke_join(c_paint, join::Cint)

$(_doc_external(:skiac_paint_set_stroke_join))
"""
function skiac_paint_set_stroke_join(c_paint, join::Cint)
    ccall((:skiac_paint_set_stroke_join, skia2), Cvoid, (Ptr{skiac_paint}, Cint), c_paint, join)
end

"""
    skiac_paint_get_stroke_join(c_paint)

$(_doc_external(:skiac_paint_get_stroke_join))
"""
function skiac_paint_get_stroke_join(c_paint)
    ccall((:skiac_paint_get_stroke_join, skia2), Cint, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_stroke_miter(c_paint, miter::Cfloat)

$(_doc_external(:skiac_paint_set_stroke_miter))
"""
function skiac_paint_set_stroke_miter(c_paint, miter::Cfloat)
    ccall((:skiac_paint_set_stroke_miter, skia2), Cvoid, (Ptr{skiac_paint}, Cfloat), c_paint, miter)
end

"""
    skiac_paint_get_stroke_miter(c_paint)

$(_doc_external(:skiac_paint_get_stroke_miter))
"""
function skiac_paint_get_stroke_miter(c_paint)
    ccall((:skiac_paint_get_stroke_miter, skia2), Cfloat, (Ptr{skiac_paint},), c_paint)
end

"""
    skiac_paint_set_path_effect(c_paint, c_path_effect)

$(_doc_external(:skiac_paint_set_path_effect))
"""
function skiac_paint_set_path_effect(c_paint, c_path_effect)
    ccall((:skiac_paint_set_path_effect, skia2), Cvoid, (Ptr{skiac_paint}, Ptr{skiac_path_effect}), c_paint, c_path_effect)
end

"""
    skiac_paint_set_mask_filter(c_paint, c_mask_filter)

$(_doc_external(:skiac_paint_set_mask_filter))
"""
function skiac_paint_set_mask_filter(c_paint, c_mask_filter)
    ccall((:skiac_paint_set_mask_filter, skia2), Cvoid, (Ptr{skiac_paint}, Ptr{skiac_mask_filter}), c_paint, c_mask_filter)
end

"""
    skiac_paint_set_image_filter(c_paint, c_image_filter)

$(_doc_external(:skiac_paint_set_image_filter))
"""
function skiac_paint_set_image_filter(c_paint, c_image_filter)
    ccall((:skiac_paint_set_image_filter, skia2), Cvoid, (Ptr{skiac_paint}, Ptr{skiac_image_filter}), c_paint, c_image_filter)
end

"""
    skiac_path_create()

$(_doc_external(:skiac_path_create))
"""
function skiac_path_create()
    ccall((:skiac_path_create, skia2), Ptr{skiac_path}, ())
end

"""
    skiac_path_from_svg(svg_path)

$(_doc_external(:skiac_path_from_svg))
"""
function skiac_path_from_svg(svg_path)
    ccall((:skiac_path_from_svg, skia2), Ptr{skiac_path}, (Ptr{Cchar},), svg_path)
end

"""
    skiac_path_clone(c_path)

$(_doc_external(:skiac_path_clone))
"""
function skiac_path_clone(c_path)
    ccall((:skiac_path_clone, skia2), Ptr{skiac_path}, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_swap(c_path, other_path)

$(_doc_external(:skiac_path_swap))
"""
function skiac_path_swap(c_path, other_path)
    ccall((:skiac_path_swap, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_path}), c_path, other_path)
end

"""
    skiac_add_path(c_path, other_path, c_matrix)

$(_doc_external(:skiac_add_path))
"""
function skiac_add_path(c_path, other_path, c_matrix)
    ccall((:skiac_add_path, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_path}, Ptr{skiac_matrix}), c_path, other_path, c_matrix)
end

"""
    skiac_path_op(c_path_one, c_path_two, op::Cint)

$(_doc_external(:skiac_path_op))
"""
function skiac_path_op(c_path_one, c_path_two, op::Cint)
    ccall((:skiac_path_op, skia2), Bool, (Ptr{skiac_path}, Ptr{skiac_path}, Cint), c_path_one, c_path_two, op)
end

"""
    skiac_path_to_svg_string(c_path, c_string)

$(_doc_external(:skiac_path_to_svg_string))
"""
function skiac_path_to_svg_string(c_path, c_string)
    ccall((:skiac_path_to_svg_string, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_string}), c_path, c_string)
end

"""
    skiac_path_simplify(c_path)

$(_doc_external(:skiac_path_simplify))
"""
function skiac_path_simplify(c_path)
    ccall((:skiac_path_simplify, skia2), Bool, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_stroke(c_path, cap::Cint, join::Cint, width::Cfloat, miter_limit::Cfloat)

$(_doc_external(:skiac_path_stroke))
"""
function skiac_path_stroke(c_path, cap::Cint, join::Cint, width::Cfloat, miter_limit::Cfloat)
    ccall((:skiac_path_stroke, skia2), Bool, (Ptr{skiac_path}, Cint, Cint, Cfloat, Cfloat), c_path, cap, join, width, miter_limit)
end

"""
    skiac_path_get_bounds(c_path, c_rect)

$(_doc_external(:skiac_path_get_bounds))
"""
function skiac_path_get_bounds(c_path, c_rect)
    ccall((:skiac_path_get_bounds, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_rect}), c_path, c_rect)
end

"""
    skiac_path_compute_tight_bounds(c_path, c_rect)

$(_doc_external(:skiac_path_compute_tight_bounds))
"""
function skiac_path_compute_tight_bounds(c_path, c_rect)
    ccall((:skiac_path_compute_tight_bounds, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_rect}), c_path, c_rect)
end

"""
    skiac_path_trim(c_path, start_t::Cfloat, stop_t::Cfloat, is_complement::Bool)

$(_doc_external(:skiac_path_trim))
"""
function skiac_path_trim(c_path, start_t::Cfloat, stop_t::Cfloat, is_complement::Bool)
    ccall((:skiac_path_trim, skia2), Bool, (Ptr{skiac_path}, Cfloat, Cfloat, Bool), c_path, start_t, stop_t, is_complement)
end

"""
    skiac_path_dash(c_path, on::Cfloat, off::Cfloat, phase::Cfloat)

$(_doc_external(:skiac_path_dash))
"""
function skiac_path_dash(c_path, on::Cfloat, off::Cfloat, phase::Cfloat)
    ccall((:skiac_path_dash, skia2), Bool, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat), c_path, on, off, phase)
end

"""
    skiac_path_round(c_path, radius::Cfloat)

$(_doc_external(:skiac_path_round))
"""
function skiac_path_round(c_path, radius::Cfloat)
    ccall((:skiac_path_round, skia2), Bool, (Ptr{skiac_path}, Cfloat), c_path, radius)
end

"""
    skiac_path_equals(c_path, other_path)

$(_doc_external(:skiac_path_equals))
"""
function skiac_path_equals(c_path, other_path)
    ccall((:skiac_path_equals, skia2), Bool, (Ptr{skiac_path}, Ptr{skiac_path}), c_path, other_path)
end

"""
    skiac_path_destroy(c_path)

$(_doc_external(:skiac_path_destroy))
"""
function skiac_path_destroy(c_path)
    ccall((:skiac_path_destroy, skia2), Cvoid, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_set_fill_type(c_path, type::Cint)

$(_doc_external(:skiac_path_set_fill_type))
"""
function skiac_path_set_fill_type(c_path, type::Cint)
    ccall((:skiac_path_set_fill_type, skia2), Cvoid, (Ptr{skiac_path}, Cint), c_path, type)
end

"""
    skiac_path_get_fill_type(c_path)

$(_doc_external(:skiac_path_get_fill_type))
"""
function skiac_path_get_fill_type(c_path)
    ccall((:skiac_path_get_fill_type, skia2), Cint, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_as_winding(c_path)

$(_doc_external(:skiac_path_as_winding))
"""
function skiac_path_as_winding(c_path)
    ccall((:skiac_path_as_winding, skia2), Bool, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_arc_to(c_path, left::Cfloat, top::Cfloat, right::Cfloat, bottom::Cfloat, startAngle::Cfloat, sweepAngle::Cfloat, forceMoveTo::Bool)

$(_doc_external(:skiac_path_arc_to))
"""
function skiac_path_arc_to(c_path, left::Cfloat, top::Cfloat, right::Cfloat, bottom::Cfloat, startAngle::Cfloat, sweepAngle::Cfloat, forceMoveTo::Bool)
    ccall((:skiac_path_arc_to, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Bool), c_path, left, top, right, bottom, startAngle, sweepAngle, forceMoveTo)
end

"""
    skiac_path_arc_to_tangent(c_path, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, radius::Cfloat)

$(_doc_external(:skiac_path_arc_to_tangent))
"""
function skiac_path_arc_to_tangent(c_path, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, radius::Cfloat)
    ccall((:skiac_path_arc_to_tangent, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), c_path, x1, y1, x2, y2, radius)
end

"""
    skiac_path_move_to(c_path, x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_path_move_to))
"""
function skiac_path_move_to(c_path, x::Cfloat, y::Cfloat)
    ccall((:skiac_path_move_to, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat), c_path, x, y)
end

"""
    skiac_path_line_to(c_path, x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_path_line_to))
"""
function skiac_path_line_to(c_path, x::Cfloat, y::Cfloat)
    ccall((:skiac_path_line_to, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat), c_path, x, y)
end

"""
    skiac_path_cubic_to(c_path, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, x3::Cfloat, y3::Cfloat)

$(_doc_external(:skiac_path_cubic_to))
"""
function skiac_path_cubic_to(c_path, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, x3::Cfloat, y3::Cfloat)
    ccall((:skiac_path_cubic_to, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), c_path, x1, y1, x2, y2, x3, y3)
end

"""
    skiac_path_quad_to(c_path, cpx::Cfloat, cpy::Cfloat, x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_path_quad_to))
"""
function skiac_path_quad_to(c_path, cpx::Cfloat, cpy::Cfloat, x::Cfloat, y::Cfloat)
    ccall((:skiac_path_quad_to, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat), c_path, cpx, cpy, x, y)
end

"""
    skiac_path_close(c_path)

$(_doc_external(:skiac_path_close))
"""
function skiac_path_close(c_path)
    ccall((:skiac_path_close, skia2), Cvoid, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_add_rect(c_path, l::Cfloat, t::Cfloat, r::Cfloat, b::Cfloat)

$(_doc_external(:skiac_path_add_rect))
"""
function skiac_path_add_rect(c_path, l::Cfloat, t::Cfloat, r::Cfloat, b::Cfloat)
    ccall((:skiac_path_add_rect, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat), c_path, l, t, r, b)
end

"""
    skiac_path_add_circle(c_path, x::Cfloat, y::Cfloat, r::Cfloat)

$(_doc_external(:skiac_path_add_circle))
"""
function skiac_path_add_circle(c_path, x::Cfloat, y::Cfloat, r::Cfloat)
    ccall((:skiac_path_add_circle, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat), c_path, x, y, r)
end

"""
    skiac_path_transform(c_path, c_matrix)

$(_doc_external(:skiac_path_transform))
"""
function skiac_path_transform(c_path, c_matrix)
    ccall((:skiac_path_transform, skia2), Ptr{skiac_path}, (Ptr{skiac_path}, Ptr{skiac_matrix}), c_path, c_matrix)
end

"""
    skiac_path_transform_self(c_path, c_matrix)

$(_doc_external(:skiac_path_transform_self))
"""
function skiac_path_transform_self(c_path, c_matrix)
    ccall((:skiac_path_transform_self, skia2), Cvoid, (Ptr{skiac_path}, Ptr{skiac_matrix}), c_path, c_matrix)
end

"""
    skiac_path_is_empty(c_path)

$(_doc_external(:skiac_path_is_empty))
"""
function skiac_path_is_empty(c_path)
    ccall((:skiac_path_is_empty, skia2), Bool, (Ptr{skiac_path},), c_path)
end

"""
    skiac_path_hit_test(c_path, x::Cfloat, y::Cfloat, type::Cint)

$(_doc_external(:skiac_path_hit_test))
"""
function skiac_path_hit_test(c_path, x::Cfloat, y::Cfloat, type::Cint)
    ccall((:skiac_path_hit_test, skia2), Bool, (Ptr{skiac_path}, Cfloat, Cfloat, Cint), c_path, x, y, type)
end

"""
    skiac_path_stroke_hit_test(c_path, x::Cfloat, y::Cfloat, stroke_w::Cfloat)

$(_doc_external(:skiac_path_stroke_hit_test))
"""
function skiac_path_stroke_hit_test(c_path, x::Cfloat, y::Cfloat, stroke_w::Cfloat)
    ccall((:skiac_path_stroke_hit_test, skia2), Bool, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat), c_path, x, y, stroke_w)
end

"""
    skiac_path_round_rect(c_path, x::Cfloat, y::Cfloat, width::Cfloat, height::Cfloat, radii, clockwise::Bool)

$(_doc_external(:skiac_path_round_rect))
"""
function skiac_path_round_rect(c_path, x::Cfloat, y::Cfloat, width::Cfloat, height::Cfloat, radii, clockwise::Bool)
    ccall((:skiac_path_round_rect, skia2), Cvoid, (Ptr{skiac_path}, Cfloat, Cfloat, Cfloat, Cfloat, Ptr{Cfloat}, Bool), c_path, x, y, width, height, radii, clockwise)
end

"""
    skiac_path_effect_make_dash_path(intervals, count::Cint, phase::Cfloat)

$(_doc_external(:skiac_path_effect_make_dash_path))
"""
function skiac_path_effect_make_dash_path(intervals, count::Cint, phase::Cfloat)
    ccall((:skiac_path_effect_make_dash_path, skia2), Ptr{skiac_path_effect}, (Ptr{Cfloat}, Cint, Cfloat), intervals, count, phase)
end

"""
    skiac_path_effect_destroy(c_path_effect)

$(_doc_external(:skiac_path_effect_destroy))
"""
function skiac_path_effect_destroy(c_path_effect)
    ccall((:skiac_path_effect_destroy, skia2), Cvoid, (Ptr{skiac_path_effect},), c_path_effect)
end

"""
    skiac_shader_make_linear_gradient(points, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)

$(_doc_external(:skiac_shader_make_linear_gradient))
"""
function skiac_shader_make_linear_gradient(points, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)
    ccall((:skiac_shader_make_linear_gradient, skia2), Ptr{skiac_shader}, (Ptr{skiac_point}, Ptr{Cint}, Ptr{Cfloat}, Cint, Cint, Cint, skiac_transform), points, colors, positions, count, tile_mode, flags, c_ts)
end

"""
    skiac_shader_make_radial_gradient(start_point::skiac_point, start_radius::Cfloat, end_point::skiac_point, end_radius::Cfloat, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)

$(_doc_external(:skiac_shader_make_radial_gradient))
"""
function skiac_shader_make_radial_gradient(start_point::skiac_point, start_radius::Cfloat, end_point::skiac_point, end_radius::Cfloat, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)
    ccall((:skiac_shader_make_radial_gradient, skia2), Ptr{skiac_shader}, (skiac_point, Cfloat, skiac_point, Cfloat, Ptr{Cint}, Ptr{Cfloat}, Cint, Cint, Cint, skiac_transform), start_point, start_radius, end_point, end_radius, colors, positions, count, tile_mode, flags, c_ts)
end

"""
    skiac_shader_make_conic_gradient(cx::Cfloat, cy::Cfloat, radius::Cfloat, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)

$(_doc_external(:skiac_shader_make_conic_gradient))
"""
function skiac_shader_make_conic_gradient(cx::Cfloat, cy::Cfloat, radius::Cfloat, colors, positions, count::Cint, tile_mode::Cint, flags::Cint, c_ts::skiac_transform)
    ccall((:skiac_shader_make_conic_gradient, skia2), Ptr{skiac_shader}, (Cfloat, Cfloat, Cfloat, Ptr{Cint}, Ptr{Cfloat}, Cint, Cint, Cint, skiac_transform), cx, cy, radius, colors, positions, count, tile_mode, flags, c_ts)
end

"""
    skiac_shader_make_from_surface_image(c_surface, c_ts::skiac_transform, filter_quality::Cint)

$(_doc_external(:skiac_shader_make_from_surface_image))
"""
function skiac_shader_make_from_surface_image(c_surface, c_ts::skiac_transform, filter_quality::Cint)
    ccall((:skiac_shader_make_from_surface_image, skia2), Ptr{skiac_shader}, (Ptr{skiac_surface}, skiac_transform, Cint), c_surface, c_ts, filter_quality)
end

"""
    skiac_shader_destroy(c_shader)

$(_doc_external(:skiac_shader_destroy))
"""
function skiac_shader_destroy(c_shader)
    ccall((:skiac_shader_destroy, skia2), Cvoid, (Ptr{skiac_shader},), c_shader)
end

"""
    skiac_matrix_create()

$(_doc_external(:skiac_matrix_create))
"""
function skiac_matrix_create()
    ccall((:skiac_matrix_create, skia2), Ptr{skiac_matrix}, ())
end

"""
    skiac_matrix_new(a::Cfloat, b::Cfloat, c::Cfloat, d::Cfloat, e::Cfloat, f::Cfloat)

$(_doc_external(:skiac_matrix_new))
"""
function skiac_matrix_new(a::Cfloat, b::Cfloat, c::Cfloat, d::Cfloat, e::Cfloat, f::Cfloat)
    ccall((:skiac_matrix_new, skia2), Ptr{skiac_matrix}, (Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), a, b, c, d, e, f)
end

"""
    skiac_matrix_from_ts(c_ts)

$(_doc_external(:skiac_matrix_from_ts))
"""
function skiac_matrix_from_ts(c_ts)
    ccall((:skiac_matrix_from_ts, skia2), Ptr{skiac_matrix}, (Ptr{skiac_transform},), c_ts)
end

"""
    skiac_matrix_create_rotated(rotation::Cfloat, x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_matrix_create_rotated))
"""
function skiac_matrix_create_rotated(rotation::Cfloat, x::Cfloat, y::Cfloat)
    ccall((:skiac_matrix_create_rotated, skia2), Ptr{skiac_matrix}, (Cfloat, Cfloat, Cfloat), rotation, x, y)
end

"""
    skiac_matrix_create_translated(x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_matrix_create_translated))
"""
function skiac_matrix_create_translated(x::Cfloat, y::Cfloat)
    ccall((:skiac_matrix_create_translated, skia2), Ptr{skiac_matrix}, (Cfloat, Cfloat), x, y)
end

"""
    skiac_matrix_concat(c_matrix, other)

$(_doc_external(:skiac_matrix_concat))
"""
function skiac_matrix_concat(c_matrix, other)
    ccall((:skiac_matrix_concat, skia2), Ptr{skiac_matrix}, (Ptr{skiac_matrix}, Ptr{skiac_matrix}), c_matrix, other)
end

"""
    skiac_matrix_multiply(c_matrix, other)

$(_doc_external(:skiac_matrix_multiply))
"""
function skiac_matrix_multiply(c_matrix, other)
    ccall((:skiac_matrix_multiply, skia2), Ptr{skiac_matrix}, (Ptr{skiac_matrix}, Ptr{skiac_matrix}), c_matrix, other)
end

"""
    skiac_matrix_clone(c_matrix)

$(_doc_external(:skiac_matrix_clone))
"""
function skiac_matrix_clone(c_matrix)
    ccall((:skiac_matrix_clone, skia2), Ptr{skiac_matrix}, (Ptr{skiac_matrix},), c_matrix)
end

"""
    skiac_matrix_map_points_1(c_matrix, x::Cfloat, y::Cfloat, mapped_point)

$(_doc_external(:skiac_matrix_map_points_1))
"""
function skiac_matrix_map_points_1(c_matrix, x::Cfloat, y::Cfloat, mapped_point)
    ccall((:skiac_matrix_map_points_1, skia2), Cvoid, (Ptr{skiac_matrix}, Cfloat, Cfloat, Ptr{skiac_mapped_point}), c_matrix, x, y, mapped_point)
end

"""
    skiac_matrix_pre_translate(c_matrix, dx::Cfloat, dy::Cfloat)

$(_doc_external(:skiac_matrix_pre_translate))
"""
function skiac_matrix_pre_translate(c_matrix, dx::Cfloat, dy::Cfloat)
    ccall((:skiac_matrix_pre_translate, skia2), Cvoid, (Ptr{skiac_matrix}, Cfloat, Cfloat), c_matrix, dx, dy)
end

"""
    skiac_matrix_pre_concat(c_matrix, other)

$(_doc_external(:skiac_matrix_pre_concat))
"""
function skiac_matrix_pre_concat(c_matrix, other)
    ccall((:skiac_matrix_pre_concat, skia2), Cvoid, (Ptr{skiac_matrix}, Ptr{skiac_matrix}), c_matrix, other)
end

"""
    skiac_matrix_pre_scale(c_matrix, sx::Cfloat, sy::Cfloat)

$(_doc_external(:skiac_matrix_pre_scale))
"""
function skiac_matrix_pre_scale(c_matrix, sx::Cfloat, sy::Cfloat)
    ccall((:skiac_matrix_pre_scale, skia2), Cvoid, (Ptr{skiac_matrix}, Cfloat, Cfloat), c_matrix, sx, sy)
end

"""
    skiac_matrix_pre_concat_transform(c_matrix, c_ts::skiac_transform)

$(_doc_external(:skiac_matrix_pre_concat_transform))
"""
function skiac_matrix_pre_concat_transform(c_matrix, c_ts::skiac_transform)
    ccall((:skiac_matrix_pre_concat_transform, skia2), Cvoid, (Ptr{skiac_matrix}, skiac_transform), c_matrix, c_ts)
end

"""
    skiac_matrix_pre_rotate(c_matrix, degrees::Cfloat)

$(_doc_external(:skiac_matrix_pre_rotate))
"""
function skiac_matrix_pre_rotate(c_matrix, degrees::Cfloat)
    ccall((:skiac_matrix_pre_rotate, skia2), Cvoid, (Ptr{skiac_matrix}, Cfloat), c_matrix, degrees)
end

"""
    skiac_matrix_pre_rotate_x_y(c_matrix, degrees::Cfloat, x::Cfloat, y::Cfloat)

$(_doc_external(:skiac_matrix_pre_rotate_x_y))
"""
function skiac_matrix_pre_rotate_x_y(c_matrix, degrees::Cfloat, x::Cfloat, y::Cfloat)
    ccall((:skiac_matrix_pre_rotate_x_y, skia2), Cvoid, (Ptr{skiac_matrix}, Cfloat, Cfloat, Cfloat), c_matrix, degrees, x, y)
end

"""
    skiac_matrix_invert(c_matrix, inverse)

$(_doc_external(:skiac_matrix_invert))
"""
function skiac_matrix_invert(c_matrix, inverse)
    ccall((:skiac_matrix_invert, skia2), Bool, (Ptr{skiac_matrix}, Ptr{skiac_matrix}), c_matrix, inverse)
end

"""
    skiac_matrix_to_transform(c_matrix)

$(_doc_external(:skiac_matrix_to_transform))
"""
function skiac_matrix_to_transform(c_matrix)
    ccall((:skiac_matrix_to_transform, skia2), skiac_transform, (Ptr{skiac_matrix},), c_matrix)
end

"""
    skiac_matrix_destroy(c_matrix)

$(_doc_external(:skiac_matrix_destroy))
"""
function skiac_matrix_destroy(c_matrix)
    ccall((:skiac_matrix_destroy, skia2), Cvoid, (Ptr{skiac_matrix},), c_matrix)
end

"""
    skiac_mask_filter_make_blur(radius::Cfloat)

$(_doc_external(:skiac_mask_filter_make_blur))
"""
function skiac_mask_filter_make_blur(radius::Cfloat)
    ccall((:skiac_mask_filter_make_blur, skia2), Ptr{skiac_mask_filter}, (Cfloat,), radius)
end

"""
    skiac_mask_filter_destroy(c_mask_filter)

$(_doc_external(:skiac_mask_filter_destroy))
"""
function skiac_mask_filter_destroy(c_mask_filter)
    ccall((:skiac_mask_filter_destroy, skia2), Cvoid, (Ptr{skiac_mask_filter},), c_mask_filter)
end

"""
    skiac_image_filter_make_drop_shadow_only(dx::Cfloat, dy::Cfloat, sigma_x::Cfloat, sigma_y::Cfloat, color::Cint, c_image_filter)

$(_doc_external(:skiac_image_filter_make_drop_shadow_only))
"""
function skiac_image_filter_make_drop_shadow_only(dx::Cfloat, dy::Cfloat, sigma_x::Cfloat, sigma_y::Cfloat, color::Cint, c_image_filter)
    ccall((:skiac_image_filter_make_drop_shadow_only, skia2), Ptr{skiac_image_filter}, (Cfloat, Cfloat, Cfloat, Cfloat, Cint, Ptr{skiac_image_filter}), dx, dy, sigma_x, sigma_y, color, c_image_filter)
end

"""
    skiac_image_filter_make_drop_shadow(dx::Cfloat, dy::Cfloat, sigma_x::Cfloat, sigma_y::Cfloat, color::Cint, c_image_filter)

$(_doc_external(:skiac_image_filter_make_drop_shadow))
"""
function skiac_image_filter_make_drop_shadow(dx::Cfloat, dy::Cfloat, sigma_x::Cfloat, sigma_y::Cfloat, color::Cint, c_image_filter)
    ccall((:skiac_image_filter_make_drop_shadow, skia2), Ptr{skiac_image_filter}, (Cfloat, Cfloat, Cfloat, Cfloat, Cint, Ptr{skiac_image_filter}), dx, dy, sigma_x, sigma_y, color, c_image_filter)
end

"""
    skiac_image_filter_make_blur(sigma_x::Cfloat, sigma_y::Cfloat, c_image_filter)

$(_doc_external(:skiac_image_filter_make_blur))
"""
function skiac_image_filter_make_blur(sigma_x::Cfloat, sigma_y::Cfloat, c_image_filter)
    ccall((:skiac_image_filter_make_blur, skia2), Ptr{skiac_image_filter}, (Cfloat, Cfloat, Ptr{skiac_image_filter}), sigma_x, sigma_y, c_image_filter)
end

"""
    skiac_image_filter_color_filter(m00::Cfloat, m01::Cfloat, m02::Cfloat, m10::Cfloat, m11::Cfloat, m12::Cfloat, m20::Cfloat, m21::Cfloat, m22::Cfloat, opacity::Cfloat, c_image_filter)

$(_doc_external(:skiac_image_filter_color_filter))
"""
function skiac_image_filter_color_filter(m00::Cfloat, m01::Cfloat, m02::Cfloat, m10::Cfloat, m11::Cfloat, m12::Cfloat, m20::Cfloat, m21::Cfloat, m22::Cfloat, opacity::Cfloat, c_image_filter)
    ccall((:skiac_image_filter_color_filter, skia2), Ptr{skiac_image_filter}, (Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Ptr{skiac_image_filter}), m00, m01, m02, m10, m11, m12, m20, m21, m22, opacity, c_image_filter)
end

"""
    skiac_image_filter_from_argb(table_a, table_r, table_g, table_b, c_image_filter)

$(_doc_external(:skiac_image_filter_from_argb))
"""
function skiac_image_filter_from_argb(table_a, table_r, table_g, table_b, c_image_filter)
    ccall((:skiac_image_filter_from_argb, skia2), Ptr{skiac_image_filter}, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{skiac_image_filter}), table_a, table_r, table_g, table_b, c_image_filter)
end

"""
    skiac_image_filter_destroy(c_image_filter)

$(_doc_external(:skiac_image_filter_destroy))
"""
function skiac_image_filter_destroy(c_image_filter)
    ccall((:skiac_image_filter_destroy, skia2), Cvoid, (Ptr{skiac_image_filter},), c_image_filter)
end

"""
    skiac_sk_data_destroy(c_data)

$(_doc_external(:skiac_sk_data_destroy))
"""
function skiac_sk_data_destroy(c_data)
    ccall((:skiac_sk_data_destroy, skia2), Cvoid, (Ptr{skiac_data},), c_data)
end

"""
    skiac_bitmap_make_from_buffer(ptr, size::Cint, bitmap_info)

$(_doc_external(:skiac_bitmap_make_from_buffer))
"""
function skiac_bitmap_make_from_buffer(ptr, size::Cint, bitmap_info)
    ccall((:skiac_bitmap_make_from_buffer, skia2), Cvoid, (Ptr{Cint}, Cint, Ptr{skiac_bitmap_info}), ptr, size, bitmap_info)
end

"""
    skiac_bitmap_make_from_svg(data, length::Cint, width::Cfloat, height::Cfloat, bitmap_info, c_collection, cs::Cint)

$(_doc_external(:skiac_bitmap_make_from_svg))
"""
function skiac_bitmap_make_from_svg(data, length::Cint, width::Cfloat, height::Cfloat, bitmap_info, c_collection, cs::Cint)
    ccall((:skiac_bitmap_make_from_svg, skia2), Bool, (Ptr{Cint}, Cint, Cfloat, Cfloat, Ptr{skiac_bitmap_info}, Ptr{skiac_font_collection}, Cint), data, length, width, height, bitmap_info, c_collection, cs)
end

"""
    skiac_bitmap_make_from_image_data(ptr, width::Cint, height::Cint, row_bytes::Cint, size::Cint, ct::Cint, at::Cint)

$(_doc_external(:skiac_bitmap_make_from_image_data))
"""
function skiac_bitmap_make_from_image_data(ptr, width::Cint, height::Cint, row_bytes::Cint, size::Cint, ct::Cint, at::Cint)
    ccall((:skiac_bitmap_make_from_image_data, skia2), Ptr{skiac_bitmap}, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), ptr, width, height, row_bytes, size, ct, at)
end

"""
    skiac_bitmap_get_width(c_bitmap)

$(_doc_external(:skiac_bitmap_get_width))
"""
function skiac_bitmap_get_width(c_bitmap)
    ccall((:skiac_bitmap_get_width, skia2), Cint, (Ptr{skiac_bitmap},), c_bitmap)
end

"""
    skiac_bitmap_get_height(c_bitmap)

$(_doc_external(:skiac_bitmap_get_height))
"""
function skiac_bitmap_get_height(c_bitmap)
    ccall((:skiac_bitmap_get_height, skia2), Cint, (Ptr{skiac_bitmap},), c_bitmap)
end

"""
    skiac_bitmap_get_shader(is_canvas::Bool, c_bitmap, repeat_x::Cint, repeat_y::Cint, B::Cfloat, C::Cfloat, c_ts::skiac_transform)

$(_doc_external(:skiac_bitmap_get_shader))
"""
function skiac_bitmap_get_shader(is_canvas::Bool, c_bitmap, repeat_x::Cint, repeat_y::Cint, B::Cfloat, C::Cfloat, c_ts::skiac_transform)
    ccall((:skiac_bitmap_get_shader, skia2), Ptr{skiac_shader}, (Bool, Ptr{skiac_bitmap}, Cint, Cint, Cfloat, Cfloat, skiac_transform), is_canvas, c_bitmap, repeat_x, repeat_y, B, C, c_ts)
end

"""
    skiac_bitmap_destroy(c_bitmap)

$(_doc_external(:skiac_bitmap_destroy))
"""
function skiac_bitmap_destroy(c_bitmap)
    ccall((:skiac_bitmap_destroy, skia2), Cvoid, (Ptr{skiac_bitmap},), c_bitmap)
end

"""
    skiac_delete_sk_string(c_sk_string)

$(_doc_external(:skiac_delete_sk_string))
"""
function skiac_delete_sk_string(c_sk_string)
    ccall((:skiac_delete_sk_string, skia2), Cvoid, (Ptr{skiac_sk_string},), c_sk_string)
end

"""
    skiac_font_collection_create()

$(_doc_external(:skiac_font_collection_create))
"""
function skiac_font_collection_create()
    ccall((:skiac_font_collection_create, skia2), Ptr{skiac_font_collection}, ())
end

"""
    skiac_font_collection_get_default_fonts_count(c_font_collection)

$(_doc_external(:skiac_font_collection_get_default_fonts_count))
"""
function skiac_font_collection_get_default_fonts_count(c_font_collection)
    ccall((:skiac_font_collection_get_default_fonts_count, skia2), Cint, (Ptr{skiac_font_collection},), c_font_collection)
end

"""
    skiac_font_collection_get_family(c_font_collection, i::Cint, c_string, on_get_style_rust, on_match_font_style::skiac_on_match_font_style)

$(_doc_external(:skiac_font_collection_get_family))
"""
function skiac_font_collection_get_family(c_font_collection, i::Cint, c_string, on_get_style_rust, on_match_font_style::skiac_on_match_font_style)
    ccall((:skiac_font_collection_get_family, skia2), Cvoid, (Ptr{skiac_font_collection}, Cint, Ptr{skiac_string}, Ptr{Cvoid}, skiac_on_match_font_style), c_font_collection, i, c_string, on_get_style_rust, on_match_font_style)
end

"""
    skiac_font_collection_register(c_font_collection, font, length::Cint, name_alias)

$(_doc_external(:skiac_font_collection_register))
"""
function skiac_font_collection_register(c_font_collection, font, length::Cint, name_alias)
    ccall((:skiac_font_collection_register, skia2), Cint, (Ptr{skiac_font_collection}, Ptr{Cint}, Cint, Ptr{Cchar}), c_font_collection, font, length, name_alias)
end

"""
    skiac_font_collection_register_from_path(c_font_collection, font_path, name_alias)

$(_doc_external(:skiac_font_collection_register_from_path))
"""
function skiac_font_collection_register_from_path(c_font_collection, font_path, name_alias)
    ccall((:skiac_font_collection_register_from_path, skia2), Cint, (Ptr{skiac_font_collection}, Ptr{Cchar}, Ptr{Cchar}), c_font_collection, font_path, name_alias)
end

"""
    skiac_font_collection_set_alias(c_font_collection, family, alias)

$(_doc_external(:skiac_font_collection_set_alias))
"""
function skiac_font_collection_set_alias(c_font_collection, family, alias)
    ccall((:skiac_font_collection_set_alias, skia2), Cvoid, (Ptr{skiac_font_collection}, Ptr{Cchar}, Ptr{Cchar}), c_font_collection, family, alias)
end

"""
    skiac_font_collection_destroy(c_font_collection)

$(_doc_external(:skiac_font_collection_destroy))
"""
function skiac_font_collection_destroy(c_font_collection)
    ccall((:skiac_font_collection_destroy, skia2), Cvoid, (Ptr{skiac_font_collection},), c_font_collection)
end

"""
    skiac_sk_w_stream_get(c_w_memory_stream, sk_data, width::Cint, height::Cint)

$(_doc_external(:skiac_sk_w_stream_get))
"""
function skiac_sk_w_stream_get(c_w_memory_stream, sk_data, width::Cint, height::Cint)
    ccall((:skiac_sk_w_stream_get, skia2), Cvoid, (Ptr{skiac_w_memory_stream}, Ptr{skiac_sk_data}, Cint, Cint), c_w_memory_stream, sk_data, width, height)
end

"""
    skiac_sk_w_stream_destroy(c_w_memory_stream)

$(_doc_external(:skiac_sk_w_stream_destroy))
"""
function skiac_sk_w_stream_destroy(c_w_memory_stream)
    ccall((:skiac_sk_w_stream_destroy, skia2), Cvoid, (Ptr{skiac_w_memory_stream},), c_w_memory_stream)
end

"""
    skiac_svg_text_to_path(data, length::Cint, c_collection, output_data)

$(_doc_external(:skiac_svg_text_to_path))
"""
function skiac_svg_text_to_path(data, length::Cint, c_collection, output_data)
    ccall((:skiac_svg_text_to_path, skia2), Cvoid, (Ptr{Cint}, Cint, Ptr{skiac_font_collection}, Ptr{skiac_sk_data}), data, length, c_collection, output_data)
end

"""
    skiac_picture_destroy(c_picture)

$(_doc_external(:skiac_picture_destroy))
"""
function skiac_picture_destroy(c_picture)
    ccall((:skiac_picture_destroy, skia2), Cvoid, (Ptr{skiac_picture},), c_picture)
end

"""
    skiac_picture_recorder_create()

$(_doc_external(:skiac_picture_recorder_create))
"""
function skiac_picture_recorder_create()
    ccall((:skiac_picture_recorder_create, skia2), Ptr{skiac_picture_recorder}, ())
end

"""
    skiac_picture_recorder_begin_recording(c_picture_recorder, x::Cfloat, y::Cfloat, width::Cfloat, height::Cfloat)

$(_doc_external(:skiac_picture_recorder_begin_recording))
"""
function skiac_picture_recorder_begin_recording(c_picture_recorder, x::Cfloat, y::Cfloat, width::Cfloat, height::Cfloat)
    ccall((:skiac_picture_recorder_begin_recording, skia2), Cvoid, (Ptr{skiac_picture_recorder}, Cfloat, Cfloat, Cfloat, Cfloat), c_picture_recorder, x, y, width, height)
end

"""
    skiac_picture_recorder_get_recording_canvas(c_picture_recorder)

$(_doc_external(:skiac_picture_recorder_get_recording_canvas))
"""
function skiac_picture_recorder_get_recording_canvas(c_picture_recorder)
    ccall((:skiac_picture_recorder_get_recording_canvas, skia2), Ptr{skiac_canvas}, (Ptr{skiac_picture_recorder},), c_picture_recorder)
end

"""
    skiac_picture_recorder_finish_recording_as_picture(c_picture_recorder)

$(_doc_external(:skiac_picture_recorder_finish_recording_as_picture))
"""
function skiac_picture_recorder_finish_recording_as_picture(c_picture_recorder)
    ccall((:skiac_picture_recorder_finish_recording_as_picture, skia2), Ptr{skiac_picture}, (Ptr{skiac_picture_recorder},), c_picture_recorder)
end



# exports
const PREFIXES = ["skiac"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
