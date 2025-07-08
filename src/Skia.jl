module Skia

using Skia_jll

const libskia = Skia_jll.libskia

function _doc_external(fname)
    return ""
end



to_c_type(t::Type) = t
to_c_type_pairs(va_list) = map(enumerate(to_c_type.(va_list))) do (ind, type)
    :(va_list[$ind]::$type)
end

"""
$(_doc_external(:sk_string_t))
"""
mutable struct sk_string_t end

"""
$(_doc_external(:sk_text_blob_t))
"""
mutable struct sk_text_blob_t end

"""
$(_doc_external(:sk_text_blob_builder_t))
"""
mutable struct sk_text_blob_builder_t end

"""
    sk_text_blob_builder_run_buffer_t

$(_doc_external(:sk_text_blob_builder_run_buffer_t))
"""
struct sk_text_blob_builder_run_buffer_t
    glyphs::Ptr{UInt16}
    pos::Ptr{Cfloat}
    utf8text::Ptr{UInt8}
    clusters::Ptr{UInt32}
end

"""
$(_doc_external(:sk_data_t))
"""
mutable struct sk_data_t end

"""
    sk_ipoint_t

$(_doc_external(:sk_ipoint_t))
"""
struct sk_ipoint_t
    x::Int32
    y::Int32
end

"""
    sk_point_t

$(_doc_external(:sk_point_t))
"""
struct sk_point_t
    x::Cfloat
    y::Cfloat
end

"""
    sk_point3_t

$(_doc_external(:sk_point3_t))
"""
struct sk_point3_t
    x::Cfloat
    y::Cfloat
    z::Cfloat
end

"""
    sk_isize_t

$(_doc_external(:sk_isize_t))
"""
struct sk_isize_t
    w::Int32
    h::Int32
end

"""
    sk_irect_t

$(_doc_external(:sk_irect_t))
"""
struct sk_irect_t
    left::Int32
    top::Int32
    right::Int32
    bottom::Int32
end

"""
    sk_rect_t

$(_doc_external(:sk_rect_t))
"""
struct sk_rect_t
    left::Cfloat
    top::Cfloat
    right::Cfloat
    bottom::Cfloat
end

"""
    sk_matrix_t

$(_doc_external(:sk_matrix_t))
"""
struct sk_matrix_t
    scaleX::Cfloat
    skewX::Cfloat
    transX::Cfloat
    skewY::Cfloat
    scaleY::Cfloat
    transY::Cfloat
    persp0::Cfloat
    persp1::Cfloat
    persp2::Cfloat
end

"""
    sk_path_add_mode_t

$(_doc_external(:sk_path_add_mode_t))
"""
@enum sk_path_add_mode_t::UInt32 begin
    SK_PATH_ADD_MODE_APPEND = 0
    SK_PATH_ADD_MODE_EXTEND = 1
end

"""
    sk_path_arc_size_t

$(_doc_external(:sk_path_arc_size_t))
"""
@enum sk_path_arc_size_t::UInt32 begin
    SK_PATH_ARC_SIZE_SMALL = 0
    SK_PATH_ARC_SIZE_LARGE = 1
end

"""
$(_doc_external(:sk_path_t))
"""
mutable struct sk_path_t end

"""
    sk_path_direction_t

$(_doc_external(:sk_path_direction_t))
"""
@enum sk_path_direction_t::UInt32 begin
    SK_PATH_DIRECTION_CW = 0
    SK_PATH_DIRECTION_CCW = 1
end

"""
    sk_path_fill_type_t

$(_doc_external(:sk_path_fill_type_t))
"""
@enum sk_path_fill_type_t::UInt32 begin
    SK_PATH_FILLTYPE_WINDING = 0
    SK_PATH_FILLTYPE_EVENODD = 1
    SK_PATH_FILLTYPE_INVERSE_WINDING = 2
    SK_PATH_FILLTYPE_INVERSE_EVENODD = 3
end

"""
    sk_path_effect_1d_style_t

$(_doc_external(:sk_path_effect_1d_style_t))
"""
@enum sk_path_effect_1d_style_t::UInt32 begin
    SK_PATH_EFFECT_1D_STYLE_TRANSLATE = 0
    SK_PATH_EFFECT_1D_STYLE_ROTATE = 1
    SK_PATH_EFFECT_1D_STYLE_MORPH = 2
    # SK_PATH_EFFECT_1D_STYLE_LAST = 2
end

"""
    sk_path_effect_trim_mode_t

$(_doc_external(:sk_path_effect_trim_mode_t))
"""
@enum sk_path_effect_trim_mode_t::UInt32 begin
    SK_PATH_EFFECT_TRIM_MODE_NORMAL = 0
    SK_PATH_EFFECT_TRIM_MODE_INVERTED = 1
end

"""
$(_doc_external(:sk_path_effect_t))
"""
mutable struct sk_path_effect_t end

"""
    sk_path_op_t

$(_doc_external(:sk_path_op_t))
"""
@enum sk_path_op_t::UInt32 begin
    SK_PATH_OP_DIFFERENCE = 0
    SK_PATH_OP_INTERSECT = 1
    SK_PATH_OP_UNION = 2
    SK_PATH_OP_XOR = 3
    SK_PATH_OP_REVERSE_DIFFERENCE = 4
end

"""
$(_doc_external(:sk_op_builder_t))
"""
mutable struct sk_op_builder_t end

"""
    sk_pixel_geometry_t

$(_doc_external(:sk_pixel_geometry_t))
"""
@enum sk_pixel_geometry_t::UInt32 begin
    SK_PIXEL_GEOMETRY_UNKNOWN = 0
    SK_PIXEL_GEOMETRY_RGB_H = 1
    SK_PIXEL_GEOMETRY_BGR_H = 2
    SK_PIXEL_GEOMETRY_RGB_V = 3
    SK_PIXEL_GEOMETRY_BGR_V = 4
end

"""
$(_doc_external(:sk_surface_props_t))
"""
mutable struct sk_surface_props_t end

"""
$(_doc_external(:sk_surface_t))
"""
mutable struct sk_surface_t end

"""
    gr_surface_origin_t

$(_doc_external(:gr_surface_origin_t))
"""
@enum gr_surface_origin_t::UInt32 begin
    GR_SURFACE_ORIGIN_TOP_LEFT = 0
    GR_SURFACE_ORIGIN_BOTTOM_LEFT = 1
end

"""
    gr_gl_framebufferinfo_t

$(_doc_external(:gr_gl_framebufferinfo_t))
"""
struct gr_gl_framebufferinfo_t
    fFBOID::Cuint
    fFormat::Cuint
    fProtected::Bool
end

"""
$(_doc_external(:gr_direct_context_t))
"""
mutable struct gr_direct_context_t end

"""
$(_doc_external(:gr_glinterface_t))
"""
mutable struct gr_glinterface_t end

"""
$(_doc_external(:gr_backendrendertarget_t))
"""
mutable struct gr_backendrendertarget_t end

"""
    sk_blend_mode_t

$(_doc_external(:sk_blend_mode_t))
"""
@enum sk_blend_mode_t::UInt32 begin
    SK_BLEND_MODE_CLEAR = 0
    SK_BLEND_MODE_SRC = 1
    SK_BLEND_MODE_DST = 2
    SK_BLEND_MODE_SRCOVER = 3
    SK_BLEND_MODE_DSTOVER = 4
    SK_BLEND_MODE_SRCIN = 5
    SK_BLEND_MODE_DSTIN = 6
    SK_BLEND_MODE_SRCOUT = 7
    SK_BLEND_MODE_DSTOUT = 8
    SK_BLEND_MODE_SRCATOP = 9
    SK_BLEND_MODE_DSTATOP = 10
    SK_BLEND_MODE_XOR = 11
    SK_BLEND_MODE_PLUS = 12
    SK_BLEND_MODE_MODULATE = 13
    SK_BLEND_MODE_SCREEN = 14
    SK_BLEND_MODE_OVERLAY = 15
    SK_BLEND_MODE_DARKEN = 16
    SK_BLEND_MODE_LIGHTEN = 17
    SK_BLEND_MODE_COLORDODGE = 18
    SK_BLEND_MODE_COLORBURN = 19
    SK_BLEND_MODE_HARDLIGHT = 20
    SK_BLEND_MODE_SOFTLIGHT = 21
    SK_BLEND_MODE_DIFFERENCE = 22
    SK_BLEND_MODE_EXCLUSION = 23
    SK_BLEND_MODE_MULTIPLY = 24
    SK_BLEND_MODE_HUE = 25
    SK_BLEND_MODE_SATURATION = 26
    SK_BLEND_MODE_COLOR = 27
    SK_BLEND_MODE_LUMINOSITY = 28
    # SK_BLEND_MODE_LAST_COEFF = 14
    # SK_BLEND_MODE_LAST_SEPARABLE = 24
    # SK_BLEND_MODE_LAST = 28
end

"""
    sk_blur_style_t

$(_doc_external(:sk_blur_style_t))
"""
@enum sk_blur_style_t::UInt32 begin
    SK_BLUR_STYLE_NORMAL = 0
    SK_BLUR_STYLE_SOLID = 1
    SK_BLUR_STYLE_OUTER = 2
    SK_BLUR_STYLE_INNER = 3
    # SK_BLUR_STYLE_LAST = 3
end

"""
    sk_clip_op_t

$(_doc_external(:sk_clip_op_t))
"""
@enum sk_clip_op_t::UInt32 begin
    SK_CLIP_OP_DIFFERENCE = 0
    SK_CLIP_OP_INTERSECT = 1
    # SK_CLIP_OP_LAST = 1
end

"""
    sk_high_contrast_config_invert_style_t

$(_doc_external(:sk_high_contrast_config_invert_style_t))
"""
@enum sk_high_contrast_config_invert_style_t::UInt32 begin
    SK_HIGH_CONTRAST_CONFIG_INVERT_STYLE_NO_INVERT = 0
    SK_HIGH_CONTRAST_CONFIG_INVERT_STYLE_INVERT_BRIGHTNESS = 1
    SK_HIGH_CONTRAST_CONFIG_INVERT_STYLE_INVERT_LIGHTNESS = 2
    # SK_HIGH_CONTRAST_CONFIG_INVERT_STYLE_LAST = 2
end

"""
    sk_high_contrast_config_t

$(_doc_external(:sk_high_contrast_config_t))
"""
struct sk_high_contrast_config_t
    grayscale::Bool
    invertStyle::sk_high_contrast_config_invert_style_t
    contrast::Cfloat
end

"""
    sk_color_channel_t

$(_doc_external(:sk_color_channel_t))
"""
@enum sk_color_channel_t::UInt32 begin
    SK_COLOR_CHANNEL_RED = 0
    SK_COLOR_CHANNEL_GREEN = 1
    SK_COLOR_CHANNEL_BLUE = 2
    SK_COLOR_CHANNEL_ALPHA = 3
    # SK_COLOR_CHANNEL_LAST = 3
end

"""
$(_doc_external(:sk_color_t))
"""
const sk_color_t = UInt32

"""
$(_doc_external(:sk_color_space_t))
"""
mutable struct sk_color_space_t end

"""
    sk_paint_style_t

$(_doc_external(:sk_paint_style_t))
"""
@enum sk_paint_style_t::UInt32 begin
    SK_PAINT_STYLE_FILL = 0
    SK_PAINT_STYLE_STROKE = 1
    SK_PAINT_STYLE_STROKE_AND_FILL = 2
end

"""
    sk_stroke_cap_t

$(_doc_external(:sk_stroke_cap_t))
"""
@enum sk_stroke_cap_t::UInt32 begin
    SK_STROKE_CAP_BUTT = 0
    SK_STROKE_CAP_ROUND = 1
    SK_STROKE_CAP_SQUARE = 2
    # SK_STROKE_CAP_LAST = 2
    # SK_STROKE_CAP_DEFAULT = 0
end

"""
    sk_stroke_join_t

$(_doc_external(:sk_stroke_join_t))
"""
@enum sk_stroke_join_t::UInt32 begin
    SK_STROKE_JOIN_MITER = 0
    SK_STROKE_JOIN_ROUND = 1
    SK_STROKE_JOIN_BEVEL = 2
    # SK_STROKE_JOIN_LAST = 2
    # SK_STROKE_JOIN_DEFAULT = 0
end

"""
$(_doc_external(:sk_paint_t))
"""
mutable struct sk_paint_t end

"""
    sk_color_type_t

$(_doc_external(:sk_color_type_t))
"""
@enum sk_color_type_t::UInt32 begin
    SK_COLOR_TYPE_UNKNOWN = 0
    SK_COLOR_TYPE_ALPHA_8 = 1
    SK_COLOR_TYPE_RGB_565 = 2
    SK_COLOR_TYPE_ARGB_4444 = 3
    SK_COLOR_TYPE_RGBA_8888 = 4
    SK_COLOR_TYPE_RGB_888X = 5
    SK_COLOR_TYPE_BGRA_8888 = 6
    SK_COLOR_TYPE_RGBA_1010102 = 7
    SK_COLOR_TYPE_BGRA_1010102 = 8
    SK_COLOR_TYPE_RGB_101010X = 9
    SK_COLOR_TYPE_BGR_101010X = 10
    SK_COLOR_TYPE_BGR_101010X_XR = 11
    SK_COLOR_TYPE_BGRA_10101010_XR = 12
    SK_COLOR_TYPE_RGBA_10x6 = 13
    SK_COLOR_TYPE_GRAY_8 = 14
    SK_COLOR_TYPE_RGBA_F16_NORM = 15
    SK_COLOR_TYPE_RGBA_F16 = 16
    SK_COLOR_TYPE_RGBA_F16F16F16x = 17
    SK_COLOR_TYPE_RGBA_F32 = 18
    SK_COLOR_TYPE_R8G8_UNORM = 19
    SK_COLOR_TYPE_A16_FLOAT = 20
    SK_COLOR_TYPE_R16G16_FLOAT = 21
    SK_COLOR_TYPE_A16_UNORM = 22
    SK_COLOR_TYPE_R16G16_UNORM = 23
    SK_COLOR_TYPE_R16G16B16A16_UNORM = 24
    SK_COLOR_TYPE_SRGBA_8888 = 25
    SK_COLOR_TYPE_R8_UNORM = 26
    # SK_COLOR_TYPE_LAST = 26
    # SK_COLOR_TYPE_N32 = 4
end

"""
    sk_alpha_type_t

$(_doc_external(:sk_alpha_type_t))
"""
@enum sk_alpha_type_t::UInt32 begin
    SK_ALPHA_TYPE_UNKNOWN = 0
    SK_ALPHA_TYPE_OPAQUE = 1
    SK_ALPHA_TYPE_PREMUL = 2
    SK_ALPHA_TYPE_UNPREMUL = 3
    # SK_ALPHA_TYPE_LAST = 3
end

"""
    sk_image_info_t

$(_doc_external(:sk_image_info_t))
"""
struct sk_image_info_t
    colorSpace::Ptr{sk_color_space_t}
    colorType::sk_color_type_t
    alphaType::sk_alpha_type_t
    width::Int32
    height::Int32
end

"""
    sk_image_caching_hint_t

$(_doc_external(:sk_image_caching_hint_t))
"""
@enum sk_image_caching_hint_t::UInt32 begin
    SK_IMAGE_CACHING_HINT_ALLOW = 0
    SK_IMAGE_CACHING_HINT_DISALLOW = 1
end

"""
$(_doc_external(:sk_image_t))
"""
mutable struct sk_image_t end

"""
$(_doc_external(:sk_image_filter_t))
"""
mutable struct sk_image_filter_t end

"""
$(_doc_external(:sk_mask_filter_t))
"""
mutable struct sk_mask_filter_t end

"""
$(_doc_external(:sk_color_filter_t))
"""
mutable struct sk_color_filter_t end

"""
    sk_cubic_resampler_t

$(_doc_external(:sk_cubic_resampler_t))
"""
struct sk_cubic_resampler_t
    B::Cfloat
    C::Cfloat
end

"""
    sk_filter_mode_t

$(_doc_external(:sk_filter_mode_t))
"""
@enum sk_filter_mode_t::UInt32 begin
    SK_FILTER_MODE_NEAREST = 0
    SK_FILTER_MODE_LINEAR = 1
    # SK_FILTER_MODE_LAST = 1
end

"""
    sk_mipmap_mode_t

$(_doc_external(:sk_mipmap_mode_t))
"""
@enum sk_mipmap_mode_t::UInt32 begin
    SK_MIPMAP_MODE_NONE = 0
    SK_MIPMAP_MODE_NEAREST = 1
    SK_MIPMAP_MODE_LINEAR = 2
    # SK_MIPMAP_MODE_LAST = 2
end

"""
    sk_sampling_options_t

$(_doc_external(:sk_sampling_options_t))
"""
struct sk_sampling_options_t
    maxAniso::Cint
    useCubic::Bool
    cubic::sk_cubic_resampler_t
    filter::sk_filter_mode_t
    mipmap::sk_mipmap_mode_t
end

"""
$(_doc_external(:sk_typeface_t))
"""
mutable struct sk_typeface_t end

"""
    sk_font_hinting_t

$(_doc_external(:sk_font_hinting_t))
"""
@enum sk_font_hinting_t::UInt32 begin
    SK_FONT_HINTING_NONE = 0
    SK_FONT_HINTING_SLIGHT = 1
    SK_FONT_HINTING_NORMAL = 2
    SK_FONT_HINTING_FULL = 3
end

"""
    sk_text_encoding_t

$(_doc_external(:sk_text_encoding_t))
"""
@enum sk_text_encoding_t::UInt32 begin
    SK_TEXT_ENCODING_UTF8 = 0
    SK_TEXT_ENCODING_UTF16 = 1
    SK_TEXT_ENCODING_UTF32 = 2
    SK_TEXT_ENCODING_GLYPH_ID = 3
end

"""
$(_doc_external(:sk_font_mgr_t))
"""
mutable struct sk_font_mgr_t end

"""
$(_doc_external(:sk_font_style_set_t))
"""
mutable struct sk_font_style_set_t end

"""
    sk_font_style_weight_t

$(_doc_external(:sk_font_style_weight_t))
"""
@enum sk_font_style_weight_t::UInt32 begin
    SK_FONT_STYLE_WEIGHT_INVISIBLE = 0
    SK_FONT_STYLE_WEIGHT_THIN = 100
    SK_FONT_STYLE_WEIGHT_EXTRA_LIGHT = 200
    SK_FONT_STYLE_WEIGHT_LIGHT = 300
    SK_FONT_STYLE_WEIGHT_NORMAL = 400
    SK_FONT_STYLE_WEIGHT_MEDIUM = 500
    SK_FONT_STYLE_WEIGHT_SEMI_BOLD = 600
    SK_FONT_STYLE_WEIGHT_BOLD = 700
    SK_FONT_STYLE_WEIGHT_EXTRA_BOLD = 800
    SK_FONT_STYLE_WEIGHT_BLACK = 900
    SK_FONT_STYLE_WEIGHT_EXTRA_BLACK = 1000
end

"""
    sk_font_style_width_t

$(_doc_external(:sk_font_style_width_t))
"""
@enum sk_font_style_width_t::UInt32 begin
    SK_FONT_STYLE_WIDTH_ULTRA_CONDENSED = 1
    SK_FONT_STYLE_WIDTH_EXTRA_CONDENSED = 2
    SK_FONT_STYLE_WIDTH_CONDENSED = 3
    SK_FONT_STYLE_WIDTH_SEMI_CONDENSED = 4
    SK_FONT_STYLE_WIDTH_NORMAL = 5
    SK_FONT_STYLE_WIDTH_SEMI_EXPANDED = 6
    SK_FONT_STYLE_WIDTH_EXPANDED = 7
    SK_FONT_STYLE_WIDTH_EXTRA_EXPANDED = 8
    SK_FONT_STYLE_WIDTH_ULTRA_EXPANDED = 9
end

"""
    sk_font_style_slant_t

$(_doc_external(:sk_font_style_slant_t))
"""
@enum sk_font_style_slant_t::UInt32 begin
    SK_FONT_STYLE_SLANT_UPRIGHT = 0
    SK_FONT_STYLE_SLANT_ITALIC = 1
    SK_FONT_STYLE_SLANT_OBLIQUE = 2
end

"""
$(_doc_external(:sk_font_style_t))
"""
mutable struct sk_font_style_t end

"""
    sk_font_metrics_flags_t

$(_doc_external(:sk_font_metrics_flags_t))
"""
@enum sk_font_metrics_flags_t::UInt32 begin
    SK_FONT_METRICS_FLAG_UNDERLINE_THICKNESS_IS_VALID = 1
    SK_FONT_METRICS_FLAG_UNDERLINE_POSITION_IS_VALID = 2
    SK_FONT_METRICS_FLAG_STRIKEOUT_THICKNESS_IS_VALID = 4
    SK_FONT_METRICS_FLAG_STRIKEOUT_POSITION_IS_VALID = 8
    SK_FONT_METRICS_FLAG_BOUNDS_INVALID = 16
end

"""
    sk_font_metrics_t

$(_doc_external(:sk_font_metrics_t))
"""
struct sk_font_metrics_t
    flags::UInt32
    top::Cfloat
    ascent::Cfloat
    descent::Cfloat
    bottom::Cfloat
    leading::Cfloat
    avgCharWidth::Cfloat
    maxCharWidth::Cfloat
    xMin::Cfloat
    xMax::Cfloat
    xHeight::Cfloat
    capHeight::Cfloat
    underlineThickness::Cfloat
    underlinePosition::Cfloat
    strikeoutThickness::Cfloat
    strikeoutPosition::Cfloat
end

"""
$(_doc_external(:sk_font_t))
"""
mutable struct sk_font_t end

"""
    sk_point_mode_t

$(_doc_external(:sk_point_mode_t))
"""
@enum sk_point_mode_t::UInt32 begin
    SK_POINT_MODE_POINTS = 0
    SK_POINT_MODE_LINES = 1
    SK_POINT_MODE_POLYGON = 2
end

"""
    sk_src_rect_constraint_t

$(_doc_external(:sk_src_rect_constraint_t))
"""
@enum sk_src_rect_constraint_t::UInt32 begin
    SRC_RECT_CONSTRAINT_STRICT = 0
    SRC_RECT_CONSTRAINT_FAST = 1
end

"""
$(_doc_external(:sk_canvas_t))
"""
mutable struct sk_canvas_t end

"""
    sk_tile_mode_t

$(_doc_external(:sk_tile_mode_t))
"""
@enum sk_tile_mode_t::UInt32 begin
    SK_TILE_MODE_CLAMP = 0
    SK_TILE_REPEAT = 1
    SK_TILE_MIRROR = 2
    SK_TILE_DECAL = 3
    # SK_TILE_LAST = 3
end

"""
$(_doc_external(:sk_shader_t))
"""
mutable struct sk_shader_t end

"""
    sk_date_time_t

$(_doc_external(:sk_date_time_t))
"""
struct sk_date_time_t
    timeZoneMinutes::Int16
    year::UInt16
    month::UInt8
    dayOfWeek::UInt8
    day::UInt8
    hour::UInt8
    minute::UInt8
    second::UInt8
end

"""
$(_doc_external(:sk_wstream_t))
"""
mutable struct sk_wstream_t end

"""
$(_doc_external(:sk_file_wstream_t))
"""
mutable struct sk_file_wstream_t end

"""
$(_doc_external(:sk_dynamic_memory_wstream_t))
"""
mutable struct sk_dynamic_memory_wstream_t end

"""
    sk_metadata_t

$(_doc_external(:sk_metadata_t))
"""
struct sk_metadata_t
    title::Ptr{UInt8}
    author::Ptr{UInt8}
    subject::Ptr{UInt8}
    keywords::Ptr{UInt8}
    creator::Ptr{UInt8}
    producer::Ptr{UInt8}
    creation::sk_date_time_t
    modified::sk_date_time_t
    rasterDPI::Cfloat
    unused::Cfloat
    encodingQuality::Cint
end

"""
$(_doc_external(:sk_document_t))
"""
mutable struct sk_document_t end

"""
    gr_backendrendertarget_new_gl(width::Cint, height::Cint, samples::Cint, stencils::Cint, glInfo)

$(_doc_external(:gr_backendrendertarget_new_gl))
"""
function gr_backendrendertarget_new_gl(width::Cint, height::Cint, samples::Cint, stencils::Cint, glInfo)
    ccall((:gr_backendrendertarget_new_gl, libskia), Ptr{gr_backendrendertarget_t}, (Cint, Cint, Cint, Cint, Ptr{gr_gl_framebufferinfo_t}), width, height, samples, stencils, glInfo)
end

"""
    gr_backendrendertarget_delete(rendertarget)

$(_doc_external(:gr_backendrendertarget_delete))
"""
function gr_backendrendertarget_delete(rendertarget)
    ccall((:gr_backendrendertarget_delete, libskia), Cvoid, (Ptr{gr_backendrendertarget_t},), rendertarget)
end

"""
    gr_direct_context_make_gl(glInterface)

$(_doc_external(:gr_direct_context_make_gl))
"""
function gr_direct_context_make_gl(glInterface)
    ccall((:gr_direct_context_make_gl, libskia), Ptr{gr_direct_context_t}, (Ptr{gr_glinterface_t},), glInterface)
end

"""
    gr_direct_context_abandon_context(context)

$(_doc_external(:gr_direct_context_abandon_context))
"""
function gr_direct_context_abandon_context(context)
    ccall((:gr_direct_context_abandon_context, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_direct_context_delete(context)

$(_doc_external(:gr_direct_context_delete))
"""
function gr_direct_context_delete(context)
    ccall((:gr_direct_context_delete, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_direct_context_flush_and_submit(context, syncCPU::Bool)

$(_doc_external(:gr_direct_context_flush_and_submit))
"""
function gr_direct_context_flush_and_submit(context, syncCPU::Bool)
    ccall((:gr_direct_context_flush_and_submit, libskia), Cvoid, (Ptr{gr_direct_context_t}, Bool), context, syncCPU)
end

"""
    gr_direct_context_release_resources_and_abandon_context(context)

$(_doc_external(:gr_direct_context_release_resources_and_abandon_context))
"""
function gr_direct_context_release_resources_and_abandon_context(context)
    ccall((:gr_direct_context_release_resources_and_abandon_context, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_direct_context_reset(context)

$(_doc_external(:gr_direct_context_reset))
"""
function gr_direct_context_reset(context)
    ccall((:gr_direct_context_reset, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_direct_context_reset_gl_texture_bindings(context)

$(_doc_external(:gr_direct_context_reset_gl_texture_bindings))
"""
function gr_direct_context_reset_gl_texture_bindings(context)
    ccall((:gr_direct_context_reset_gl_texture_bindings, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_direct_context_unref(context)

$(_doc_external(:gr_direct_context_unref))
"""
function gr_direct_context_unref(context)
    ccall((:gr_direct_context_unref, libskia), Cvoid, (Ptr{gr_direct_context_t},), context)
end

"""
    gr_glinterface_create_native_interface()

$(_doc_external(:gr_glinterface_create_native_interface))
"""
function gr_glinterface_create_native_interface()
    ccall((:gr_glinterface_create_native_interface, libskia), Ptr{gr_glinterface_t}, ())
end

"""
    gr_glinterface_unref(intf)

$(_doc_external(:gr_glinterface_unref))
"""
function gr_glinterface_unref(intf)
    ccall((:gr_glinterface_unref, libskia), Cvoid, (Ptr{gr_glinterface_t},), intf)
end

"""
    sk_canvas_get_surface(canvas)

$(_doc_external(:sk_canvas_get_surface))
"""
function sk_canvas_get_surface(canvas)
    ccall((:sk_canvas_get_surface, libskia), Ptr{sk_surface_t}, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_clear(canvas, color::sk_color_t)

$(_doc_external(:sk_canvas_clear))
"""
function sk_canvas_clear(canvas, color::sk_color_t)
    ccall((:sk_canvas_clear, libskia), Cvoid, (Ptr{sk_canvas_t}, sk_color_t), canvas, color)
end

"""
    sk_canvas_clip_path_with_operation(t, crect, op::sk_clip_op_t, doAA::Bool)

$(_doc_external(:sk_canvas_clip_path_with_operation))
"""
function sk_canvas_clip_path_with_operation(t, crect, op::sk_clip_op_t, doAA::Bool)
    ccall((:sk_canvas_clip_path_with_operation, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_path_t}, sk_clip_op_t, Bool), t, crect, op, doAA)
end

"""
    sk_canvas_clip_rect_with_operation(t, crect, op::sk_clip_op_t, doAA::Bool)

$(_doc_external(:sk_canvas_clip_rect_with_operation))
"""
function sk_canvas_clip_rect_with_operation(t, crect, op::sk_clip_op_t, doAA::Bool)
    ccall((:sk_canvas_clip_rect_with_operation, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, sk_clip_op_t, Bool), t, crect, op, doAA)
end

"""
    sk_canvas_concat(canvas, matrix)

$(_doc_external(:sk_canvas_concat))
"""
function sk_canvas_concat(canvas, matrix)
    ccall((:sk_canvas_concat, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_matrix_t}), canvas, matrix)
end

"""
    sk_canvas_draw_arc(canvas, oval, startAngle::Cfloat, sweepAngle::Cfloat, useCenter::Bool, paint)

$(_doc_external(:sk_canvas_draw_arc))
"""
function sk_canvas_draw_arc(canvas, oval, startAngle::Cfloat, sweepAngle::Cfloat, useCenter::Bool, paint)
    ccall((:sk_canvas_draw_arc, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, Cfloat, Cfloat, Bool, Ptr{sk_paint_t}), canvas, oval, startAngle, sweepAngle, useCenter, paint)
end

"""
    sk_canvas_draw_circle(canvas, cx::Cfloat, cy::Cfloat, rad::Cfloat, cpaint)

$(_doc_external(:sk_canvas_draw_circle))
"""
function sk_canvas_draw_circle(canvas, cx::Cfloat, cy::Cfloat, rad::Cfloat, cpaint)
    ccall((:sk_canvas_draw_circle, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat, Cfloat, Ptr{sk_paint_t}), canvas, cx, cy, rad, cpaint)
end

"""
    sk_canvas_draw_color(canvas, color::sk_color_t, mode::sk_blend_mode_t)

$(_doc_external(:sk_canvas_draw_color))
"""
function sk_canvas_draw_color(canvas, color::sk_color_t, mode::sk_blend_mode_t)
    ccall((:sk_canvas_draw_color, libskia), Cvoid, (Ptr{sk_canvas_t}, sk_color_t, sk_blend_mode_t), canvas, color, mode)
end

"""
    sk_canvas_draw_image_nine(t, image, center, dst, filter::sk_filter_mode_t, paint)

$(_doc_external(:sk_canvas_draw_image_nine))
"""
function sk_canvas_draw_image_nine(t, image, center, dst, filter::sk_filter_mode_t, paint)
    ccall((:sk_canvas_draw_image_nine, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_image_t}, Ptr{sk_irect_t}, Ptr{sk_rect_t}, sk_filter_mode_t, Ptr{sk_paint_t}), t, image, center, dst, filter, paint)
end

"""
    sk_canvas_draw_image_rect(canvas, cimage, csrcR, cdstR, samplingOptions, cpaint, constraint::sk_src_rect_constraint_t)

$(_doc_external(:sk_canvas_draw_image_rect))
"""
function sk_canvas_draw_image_rect(canvas, cimage, csrcR, cdstR, samplingOptions, cpaint, constraint::sk_src_rect_constraint_t)
    ccall((:sk_canvas_draw_image_rect, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_image_t}, Ptr{sk_rect_t}, Ptr{sk_rect_t}, Ptr{sk_sampling_options_t}, Ptr{sk_paint_t}, sk_src_rect_constraint_t), canvas, cimage, csrcR, cdstR, samplingOptions, cpaint, constraint)
end

"""
    sk_canvas_draw_line(canvas, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, cpaint)

$(_doc_external(:sk_canvas_draw_line))
"""
function sk_canvas_draw_line(canvas, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, cpaint)
    ccall((:sk_canvas_draw_line, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat, Cfloat, Cfloat, Ptr{sk_paint_t}), canvas, x0, y0, x1, y1, cpaint)
end

"""
    sk_canvas_draw_oval(canvas, crect, cpaint)

$(_doc_external(:sk_canvas_draw_oval))
"""
function sk_canvas_draw_oval(canvas, crect, cpaint)
    ccall((:sk_canvas_draw_oval, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, Ptr{sk_paint_t}), canvas, crect, cpaint)
end

"""
    sk_canvas_draw_paint(canvas, cpaint)

$(_doc_external(:sk_canvas_draw_paint))
"""
function sk_canvas_draw_paint(canvas, cpaint)
    ccall((:sk_canvas_draw_paint, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_paint_t}), canvas, cpaint)
end

"""
    sk_canvas_draw_path(canvas, cpath, cpaint)

$(_doc_external(:sk_canvas_draw_path))
"""
function sk_canvas_draw_path(canvas, cpath, cpaint)
    ccall((:sk_canvas_draw_path, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_path_t}, Ptr{sk_paint_t}), canvas, cpath, cpaint)
end

"""
    sk_canvas_draw_point(canvas, x::Cfloat, y::Cfloat, cpaint)

$(_doc_external(:sk_canvas_draw_point))
"""
function sk_canvas_draw_point(canvas, x::Cfloat, y::Cfloat, cpaint)
    ccall((:sk_canvas_draw_point, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat, Ptr{sk_paint_t}), canvas, x, y, cpaint)
end

"""
    sk_canvas_draw_points(canvas, pointMode::sk_point_mode_t, count::Csize_t, points, cpaint)

$(_doc_external(:sk_canvas_draw_points))
"""
function sk_canvas_draw_points(canvas, pointMode::sk_point_mode_t, count::Csize_t, points, cpaint)
    ccall((:sk_canvas_draw_points, libskia), Cvoid, (Ptr{sk_canvas_t}, sk_point_mode_t, Csize_t, Ptr{sk_point_t}, Ptr{sk_paint_t}), canvas, pointMode, count, points, cpaint)
end

"""
    sk_canvas_draw_rect(canvas, crect, cpaint)

$(_doc_external(:sk_canvas_draw_rect))
"""
function sk_canvas_draw_rect(canvas, crect, cpaint)
    ccall((:sk_canvas_draw_rect, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, Ptr{sk_paint_t}), canvas, crect, cpaint)
end

"""
    sk_canvas_draw_round_rect(canvas, crect, rx::Cfloat, ry::Cfloat, cpaint)

$(_doc_external(:sk_canvas_draw_round_rect))
"""
function sk_canvas_draw_round_rect(canvas, crect, rx::Cfloat, ry::Cfloat, cpaint)
    ccall((:sk_canvas_draw_round_rect, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, Cfloat, Cfloat, Ptr{sk_paint_t}), canvas, crect, rx, ry, cpaint)
end


"""
    sk_canvas_draw_string(canvas, text, x::Cfloat, y::Cfloat, cfont, cpaint)

$(_doc_external(:sk_canvas_draw_string))
"""
function sk_canvas_draw_string(canvas, text, x::Cfloat, y::Cfloat, cfont, cpaint)
    ccall((:sk_canvas_draw_string, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{Cchar}, Cfloat, Cfloat, Ptr{sk_font_t}, Ptr{sk_paint_t}), canvas, text, x, y, cfont, cpaint)
end

"""
    sk_canvas_draw_simple_text(canvas, text, byte_length::Csize_t, encoding::sk_text_encoding_t, x::Cfloat, y::Cfloat, cfont, cpaint)

$(_doc_external(:sk_canvas_draw_simple_text))
"""
function sk_canvas_draw_simple_text(canvas, text, byte_length::Csize_t, encoding::sk_text_encoding_t, x::Cfloat, y::Cfloat, cfont, cpaint)
    ccall((:sk_canvas_draw_simple_text, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{Cvoid}, Csize_t, sk_text_encoding_t, Cfloat, Cfloat, Ptr{sk_font_t}, Ptr{sk_paint_t}), canvas, text, byte_length, encoding, x, y, cfont, cpaint)
end

"""
    sk_canvas_draw_text_blob(canvas, text, x::Cfloat, y::Cfloat, paint)

$(_doc_external(:sk_canvas_draw_text_blob))
"""
function sk_canvas_draw_text_blob(canvas, text, x::Cfloat, y::Cfloat, paint)
    ccall((:sk_canvas_draw_text_blob, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_text_blob_t}, Cfloat, Cfloat, Ptr{sk_paint_t}), canvas, text, x, y, paint)
end

"""
    sk_canvas_get_local_clip_bounds(canvas, cbounds)

$(_doc_external(:sk_canvas_get_local_clip_bounds))
"""
function sk_canvas_get_local_clip_bounds(canvas, cbounds)
    ccall((:sk_canvas_get_local_clip_bounds, libskia), Bool, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}), canvas, cbounds)
end

"""
    sk_canvas_get_save_count(canvas)

$(_doc_external(:sk_canvas_get_save_count))
"""
function sk_canvas_get_save_count(canvas)
    ccall((:sk_canvas_get_save_count, libskia), Cint, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_get_total_matrix(canvas, matrix)

$(_doc_external(:sk_canvas_get_total_matrix))
"""
function sk_canvas_get_total_matrix(canvas, matrix)
    ccall((:sk_canvas_get_total_matrix, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_matrix_t}), canvas, matrix)
end

"""
    sk_canvas_is_clip_empty(canvas)

$(_doc_external(:sk_canvas_is_clip_empty))
"""
function sk_canvas_is_clip_empty(canvas)
    ccall((:sk_canvas_is_clip_empty, libskia), Bool, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_is_clip_rect(canvas)

$(_doc_external(:sk_canvas_is_clip_rect))
"""
function sk_canvas_is_clip_rect(canvas)
    ccall((:sk_canvas_is_clip_rect, libskia), Bool, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_quick_reject_path(canvas, path)

$(_doc_external(:sk_canvas_quick_reject_path))
"""
function sk_canvas_quick_reject_path(canvas, path)
    ccall((:sk_canvas_quick_reject_path, libskia), Bool, (Ptr{sk_canvas_t}, Ptr{sk_path_t}), canvas, path)
end

"""
    sk_canvas_quick_reject_rect(canvas, rect)

$(_doc_external(:sk_canvas_quick_reject_rect))
"""
function sk_canvas_quick_reject_rect(canvas, rect)
    ccall((:sk_canvas_quick_reject_rect, libskia), Bool, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}), canvas, rect)
end

"""
    sk_canvas_reset_matrix(canvas)

$(_doc_external(:sk_canvas_reset_matrix))
"""
function sk_canvas_reset_matrix(canvas)
    ccall((:sk_canvas_reset_matrix, libskia), Cvoid, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_restore(canvas)

$(_doc_external(:sk_canvas_restore))
"""
function sk_canvas_restore(canvas)
    ccall((:sk_canvas_restore, libskia), Cvoid, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_restore_to_count(canvas, saveCount::Cint)

$(_doc_external(:sk_canvas_restore_to_count))
"""
function sk_canvas_restore_to_count(canvas, saveCount::Cint)
    ccall((:sk_canvas_restore_to_count, libskia), Cvoid, (Ptr{sk_canvas_t}, Cint), canvas, saveCount)
end

"""
    sk_canvas_rotate_radians(canvas, radians::Cfloat)

$(_doc_external(:sk_canvas_rotate_radians))
"""
function sk_canvas_rotate_radians(canvas, radians::Cfloat)
    ccall((:sk_canvas_rotate_radians, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat), canvas, radians)
end

"""
    sk_canvas_save(canvas)

$(_doc_external(:sk_canvas_save))
"""
function sk_canvas_save(canvas)
    ccall((:sk_canvas_save, libskia), Cint, (Ptr{sk_canvas_t},), canvas)
end

"""
    sk_canvas_save_layer(canvas, crect, cpaint)

$(_doc_external(:sk_canvas_save_layer))
"""
function sk_canvas_save_layer(canvas, crect, cpaint)
    ccall((:sk_canvas_save_layer, libskia), Cint, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, Ptr{sk_paint_t}), canvas, crect, cpaint)
end

"""
    sk_canvas_save_layer_alpha(canvas, crect, alpha::UInt8)

$(_doc_external(:sk_canvas_save_layer_alpha))
"""
function sk_canvas_save_layer_alpha(canvas, crect, alpha::UInt8)
    ccall((:sk_canvas_save_layer_alpha, libskia), Cint, (Ptr{sk_canvas_t}, Ptr{sk_rect_t}, UInt8), canvas, crect, alpha)
end

"""
    sk_canvas_scale(canvas, sx::Cfloat, sy::Cfloat)

$(_doc_external(:sk_canvas_scale))
"""
function sk_canvas_scale(canvas, sx::Cfloat, sy::Cfloat)
    ccall((:sk_canvas_scale, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat), canvas, sx, sy)
end

"""
    sk_canvas_set_matrix(canvas, matrix)

$(_doc_external(:sk_canvas_set_matrix))
"""
function sk_canvas_set_matrix(canvas, matrix)
    ccall((:sk_canvas_set_matrix, libskia), Cvoid, (Ptr{sk_canvas_t}, Ptr{sk_matrix_t}), canvas, matrix)
end

"""
    sk_canvas_skew(canvas, sx::Cfloat, sy::Cfloat)

$(_doc_external(:sk_canvas_skew))
"""
function sk_canvas_skew(canvas, sx::Cfloat, sy::Cfloat)
    ccall((:sk_canvas_skew, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat), canvas, sx, sy)
end

"""
    sk_canvas_translate(canvas, dx::Cfloat, dy::Cfloat)

$(_doc_external(:sk_canvas_translate))
"""
function sk_canvas_translate(canvas, dx::Cfloat, dy::Cfloat)
    ccall((:sk_canvas_translate, libskia), Cvoid, (Ptr{sk_canvas_t}, Cfloat, Cfloat), canvas, dx, dy)
end

"""
    sk_colorfilter_new_color_matrix(array)

$(_doc_external(:sk_colorfilter_new_color_matrix))
"""
function sk_colorfilter_new_color_matrix(array)
    ccall((:sk_colorfilter_new_color_matrix, libskia), Ptr{sk_color_filter_t}, (Ptr{Cfloat},), array)
end

"""
    sk_colorfilter_new_compose(outer, inner)

$(_doc_external(:sk_colorfilter_new_compose))
"""
function sk_colorfilter_new_compose(outer, inner)
    ccall((:sk_colorfilter_new_compose, libskia), Ptr{sk_color_filter_t}, (Ptr{sk_color_filter_t}, Ptr{sk_color_filter_t}), outer, inner)
end

"""
    sk_colorfilter_new_high_contrast(config)

$(_doc_external(:sk_colorfilter_new_high_contrast))
"""
function sk_colorfilter_new_high_contrast(config)
    ccall((:sk_colorfilter_new_high_contrast, libskia), Ptr{sk_color_filter_t}, (Ptr{sk_high_contrast_config_t},), config)
end

"""
    sk_colorfilter_new_lighting(mul::sk_color_t, add::sk_color_t)

$(_doc_external(:sk_colorfilter_new_lighting))
"""
function sk_colorfilter_new_lighting(mul::sk_color_t, add::sk_color_t)
    ccall((:sk_colorfilter_new_lighting, libskia), Ptr{sk_color_filter_t}, (sk_color_t, sk_color_t), mul, add)
end

"""
    sk_colorfilter_new_luma_color()

$(_doc_external(:sk_colorfilter_new_luma_color))
"""
function sk_colorfilter_new_luma_color()
    ccall((:sk_colorfilter_new_luma_color, libskia), Ptr{sk_color_filter_t}, ())
end

"""
    sk_colorfilter_new_mode(c::sk_color_t, mode::sk_blend_mode_t)

$(_doc_external(:sk_colorfilter_new_mode))
"""
function sk_colorfilter_new_mode(c::sk_color_t, mode::sk_blend_mode_t)
    ccall((:sk_colorfilter_new_mode, libskia), Ptr{sk_color_filter_t}, (sk_color_t, sk_blend_mode_t), c, mode)
end

"""
    sk_colorfilter_unref(filter)

$(_doc_external(:sk_colorfilter_unref))
"""
function sk_colorfilter_unref(filter)
    ccall((:sk_colorfilter_unref, libskia), Cvoid, (Ptr{sk_color_filter_t},), filter)
end

"""
    sk_colorspace_new_srgb()

$(_doc_external(:sk_colorspace_new_srgb))
"""
function sk_colorspace_new_srgb()
    ccall((:sk_colorspace_new_srgb, libskia), Ptr{sk_color_space_t}, ())
end

"""
    sk_data_get_data(data)

$(_doc_external(:sk_data_get_data))
"""
function sk_data_get_data(data)
    ccall((:sk_data_get_data, libskia), Ptr{Cvoid}, (Ptr{sk_data_t},), data)
end

"""
    sk_data_get_size(data)

$(_doc_external(:sk_data_get_size))
"""
function sk_data_get_size(data)
    ccall((:sk_data_get_size, libskia), Csize_t, (Ptr{sk_data_t},), data)
end

"""
    sk_data_new_with_copy(src, length::Csize_t)

$(_doc_external(:sk_data_new_with_copy))
"""
function sk_data_new_with_copy(src, length::Csize_t)
    ccall((:sk_data_new_with_copy, libskia), Ptr{sk_data_t}, (Ptr{Cvoid}, Csize_t), src, length)
end

"""
    sk_data_unref(data)

$(_doc_external(:sk_data_unref))
"""
function sk_data_unref(data)
    ccall((:sk_data_unref, libskia), Cvoid, (Ptr{sk_data_t},), data)
end

"""
    sk_encode_jpeg(ctx, img, quality::Cint)

$(_doc_external(:sk_encode_jpeg))
"""
function sk_encode_jpeg(ctx, img, quality::Cint)
    ccall((:sk_encode_jpeg, libskia), Ptr{sk_data_t}, (Ptr{gr_direct_context_t}, Ptr{sk_image_t}, Cint), ctx, img, quality)
end

"""
    sk_encode_png(ctx, img, compressionLevel::Cint)

$(_doc_external(:sk_encode_png))
"""
function sk_encode_png(ctx, img, compressionLevel::Cint)
    ccall((:sk_encode_png, libskia), Ptr{sk_data_t}, (Ptr{gr_direct_context_t}, Ptr{sk_image_t}, Cint), ctx, img, compressionLevel)
end

"""
    sk_encode_webp(ctx, img, quality::Cfloat, lossy::Bool)

$(_doc_external(:sk_encode_webp))
"""
function sk_encode_webp(ctx, img, quality::Cfloat, lossy::Bool)
    ccall((:sk_encode_webp, libskia), Ptr{sk_data_t}, (Ptr{gr_direct_context_t}, Ptr{sk_image_t}, Cfloat, Bool), ctx, img, quality, lossy)
end

"""
    sk_font_delete(font)

$(_doc_external(:sk_font_delete))
"""
function sk_font_delete(font)
    ccall((:sk_font_delete, libskia), Cvoid, (Ptr{sk_font_t},), font)
end

"""
    sk_font_get_metrics(font, metrics)

$(_doc_external(:sk_font_get_metrics))
"""
function sk_font_get_metrics(font, metrics)
    ccall((:sk_font_get_metrics, libskia), Cfloat, (Ptr{sk_font_t}, Ptr{sk_font_metrics_t}), font, metrics)
end

"""
    sk_font_get_xpos(font, glyphs, count::Cint, xpos, origin::Cfloat)

$(_doc_external(:sk_font_get_xpos))
"""
function sk_font_get_xpos(font, glyphs, count::Cint, xpos, origin::Cfloat)
    ccall((:sk_font_get_xpos, libskia), Cvoid, (Ptr{sk_font_t}, Ptr{UInt16}, Cint, Ptr{Cfloat}, Cfloat), font, glyphs, count, xpos, origin)
end

"""
    sk_font_measure_text(font, text, byteLength::Csize_t, encoding::sk_text_encoding_t, bounds, paint)

$(_doc_external(:sk_font_measure_text))
"""
function sk_font_measure_text(font, text, byteLength::Csize_t, encoding::sk_text_encoding_t, bounds, paint)
    ccall((:sk_font_measure_text, libskia), Cfloat, (Ptr{sk_font_t}, Ptr{Cvoid}, Csize_t, sk_text_encoding_t, Ptr{sk_rect_t}, Ptr{sk_paint_t}), font, text, byteLength, encoding, bounds, paint)
end

"""
    sk_font_new_with_values(typeface, size::Cfloat, scaleX::Cfloat, skewX::Cfloat)

$(_doc_external(:sk_font_new_with_values))
"""
function sk_font_new_with_values(typeface, size::Cfloat, scaleX::Cfloat, skewX::Cfloat)
    ccall((:sk_font_new_with_values, libskia), Ptr{sk_font_t}, (Ptr{sk_typeface_t}, Cfloat, Cfloat, Cfloat), typeface, size, scaleX, skewX)
end

"""
    sk_font_set_force_auto_hinting(font, value::Bool)

$(_doc_external(:sk_font_set_force_auto_hinting))
"""
function sk_font_set_force_auto_hinting(font, value::Bool)
    ccall((:sk_font_set_force_auto_hinting, libskia), Cvoid, (Ptr{sk_font_t}, Bool), font, value)
end

"""
    sk_font_set_hinting(font, value::sk_font_hinting_t)

$(_doc_external(:sk_font_set_hinting))
"""
function sk_font_set_hinting(font, value::sk_font_hinting_t)
    ccall((:sk_font_set_hinting, libskia), Cvoid, (Ptr{sk_font_t}, sk_font_hinting_t), font, value)
end

"""
    sk_font_set_subpixel(font, value::Bool)

$(_doc_external(:sk_font_set_subpixel))
"""
function sk_font_set_subpixel(font, value::Bool)
    ccall((:sk_font_set_subpixel, libskia), Cvoid, (Ptr{sk_font_t}, Bool), font, value)
end

"""
    sk_font_text_to_glyphs(font, text, byteLength::Csize_t, encoding::sk_text_encoding_t, glyphs, maxGlyphCount::Cint)

$(_doc_external(:sk_font_text_to_glyphs))
"""
function sk_font_text_to_glyphs(font, text, byteLength::Csize_t, encoding::sk_text_encoding_t, glyphs, maxGlyphCount::Cint)
    ccall((:sk_font_text_to_glyphs, libskia), Cint, (Ptr{sk_font_t}, Ptr{Cvoid}, Csize_t, sk_text_encoding_t, Ptr{UInt16}, Cint), font, text, byteLength, encoding, glyphs, maxGlyphCount)
end

"""
    sk_font_unichar_to_glyph(font, unichar::Int32)

$(_doc_external(:sk_font_unichar_to_glyph))
"""
function sk_font_unichar_to_glyph(font, unichar::Int32)
    ccall((:sk_font_unichar_to_glyph, libskia), UInt16, (Ptr{sk_font_t}, Int32), font, unichar)
end

"""
    sk_font_unichars_to_glyphs(font, unichars, count::Cint, glyphs)

$(_doc_external(:sk_font_unichars_to_glyphs))
"""
function sk_font_unichars_to_glyphs(font, unichars, count::Cint, glyphs)
    ccall((:sk_font_unichars_to_glyphs, libskia), Cvoid, (Ptr{sk_font_t}, Ptr{Int32}, Cint, Ptr{UInt16}), font, unichars, count, glyphs)
end

"""
    sk_font_glyph_widths(font, glyphs, count::Cint, widths)

$(_doc_external(:sk_font_glyph_widths))
"""
function sk_font_glyph_widths(font, glyphs, count::Cint, widths)
    ccall((:sk_font_glyph_widths, libskia), Cvoid, (Ptr{sk_font_t}, Ptr{UInt16}, Cint, Ptr{Cfloat}), font, glyphs, count, widths)
end

"""
    sk_fontmgr_count_families(fontmgr)

$(_doc_external(:sk_fontmgr_count_families))
"""
function sk_fontmgr_count_families(fontmgr)
    ccall((:sk_fontmgr_count_families, libskia), Cint, (Ptr{sk_font_mgr_t},), fontmgr)
end

"""
    sk_fontmgr_create_from_data(fontmgr, data, index::Cint)

$(_doc_external(:sk_fontmgr_create_from_data))
"""
function sk_fontmgr_create_from_data(fontmgr, data, index::Cint)
    ccall((:sk_fontmgr_create_from_data, libskia), Ptr{sk_typeface_t}, (Ptr{sk_font_mgr_t}, Ptr{sk_data_t}, Cint), fontmgr, data, index)
end

"""
    sk_fontmgr_get_family_name(fontmgr, index::Cint, familyName)

$(_doc_external(:sk_fontmgr_get_family_name))
"""
function sk_fontmgr_get_family_name(fontmgr, index::Cint, familyName)
    ccall((:sk_fontmgr_get_family_name, libskia), Cvoid, (Ptr{sk_font_mgr_t}, Cint, Ptr{sk_string_t}), fontmgr, index, familyName)
end

"""
    sk_fontmgr_match_family(fontmgr, familyName)

$(_doc_external(:sk_fontmgr_match_family))
"""
function sk_fontmgr_match_family(fontmgr, familyName)
    ccall((:sk_fontmgr_match_family, libskia), Ptr{sk_font_style_set_t}, (Ptr{sk_font_mgr_t}, Ptr{UInt8}), fontmgr, familyName)
end

"""
    sk_fontmgr_match_family_style(fontmgr, familyName, style)

$(_doc_external(:sk_fontmgr_match_family_style))
"""
function sk_fontmgr_match_family_style(fontmgr, familyName, style)
    ccall((:sk_fontmgr_match_family_style, libskia), Ptr{sk_typeface_t}, (Ptr{sk_font_mgr_t}, Ptr{UInt8}, Ptr{sk_font_style_t}), fontmgr, familyName, style)
end

"""
    sk_fontmgr_match_family_style_character(fontmgr, familyName, style, bcp47, bcp47Count::Cint, character::Int32)

$(_doc_external(:sk_fontmgr_match_family_style_character))
"""
function sk_fontmgr_match_family_style_character(fontmgr, familyName, style, bcp47, bcp47Count::Cint, character::Int32)
    ccall((:sk_fontmgr_match_family_style_character, libskia), Ptr{sk_typeface_t}, (Ptr{sk_font_mgr_t}, Ptr{UInt8}, Ptr{sk_font_style_t}, Ptr{Ptr{UInt8}}, Cint, Int32), fontmgr, familyName, style, bcp47, bcp47Count, character)
end

"""
    sk_fontmgr_ref_default()

$(_doc_external(:sk_fontmgr_ref_default))
"""
function sk_fontmgr_ref_default()
    ccall((:sk_fontmgr_ref_default, libskia), Ptr{sk_font_mgr_t}, ())
end

"""
    sk_fontstyleset_create_typeface(fss, index::Cint)

$(_doc_external(:sk_fontstyleset_create_typeface))
"""
function sk_fontstyleset_create_typeface(fss, index::Cint)
    ccall((:sk_fontstyleset_create_typeface, libskia), Ptr{sk_typeface_t}, (Ptr{sk_font_style_set_t}, Cint), fss, index)
end

"""
    sk_fontstyleset_get_count(fss)

$(_doc_external(:sk_fontstyleset_get_count))
"""
function sk_fontstyleset_get_count(fss)
    ccall((:sk_fontstyleset_get_count, libskia), Cint, (Ptr{sk_font_style_set_t},), fss)
end

"""
    sk_fontstyleset_get_style(fss, index::Cint, fs, style)

$(_doc_external(:sk_fontstyleset_get_style))
"""
function sk_fontstyleset_get_style(fss, index::Cint, fs, style)
    ccall((:sk_fontstyleset_get_style, libskia), Cvoid, (Ptr{sk_font_style_set_t}, Cint, Ptr{sk_font_style_t}, Ptr{sk_string_t}), fss, index, fs, style)
end

"""
    sk_fontstyleset_match_style(fss, style)

$(_doc_external(:sk_fontstyleset_match_style))
"""
function sk_fontstyleset_match_style(fss, style)
    ccall((:sk_fontstyleset_match_style, libskia), Ptr{sk_typeface_t}, (Ptr{sk_font_style_set_t}, Ptr{sk_font_style_t}), fss, style)
end

"""
    sk_fontstyleset_unref(fss)

$(_doc_external(:sk_fontstyleset_unref))
"""
function sk_fontstyleset_unref(fss)
    ccall((:sk_fontstyleset_unref, libskia), Cvoid, (Ptr{sk_font_style_set_t},), fss)
end

"""
    sk_fontstyle_delete(fs)

$(_doc_external(:sk_fontstyle_delete))
"""
function sk_fontstyle_delete(fs)
    ccall((:sk_fontstyle_delete, libskia), Cvoid, (Ptr{sk_font_style_t},), fs)
end

"""
    sk_fontstyle_get_slant(fs)

$(_doc_external(:sk_fontstyle_get_slant))
"""
function sk_fontstyle_get_slant(fs)
    ccall((:sk_fontstyle_get_slant, libskia), sk_font_style_slant_t, (Ptr{sk_font_style_t},), fs)
end

"""
    sk_fontstyle_get_weight(fs)

$(_doc_external(:sk_fontstyle_get_weight))
"""
function sk_fontstyle_get_weight(fs)
    ccall((:sk_fontstyle_get_weight, libskia), Cint, (Ptr{sk_font_style_t},), fs)
end

"""
    sk_fontstyle_get_width(fs)

$(_doc_external(:sk_fontstyle_get_width))
"""
function sk_fontstyle_get_width(fs)
    ccall((:sk_fontstyle_get_width, libskia), Cint, (Ptr{sk_font_style_t},), fs)
end

"""
    sk_fontstyle_new(weight::Cint, width::Cint, slant::sk_font_style_slant_t)

$(_doc_external(:sk_fontstyle_new))
"""
function sk_fontstyle_new(weight::Cint, width::Cint, slant::sk_font_style_slant_t)
    ccall((:sk_fontstyle_new, libskia), Ptr{sk_font_style_t}, (Cint, Cint, sk_font_style_slant_t), weight, width, slant)
end

"""
    sk_image_get_alpha_type(image)

$(_doc_external(:sk_image_get_alpha_type))
"""
function sk_image_get_alpha_type(image)
    ccall((:sk_image_get_alpha_type, libskia), sk_alpha_type_t, (Ptr{sk_image_t},), image)
end

"""
    sk_image_get_color_type(image)

$(_doc_external(:sk_image_get_color_type))
"""
function sk_image_get_color_type(image)
    ccall((:sk_image_get_color_type, libskia), sk_color_type_t, (Ptr{sk_image_t},), image)
end

"""
    sk_image_get_colorspace(image)

$(_doc_external(:sk_image_get_colorspace))
"""
function sk_image_get_colorspace(image)
    ccall((:sk_image_get_colorspace, libskia), Ptr{sk_color_space_t}, (Ptr{sk_image_t},), image)
end

"""
    sk_image_get_height(image)

$(_doc_external(:sk_image_get_height))
"""
function sk_image_get_height(image)
    ccall((:sk_image_get_height, libskia), Cint, (Ptr{sk_image_t},), image)
end

"""
    sk_image_get_width(image)

$(_doc_external(:sk_image_get_width))
"""
function sk_image_get_width(image)
    ccall((:sk_image_get_width, libskia), Cint, (Ptr{sk_image_t},), image)
end

"""
    sk_image_make_non_texture_image(image)

$(_doc_external(:sk_image_make_non_texture_image))
"""
function sk_image_make_non_texture_image(image)
    ccall((:sk_image_make_non_texture_image, libskia), Ptr{sk_image_t}, (Ptr{sk_image_t},), image)
end

"""
    sk_image_make_shader(image, tileX::sk_tile_mode_t, tileY::sk_tile_mode_t, samplingOptions, cmatrix)

$(_doc_external(:sk_image_make_shader))
"""
function sk_image_make_shader(image, tileX::sk_tile_mode_t, tileY::sk_tile_mode_t, samplingOptions, cmatrix)
    ccall((:sk_image_make_shader, libskia), Ptr{sk_shader_t}, (Ptr{sk_image_t}, sk_tile_mode_t, sk_tile_mode_t, Ptr{sk_sampling_options_t}, Ptr{sk_matrix_t}), image, tileX, tileY, samplingOptions, cmatrix)
end

"""
    sk_image_new_from_encoded(encoded)

$(_doc_external(:sk_image_new_from_encoded))
"""
function sk_image_new_from_encoded(encoded)
    ccall((:sk_image_new_from_encoded, libskia), Ptr{sk_image_t}, (Ptr{sk_data_t},), encoded)
end

"""
    sk_image_new_raster_data(cinfo, pixels, rowBytes::Csize_t)

$(_doc_external(:sk_image_new_raster_data))
"""
function sk_image_new_raster_data(cinfo, pixels, rowBytes::Csize_t)
    ccall((:sk_image_new_raster_data, libskia), Ptr{sk_image_t}, (Ptr{sk_image_info_t}, Ptr{sk_data_t}, Csize_t), cinfo, pixels, rowBytes)
end

"""
    sk_image_read_pixels(image, dstInfo, dstPixels, dstRowBytes::Csize_t, srcX::Cint, srcY::Cint, cachingHint::sk_image_caching_hint_t)

$(_doc_external(:sk_image_read_pixels))
"""
function sk_image_read_pixels(image, dstInfo, dstPixels, dstRowBytes::Csize_t, srcX::Cint, srcY::Cint, cachingHint::sk_image_caching_hint_t)
    ccall((:sk_image_read_pixels, libskia), Bool, (Ptr{sk_image_t}, Ptr{sk_image_info_t}, Ptr{Cvoid}, Csize_t, Cint, Cint, sk_image_caching_hint_t), image, dstInfo, dstPixels, dstRowBytes, srcX, srcY, cachingHint)
end

"""
    sk_image_unref(image)

$(_doc_external(:sk_image_unref))
"""
function sk_image_unref(image)
    ccall((:sk_image_unref, libskia), Cvoid, (Ptr{sk_image_t},), image)
end

"""
    sk_image_texture_from_image(ctx, image, mipmapped::Bool, budgeted::Bool)

$(_doc_external(:sk_image_texture_from_image))
"""
function sk_image_texture_from_image(ctx, image, mipmapped::Bool, budgeted::Bool)
    ccall((:sk_image_texture_from_image, libskia), Ptr{sk_image_t}, (Ptr{gr_direct_context_t}, Ptr{sk_image_t}, Bool, Bool), ctx, image, mipmapped, budgeted)
end

"""
    sk_imagefilter_new_arithmetic(k1::Cfloat, k2::Cfloat, k3::Cfloat, k4::Cfloat, enforcePMColor::Bool, background, foreground, cropRect)

$(_doc_external(:sk_imagefilter_new_arithmetic))
"""
function sk_imagefilter_new_arithmetic(k1::Cfloat, k2::Cfloat, k3::Cfloat, k4::Cfloat, enforcePMColor::Bool, background, foreground, cropRect)
    ccall((:sk_imagefilter_new_arithmetic, libskia), Ptr{sk_image_filter_t}, (Cfloat, Cfloat, Cfloat, Cfloat, Bool, Ptr{sk_image_filter_t}, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), k1, k2, k3, k4, enforcePMColor, background, foreground, cropRect)
end

"""
    sk_imagefilter_new_blur(sigmaX::Cfloat, sigmaY::Cfloat, tileMode::sk_tile_mode_t, input, cropRect)

$(_doc_external(:sk_imagefilter_new_blur))
"""
function sk_imagefilter_new_blur(sigmaX::Cfloat, sigmaY::Cfloat, tileMode::sk_tile_mode_t, input, cropRect)
    ccall((:sk_imagefilter_new_blur, libskia), Ptr{sk_image_filter_t}, (Cfloat, Cfloat, sk_tile_mode_t, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), sigmaX, sigmaY, tileMode, input, cropRect)
end

"""
    sk_imagefilter_new_color_filter(cf, input, cropRect)

$(_doc_external(:sk_imagefilter_new_color_filter))
"""
function sk_imagefilter_new_color_filter(cf, input, cropRect)
    ccall((:sk_imagefilter_new_color_filter, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_color_filter_t}, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), cf, input, cropRect)
end

"""
    sk_imagefilter_new_compose(outer, inner)

$(_doc_external(:sk_imagefilter_new_compose))
"""
function sk_imagefilter_new_compose(outer, inner)
    ccall((:sk_imagefilter_new_compose, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_image_filter_t}, Ptr{sk_image_filter_t}), outer, inner)
end

"""
    sk_imagefilter_new_dilate(radiusX::Cint, radiusY::Cint, input, cropRect)

$(_doc_external(:sk_imagefilter_new_dilate))
"""
function sk_imagefilter_new_dilate(radiusX::Cint, radiusY::Cint, input, cropRect)
    ccall((:sk_imagefilter_new_dilate, libskia), Ptr{sk_image_filter_t}, (Cint, Cint, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), radiusX, radiusY, input, cropRect)
end

"""
    sk_imagefilter_new_displacement_map_effect(xChannelSelector::sk_color_channel_t, yChannelSelector::sk_color_channel_t, scale::Cfloat, displacement, color, cropRect)

$(_doc_external(:sk_imagefilter_new_displacement_map_effect))
"""
function sk_imagefilter_new_displacement_map_effect(xChannelSelector::sk_color_channel_t, yChannelSelector::sk_color_channel_t, scale::Cfloat, displacement, color, cropRect)
    ccall((:sk_imagefilter_new_displacement_map_effect, libskia), Ptr{sk_image_filter_t}, (sk_color_channel_t, sk_color_channel_t, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), xChannelSelector, yChannelSelector, scale, displacement, color, cropRect)
end

"""
    sk_imagefilter_new_distant_lit_diffuse(direction, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_distant_lit_diffuse))
"""
function sk_imagefilter_new_distant_lit_diffuse(direction, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_distant_lit_diffuse, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, sk_color_t, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), direction, lightColor, surfaceScale, kd, input, cropRect)
end

"""
    sk_imagefilter_new_distant_lit_specular(direction, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_distant_lit_specular))
"""
function sk_imagefilter_new_distant_lit_specular(direction, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_distant_lit_specular, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, sk_color_t, Cfloat, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), direction, lightColor, surfaceScale, ks, shininess, input, cropRect)
end

"""
    sk_imagefilter_new_drop_shadow(dx::Cfloat, dy::Cfloat, sigmaX::Cfloat, sigmaY::Cfloat, color::sk_color_t, input, cropRect)

$(_doc_external(:sk_imagefilter_new_drop_shadow))
"""
function sk_imagefilter_new_drop_shadow(dx::Cfloat, dy::Cfloat, sigmaX::Cfloat, sigmaY::Cfloat, color::sk_color_t, input, cropRect)
    ccall((:sk_imagefilter_new_drop_shadow, libskia), Ptr{sk_image_filter_t}, (Cfloat, Cfloat, Cfloat, Cfloat, sk_color_t, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), dx, dy, sigmaX, sigmaY, color, input, cropRect)
end

"""
    sk_imagefilter_new_drop_shadow_only(dx::Cfloat, dy::Cfloat, sigmaX::Cfloat, sigmaY::Cfloat, color::sk_color_t, input, cropRect)

$(_doc_external(:sk_imagefilter_new_drop_shadow_only))
"""
function sk_imagefilter_new_drop_shadow_only(dx::Cfloat, dy::Cfloat, sigmaX::Cfloat, sigmaY::Cfloat, color::sk_color_t, input, cropRect)
    ccall((:sk_imagefilter_new_drop_shadow_only, libskia), Ptr{sk_image_filter_t}, (Cfloat, Cfloat, Cfloat, Cfloat, sk_color_t, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), dx, dy, sigmaX, sigmaY, color, input, cropRect)
end

"""
    sk_imagefilter_new_erode(radiusX::Cint, radiusY::Cint, input, cropRect)

$(_doc_external(:sk_imagefilter_new_erode))
"""
function sk_imagefilter_new_erode(radiusX::Cint, radiusY::Cint, input, cropRect)
    ccall((:sk_imagefilter_new_erode, libskia), Ptr{sk_image_filter_t}, (Cint, Cint, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), radiusX, radiusY, input, cropRect)
end

"""
    sk_imagefilter_new_image_source(image, srcRect, dstRect, samplingOptions)

$(_doc_external(:sk_imagefilter_new_image_source))
"""
function sk_imagefilter_new_image_source(image, srcRect, dstRect, samplingOptions)
    ccall((:sk_imagefilter_new_image_source, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_image_t}, Ptr{sk_rect_t}, Ptr{sk_rect_t}, Ptr{sk_sampling_options_t}), image, srcRect, dstRect, samplingOptions)
end

"""
    sk_imagefilter_new_image_source_default(image, samplingOptions)

$(_doc_external(:sk_imagefilter_new_image_source_default))
"""
function sk_imagefilter_new_image_source_default(image, samplingOptions)
    ccall((:sk_imagefilter_new_image_source_default, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_image_t}, Ptr{sk_sampling_options_t}), image, samplingOptions)
end

"""
    sk_imagefilter_new_magnifier(lensBounds, zoomAmount::Cfloat, inset::Cfloat, samplingOptions, input, cropRect)

$(_doc_external(:sk_imagefilter_new_magnifier))
"""
function sk_imagefilter_new_magnifier(lensBounds, zoomAmount::Cfloat, inset::Cfloat, samplingOptions, input, cropRect)
    ccall((:sk_imagefilter_new_magnifier, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_rect_t}, Cfloat, Cfloat, Ptr{sk_sampling_options_t}, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), lensBounds, zoomAmount, inset, samplingOptions, input, cropRect)
end

"""
    sk_imagefilter_new_matrix_convolution(kernelSize, kernel, gain::Cfloat, bias::Cfloat, kernelOffset, tileMode::sk_tile_mode_t, convolveAlpha::Bool, input, cropRect)

$(_doc_external(:sk_imagefilter_new_matrix_convolution))
"""
function sk_imagefilter_new_matrix_convolution(kernelSize, kernel, gain::Cfloat, bias::Cfloat, kernelOffset, tileMode::sk_tile_mode_t, convolveAlpha::Bool, input, cropRect)
    ccall((:sk_imagefilter_new_matrix_convolution, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_isize_t}, Ptr{Cfloat}, Cfloat, Cfloat, Ptr{sk_ipoint_t}, sk_tile_mode_t, Bool, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), kernelSize, kernel, gain, bias, kernelOffset, tileMode, convolveAlpha, input, cropRect)
end

"""
    sk_imagefilter_new_matrix_transform(matrix, samplingOptions, input)

$(_doc_external(:sk_imagefilter_new_matrix_transform))
"""
function sk_imagefilter_new_matrix_transform(matrix, samplingOptions, input)
    ccall((:sk_imagefilter_new_matrix_transform, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_matrix_t}, Ptr{sk_sampling_options_t}, Ptr{sk_image_filter_t}), matrix, samplingOptions, input)
end

"""
    sk_imagefilter_new_merge(filters, count::Cint, cropRect)

$(_doc_external(:sk_imagefilter_new_merge))
"""
function sk_imagefilter_new_merge(filters, count::Cint, cropRect)
    ccall((:sk_imagefilter_new_merge, libskia), Ptr{sk_image_filter_t}, (Ptr{Ptr{sk_image_filter_t}}, Cint, Ptr{sk_rect_t}), filters, count, cropRect)
end

"""
    sk_imagefilter_new_offset(dx::Cfloat, dy::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_offset))
"""
function sk_imagefilter_new_offset(dx::Cfloat, dy::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_offset, libskia), Ptr{sk_image_filter_t}, (Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), dx, dy, input, cropRect)
end

"""
    sk_imagefilter_new_point_lit_diffuse(location, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_point_lit_diffuse))
"""
function sk_imagefilter_new_point_lit_diffuse(location, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_point_lit_diffuse, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, sk_color_t, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), location, lightColor, surfaceScale, kd, input, cropRect)
end

"""
    sk_imagefilter_new_point_lit_specular(location, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_point_lit_specular))
"""
function sk_imagefilter_new_point_lit_specular(location, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_point_lit_specular, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, sk_color_t, Cfloat, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), location, lightColor, surfaceScale, ks, shininess, input, cropRect)
end

"""
    sk_imagefilter_new_spot_lit_diffuse(location, target, specularExponent::Cfloat, cutoffAngle::Cfloat, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_spot_lit_diffuse))
"""
function sk_imagefilter_new_spot_lit_diffuse(location, target, specularExponent::Cfloat, cutoffAngle::Cfloat, lightColor::sk_color_t, surfaceScale::Cfloat, kd::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_spot_lit_diffuse, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, Ptr{sk_point3_t}, Cfloat, Cfloat, sk_color_t, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), location, target, specularExponent, cutoffAngle, lightColor, surfaceScale, kd, input, cropRect)
end

"""
    sk_imagefilter_new_spot_lit_specular(location, target, specularExponent::Cfloat, cutoffAngle::Cfloat, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)

$(_doc_external(:sk_imagefilter_new_spot_lit_specular))
"""
function sk_imagefilter_new_spot_lit_specular(location, target, specularExponent::Cfloat, cutoffAngle::Cfloat, lightColor::sk_color_t, surfaceScale::Cfloat, ks::Cfloat, shininess::Cfloat, input, cropRect)
    ccall((:sk_imagefilter_new_spot_lit_specular, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_point3_t}, Ptr{sk_point3_t}, Cfloat, Cfloat, sk_color_t, Cfloat, Cfloat, Cfloat, Ptr{sk_image_filter_t}, Ptr{sk_rect_t}), location, target, specularExponent, cutoffAngle, lightColor, surfaceScale, ks, shininess, input, cropRect)
end

"""
    sk_imagefilter_new_tile(src, dst, input)

$(_doc_external(:sk_imagefilter_new_tile))
"""
function sk_imagefilter_new_tile(src, dst, input)
    ccall((:sk_imagefilter_new_tile, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_rect_t}, Ptr{sk_rect_t}, Ptr{sk_image_filter_t}), src, dst, input)
end

"""
    sk_imagefilter_unref(filter)

$(_doc_external(:sk_imagefilter_unref))
"""
function sk_imagefilter_unref(filter)
    ccall((:sk_imagefilter_unref, libskia), Cvoid, (Ptr{sk_image_filter_t},), filter)
end

"""
    sk_maskfilter_new_blur_with_flags(arg1::sk_blur_style_t, sigma::Cfloat, respectCTM::Bool)

$(_doc_external(:sk_maskfilter_new_blur_with_flags))
"""
function sk_maskfilter_new_blur_with_flags(arg1::sk_blur_style_t, sigma::Cfloat, respectCTM::Bool)
    ccall((:sk_maskfilter_new_blur_with_flags, libskia), Ptr{sk_mask_filter_t}, (sk_blur_style_t, Cfloat, Bool), arg1, sigma, respectCTM)
end

"""
    sk_maskfilter_new_clip(min::UInt8, max::UInt8)

$(_doc_external(:sk_maskfilter_new_clip))
"""
function sk_maskfilter_new_clip(min::UInt8, max::UInt8)
    ccall((:sk_maskfilter_new_clip, libskia), Ptr{sk_mask_filter_t}, (UInt8, UInt8), min, max)
end

"""
    sk_maskfilter_new_gamma(gamma::Cfloat)

$(_doc_external(:sk_maskfilter_new_gamma))
"""
function sk_maskfilter_new_gamma(gamma::Cfloat)
    ccall((:sk_maskfilter_new_gamma, libskia), Ptr{sk_mask_filter_t}, (Cfloat,), gamma)
end

"""
    sk_maskfilter_new_shader(cshader)

$(_doc_external(:sk_maskfilter_new_shader))
"""
function sk_maskfilter_new_shader(cshader)
    ccall((:sk_maskfilter_new_shader, libskia), Ptr{sk_mask_filter_t}, (Ptr{sk_shader_t},), cshader)
end

"""
    sk_maskfilter_new_table(table)

$(_doc_external(:sk_maskfilter_new_table))
"""
function sk_maskfilter_new_table(table)
    ccall((:sk_maskfilter_new_table, libskia), Ptr{sk_mask_filter_t}, (Ptr{UInt8},), table)
end

"""
    sk_maskfilter_unref(filter)

$(_doc_external(:sk_maskfilter_unref))
"""
function sk_maskfilter_unref(filter)
    ccall((:sk_maskfilter_unref, libskia), Cvoid, (Ptr{sk_mask_filter_t},), filter)
end

"""
    sk_paint_equivalent(cpaint, other)

$(_doc_external(:sk_paint_equivalent))
"""
function sk_paint_equivalent(cpaint, other)
    ccall((:sk_paint_equivalent, libskia), Bool, (Ptr{sk_paint_t}, Ptr{sk_paint_t}), cpaint, other)
end

"""
    sk_paint_clone(cpaint)

$(_doc_external(:sk_paint_clone))
"""
function sk_paint_clone(cpaint)
    ccall((:sk_paint_clone, libskia), Ptr{sk_paint_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_delete(cpaint)

$(_doc_external(:sk_paint_delete))
"""
function sk_paint_delete(cpaint)
    ccall((:sk_paint_delete, libskia), Cvoid, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_blend_mode_or(cpaint, defaultMode::sk_blend_mode_t)

$(_doc_external(:sk_paint_get_blend_mode_or))
"""
function sk_paint_get_blend_mode_or(cpaint, defaultMode::sk_blend_mode_t)
    ccall((:sk_paint_get_blend_mode_or, libskia), sk_blend_mode_t, (Ptr{sk_paint_t}, sk_blend_mode_t), cpaint, defaultMode)
end

"""
    sk_paint_get_color(cpaint)

$(_doc_external(:sk_paint_get_color))
"""
function sk_paint_get_color(cpaint)
    ccall((:sk_paint_get_color, libskia), sk_color_t, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_colorfilter(cpaint)

$(_doc_external(:sk_paint_get_colorfilter))
"""
function sk_paint_get_colorfilter(cpaint)
    ccall((:sk_paint_get_colorfilter, libskia), Ptr{sk_color_filter_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_fill_path(cpaint, src, dst, cullRect, resScale::Cfloat)

$(_doc_external(:sk_paint_get_fill_path))
"""
function sk_paint_get_fill_path(cpaint, src, dst, cullRect, resScale::Cfloat)
    ccall((:sk_paint_get_fill_path, libskia), Bool, (Ptr{sk_paint_t}, Ptr{sk_path_t}, Ptr{sk_path_t}, Ptr{sk_rect_t}, Cfloat), cpaint, src, dst, cullRect, resScale)
end

"""
    sk_paint_get_imagefilter(cpaint)

$(_doc_external(:sk_paint_get_imagefilter))
"""
function sk_paint_get_imagefilter(cpaint)
    ccall((:sk_paint_get_imagefilter, libskia), Ptr{sk_image_filter_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_maskfilter(cpaint)

$(_doc_external(:sk_paint_get_maskfilter))
"""
function sk_paint_get_maskfilter(cpaint)
    ccall((:sk_paint_get_maskfilter, libskia), Ptr{sk_mask_filter_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_path_effect(cpaint)

$(_doc_external(:sk_paint_get_path_effect))
"""
function sk_paint_get_path_effect(cpaint)
    ccall((:sk_paint_get_path_effect, libskia), Ptr{sk_path_effect_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_shader(cpaint)

$(_doc_external(:sk_paint_get_shader))
"""
function sk_paint_get_shader(cpaint)
    ccall((:sk_paint_get_shader, libskia), Ptr{sk_shader_t}, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_stroke_cap(cpaint)

$(_doc_external(:sk_paint_get_stroke_cap))
"""
function sk_paint_get_stroke_cap(cpaint)
    ccall((:sk_paint_get_stroke_cap, libskia), sk_stroke_cap_t, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_stroke_join(cpaint)

$(_doc_external(:sk_paint_get_stroke_join))
"""
function sk_paint_get_stroke_join(cpaint)
    ccall((:sk_paint_get_stroke_join, libskia), sk_stroke_join_t, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_stroke_miter(cpaint)

$(_doc_external(:sk_paint_get_stroke_miter))
"""
function sk_paint_get_stroke_miter(cpaint)
    ccall((:sk_paint_get_stroke_miter, libskia), Cfloat, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_stroke_width(cpaint)

$(_doc_external(:sk_paint_get_stroke_width))
"""
function sk_paint_get_stroke_width(cpaint)
    ccall((:sk_paint_get_stroke_width, libskia), Cfloat, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_get_style(cpaint)

$(_doc_external(:sk_paint_get_style))
"""
function sk_paint_get_style(cpaint)
    ccall((:sk_paint_get_style, libskia), sk_paint_style_t, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_is_antialias(cpaint)

$(_doc_external(:sk_paint_is_antialias))
"""
function sk_paint_is_antialias(cpaint)
    ccall((:sk_paint_is_antialias, libskia), Bool, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_is_dither(cpaint)

$(_doc_external(:sk_paint_is_dither))
"""
function sk_paint_is_dither(cpaint)
    ccall((:sk_paint_is_dither, libskia), Bool, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_new()

$(_doc_external(:sk_paint_new))
"""
function sk_paint_new()
    ccall((:sk_paint_new, libskia), Ptr{sk_paint_t}, ())
end

"""
    sk_paint_reset(cpaint)

$(_doc_external(:sk_paint_reset))
"""
function sk_paint_reset(cpaint)
    ccall((:sk_paint_reset, libskia), Cvoid, (Ptr{sk_paint_t},), cpaint)
end

"""
    sk_paint_set_antialias(cpaint, aa::Bool)

$(_doc_external(:sk_paint_set_antialias))
"""
function sk_paint_set_antialias(cpaint, aa::Bool)
    ccall((:sk_paint_set_antialias, libskia), Cvoid, (Ptr{sk_paint_t}, Bool), cpaint, aa)
end

"""
    sk_paint_set_blend_mode(paint, mode::sk_blend_mode_t)

$(_doc_external(:sk_paint_set_blend_mode))
"""
function sk_paint_set_blend_mode(paint, mode::sk_blend_mode_t)
    ccall((:sk_paint_set_blend_mode, libskia), Cvoid, (Ptr{sk_paint_t}, sk_blend_mode_t), paint, mode)
end

"""
    sk_paint_set_color(cpaint, c::sk_color_t)

$(_doc_external(:sk_paint_set_color))
"""
function sk_paint_set_color(cpaint, c::sk_color_t)
    ccall((:sk_paint_set_color, libskia), Cvoid, (Ptr{sk_paint_t}, sk_color_t), cpaint, c)
end

"""
    sk_paint_set_colorfilter(cpaint, cfilter)

$(_doc_external(:sk_paint_set_colorfilter))
"""
function sk_paint_set_colorfilter(cpaint, cfilter)
    ccall((:sk_paint_set_colorfilter, libskia), Cvoid, (Ptr{sk_paint_t}, Ptr{sk_color_filter_t}), cpaint, cfilter)
end

"""
    sk_paint_set_dither(cpaint, isdither::Bool)

$(_doc_external(:sk_paint_set_dither))
"""
function sk_paint_set_dither(cpaint, isdither::Bool)
    ccall((:sk_paint_set_dither, libskia), Cvoid, (Ptr{sk_paint_t}, Bool), cpaint, isdither)
end

"""
    sk_paint_set_imagefilter(cpaint, cfilter)

$(_doc_external(:sk_paint_set_imagefilter))
"""
function sk_paint_set_imagefilter(cpaint, cfilter)
    ccall((:sk_paint_set_imagefilter, libskia), Cvoid, (Ptr{sk_paint_t}, Ptr{sk_image_filter_t}), cpaint, cfilter)
end

"""
    sk_paint_set_maskfilter(cpaint, cfilter)

$(_doc_external(:sk_paint_set_maskfilter))
"""
function sk_paint_set_maskfilter(cpaint, cfilter)
    ccall((:sk_paint_set_maskfilter, libskia), Cvoid, (Ptr{sk_paint_t}, Ptr{sk_mask_filter_t}), cpaint, cfilter)
end

"""
    sk_paint_set_path_effect(cpaint, effect)

$(_doc_external(:sk_paint_set_path_effect))
"""
function sk_paint_set_path_effect(cpaint, effect)
    ccall((:sk_paint_set_path_effect, libskia), Cvoid, (Ptr{sk_paint_t}, Ptr{sk_path_effect_t}), cpaint, effect)
end

"""
    sk_paint_set_shader(cpaint, cshader)

$(_doc_external(:sk_paint_set_shader))
"""
function sk_paint_set_shader(cpaint, cshader)
    ccall((:sk_paint_set_shader, libskia), Cvoid, (Ptr{sk_paint_t}, Ptr{sk_shader_t}), cpaint, cshader)
end

"""
    sk_paint_set_stroke_cap(cpaint, ccap::sk_stroke_cap_t)

$(_doc_external(:sk_paint_set_stroke_cap))
"""
function sk_paint_set_stroke_cap(cpaint, ccap::sk_stroke_cap_t)
    ccall((:sk_paint_set_stroke_cap, libskia), Cvoid, (Ptr{sk_paint_t}, sk_stroke_cap_t), cpaint, ccap)
end

"""
    sk_paint_set_stroke_join(cpaint, cjoin::sk_stroke_join_t)

$(_doc_external(:sk_paint_set_stroke_join))
"""
function sk_paint_set_stroke_join(cpaint, cjoin::sk_stroke_join_t)
    ccall((:sk_paint_set_stroke_join, libskia), Cvoid, (Ptr{sk_paint_t}, sk_stroke_join_t), cpaint, cjoin)
end

"""
    sk_paint_set_stroke_miter(cpaint, miter::Cfloat)

$(_doc_external(:sk_paint_set_stroke_miter))
"""
function sk_paint_set_stroke_miter(cpaint, miter::Cfloat)
    ccall((:sk_paint_set_stroke_miter, libskia), Cvoid, (Ptr{sk_paint_t}, Cfloat), cpaint, miter)
end

"""
    sk_paint_set_stroke_width(cpaint, width::Cfloat)

$(_doc_external(:sk_paint_set_stroke_width))
"""
function sk_paint_set_stroke_width(cpaint, width::Cfloat)
    ccall((:sk_paint_set_stroke_width, libskia), Cvoid, (Ptr{sk_paint_t}, Cfloat), cpaint, width)
end

"""
    sk_paint_set_style(cpaint, style::sk_paint_style_t)

$(_doc_external(:sk_paint_set_style))
"""
function sk_paint_set_style(cpaint, style::sk_paint_style_t)
    ccall((:sk_paint_set_style, libskia), Cvoid, (Ptr{sk_paint_t}, sk_paint_style_t), cpaint, style)
end

"""
    sk_path_add_circle(cpath, x::Cfloat, y::Cfloat, radius::Cfloat, dir::sk_path_direction_t)

$(_doc_external(:sk_path_add_circle))
"""
function sk_path_add_circle(cpath, x::Cfloat, y::Cfloat, radius::Cfloat, dir::sk_path_direction_t)
    ccall((:sk_path_add_circle, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, sk_path_direction_t), cpath, x, y, radius, dir)
end

"""
    sk_path_add_oval(cpath, crect, cdir::sk_path_direction_t)

$(_doc_external(:sk_path_add_oval))
"""
function sk_path_add_oval(cpath, crect, cdir::sk_path_direction_t)
    ccall((:sk_path_add_oval, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}, sk_path_direction_t), cpath, crect, cdir)
end

"""
    sk_path_add_path(cpath, other, add_mode::sk_path_add_mode_t)

$(_doc_external(:sk_path_add_path))
"""
function sk_path_add_path(cpath, other, add_mode::sk_path_add_mode_t)
    ccall((:sk_path_add_path, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_path_t}, sk_path_add_mode_t), cpath, other, add_mode)
end

"""
    sk_path_add_path_matrix(cpath, other, matrix, add_mode::sk_path_add_mode_t)

$(_doc_external(:sk_path_add_path_matrix))
"""
function sk_path_add_path_matrix(cpath, other, matrix, add_mode::sk_path_add_mode_t)
    ccall((:sk_path_add_path_matrix, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_path_t}, Ptr{sk_matrix_t}, sk_path_add_mode_t), cpath, other, matrix, add_mode)
end

"""
    sk_path_add_path_offset(cpath, other, dx::Cfloat, dy::Cfloat, add_mode::sk_path_add_mode_t)

$(_doc_external(:sk_path_add_path_offset))
"""
function sk_path_add_path_offset(cpath, other, dx::Cfloat, dy::Cfloat, add_mode::sk_path_add_mode_t)
    ccall((:sk_path_add_path_offset, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_path_t}, Cfloat, Cfloat, sk_path_add_mode_t), cpath, other, dx, dy, add_mode)
end

"""
    sk_path_add_path_reverse(cpath, other)

$(_doc_external(:sk_path_add_path_reverse))
"""
function sk_path_add_path_reverse(cpath, other)
    ccall((:sk_path_add_path_reverse, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_path_t}), cpath, other)
end

"""
    sk_path_add_poly(cpath, points, count::Cint, close::Bool)

$(_doc_external(:sk_path_add_poly))
"""
function sk_path_add_poly(cpath, points, count::Cint, close::Bool)
    ccall((:sk_path_add_poly, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_point_t}, Cint, Bool), cpath, points, count, close)
end

"""
    sk_path_add_rect(cpath, crect, cdir::sk_path_direction_t)

$(_doc_external(:sk_path_add_rect))
"""
function sk_path_add_rect(cpath, crect, cdir::sk_path_direction_t)
    ccall((:sk_path_add_rect, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}, sk_path_direction_t), cpath, crect, cdir)
end

"""
    sk_path_add_rounded_rect(cpath, crect, rx::Cfloat, ry::Cfloat, cdir::sk_path_direction_t)

$(_doc_external(:sk_path_add_rounded_rect))
"""
function sk_path_add_rounded_rect(cpath, crect, rx::Cfloat, ry::Cfloat, cdir::sk_path_direction_t)
    ccall((:sk_path_add_rounded_rect, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}, Cfloat, Cfloat, sk_path_direction_t), cpath, crect, rx, ry, cdir)
end

"""
    sk_path_arc_to(cpath, rx::Cfloat, ry::Cfloat, xAxisRotate::Cfloat, largeArc::sk_path_arc_size_t, sweep::sk_path_direction_t, x::Cfloat, y::Cfloat)

$(_doc_external(:sk_path_arc_to))
"""
function sk_path_arc_to(cpath, rx::Cfloat, ry::Cfloat, xAxisRotate::Cfloat, largeArc::sk_path_arc_size_t, sweep::sk_path_direction_t, x::Cfloat, y::Cfloat)
    ccall((:sk_path_arc_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, sk_path_arc_size_t, sk_path_direction_t, Cfloat, Cfloat), cpath, rx, ry, xAxisRotate, largeArc, sweep, x, y)
end

"""
    sk_path_arc_to_with_oval(cpath, oval, startAngle::Cfloat, sweepAngle::Cfloat, forceMoveTo::Bool)

$(_doc_external(:sk_path_arc_to_with_oval))
"""
function sk_path_arc_to_with_oval(cpath, oval, startAngle::Cfloat, sweepAngle::Cfloat, forceMoveTo::Bool)
    ccall((:sk_path_arc_to_with_oval, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}, Cfloat, Cfloat, Bool), cpath, oval, startAngle, sweepAngle, forceMoveTo)
end

"""
    sk_path_arc_to_with_points(cpath, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, radius::Cfloat)

$(_doc_external(:sk_path_arc_to_with_points))
"""
function sk_path_arc_to_with_points(cpath, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat, radius::Cfloat)
    ccall((:sk_path_arc_to_with_points, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), cpath, x1, y1, x2, y2, radius)
end

"""
    sk_path_clone(cpath)

$(_doc_external(:sk_path_clone))
"""
function sk_path_clone(cpath)
    ccall((:sk_path_clone, libskia), Ptr{sk_path_t}, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_close(cpath)

$(_doc_external(:sk_path_close))
"""
function sk_path_close(cpath)
    ccall((:sk_path_close, libskia), Cvoid, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_compute_tight_bounds(cpath, crect)

$(_doc_external(:sk_path_compute_tight_bounds))
"""
function sk_path_compute_tight_bounds(cpath, crect)
    ccall((:sk_path_compute_tight_bounds, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}), cpath, crect)
end

"""
    sk_path_conic_to(cpath, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, w::Cfloat)

$(_doc_external(:sk_path_conic_to))
"""
function sk_path_conic_to(cpath, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, w::Cfloat)
    ccall((:sk_path_conic_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), cpath, x0, y0, x1, y1, w)
end

"""
    sk_path_contains(cpath, x::Cfloat, y::Cfloat)

$(_doc_external(:sk_path_contains))
"""
function sk_path_contains(cpath, x::Cfloat, y::Cfloat)
    ccall((:sk_path_contains, libskia), Bool, (Ptr{sk_path_t}, Cfloat, Cfloat), cpath, x, y)
end

"""
    sk_path_count_points(cpath)

$(_doc_external(:sk_path_count_points))
"""
function sk_path_count_points(cpath)
    ccall((:sk_path_count_points, libskia), Cint, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_cubic_to(arg1, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat)

$(_doc_external(:sk_path_cubic_to))
"""
function sk_path_cubic_to(arg1, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat, x2::Cfloat, y2::Cfloat)
    ccall((:sk_path_cubic_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), arg1, x0, y0, x1, y1, x2, y2)
end

"""
    sk_path_delete(cpath)

$(_doc_external(:sk_path_delete))
"""
function sk_path_delete(cpath)
    ccall((:sk_path_delete, libskia), Cvoid, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_get_bounds(cpath, crect)

$(_doc_external(:sk_path_get_bounds))
"""
function sk_path_get_bounds(cpath, crect)
    ccall((:sk_path_get_bounds, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_rect_t}), cpath, crect)
end

"""
    sk_path_get_points(cpath, points, max::Cint)

$(_doc_external(:sk_path_get_points))
"""
function sk_path_get_points(cpath, points, max::Cint)
    ccall((:sk_path_get_points, libskia), Cint, (Ptr{sk_path_t}, Ptr{sk_point_t}, Cint), cpath, points, max)
end

"""
    sk_path_get_filltype(cpath)

$(_doc_external(:sk_path_get_filltype))
"""
function sk_path_get_filltype(cpath)
    ccall((:sk_path_get_filltype, libskia), sk_path_fill_type_t, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_get_last_point(cpath, point)

$(_doc_external(:sk_path_get_last_point))
"""
function sk_path_get_last_point(cpath, point)
    ccall((:sk_path_get_last_point, libskia), Bool, (Ptr{sk_path_t}, Ptr{sk_point_t}), cpath, point)
end

"""
    sk_path_line_to(cpath, x::Cfloat, y::Cfloat)

$(_doc_external(:sk_path_line_to))
"""
function sk_path_line_to(cpath, x::Cfloat, y::Cfloat)
    ccall((:sk_path_line_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat), cpath, x, y)
end

"""
    sk_path_move_to(cpath, x::Cfloat, y::Cfloat)

$(_doc_external(:sk_path_move_to))
"""
function sk_path_move_to(cpath, x::Cfloat, y::Cfloat)
    ccall((:sk_path_move_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat), cpath, x, y)
end

"""
    sk_path_new()

$(_doc_external(:sk_path_new))
"""
function sk_path_new()
    ccall((:sk_path_new, libskia), Ptr{sk_path_t}, ())
end

"""
    sk_path_parse_svg_string(cpath, str)

$(_doc_external(:sk_path_parse_svg_string))
"""
function sk_path_parse_svg_string(cpath, str)
    ccall((:sk_path_parse_svg_string, libskia), Bool, (Ptr{sk_path_t}, Ptr{UInt8}), cpath, str)
end

"""
    sk_path_quad_to(cpath, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat)

$(_doc_external(:sk_path_quad_to))
"""
function sk_path_quad_to(cpath, x0::Cfloat, y0::Cfloat, x1::Cfloat, y1::Cfloat)
    ccall((:sk_path_quad_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat), cpath, x0, y0, x1, y1)
end

"""
    sk_path_rarc_to(cpath, rx::Cfloat, ry::Cfloat, xAxisRotate::Cfloat, largeArc::sk_path_arc_size_t, sweep::sk_path_direction_t, x::Cfloat, y::Cfloat)

$(_doc_external(:sk_path_rarc_to))
"""
function sk_path_rarc_to(cpath, rx::Cfloat, ry::Cfloat, xAxisRotate::Cfloat, largeArc::sk_path_arc_size_t, sweep::sk_path_direction_t, x::Cfloat, y::Cfloat)
    ccall((:sk_path_rarc_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, sk_path_arc_size_t, sk_path_direction_t, Cfloat, Cfloat), cpath, rx, ry, xAxisRotate, largeArc, sweep, x, y)
end

"""
    sk_path_rconic_to(cpath, dx0::Cfloat, dy0::Cfloat, dx1::Cfloat, dy1::Cfloat, w::Cfloat)

$(_doc_external(:sk_path_rconic_to))
"""
function sk_path_rconic_to(cpath, dx0::Cfloat, dy0::Cfloat, dx1::Cfloat, dy1::Cfloat, w::Cfloat)
    ccall((:sk_path_rconic_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), cpath, dx0, dy0, dx1, dy1, w)
end

"""
    sk_path_rcubic_to(cpath, dx0::Cfloat, dy0::Cfloat, dx1::Cfloat, dy1::Cfloat, dx2::Cfloat, dy2::Cfloat)

$(_doc_external(:sk_path_rcubic_to))
"""
function sk_path_rcubic_to(cpath, dx0::Cfloat, dy0::Cfloat, dx1::Cfloat, dy1::Cfloat, dx2::Cfloat, dy2::Cfloat)
    ccall((:sk_path_rcubic_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), cpath, dx0, dy0, dx1, dy1, dx2, dy2)
end

"""
    sk_path_reset(cpath)

$(_doc_external(:sk_path_reset))
"""
function sk_path_reset(cpath)
    ccall((:sk_path_reset, libskia), Cvoid, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_rewind(cpath)

$(_doc_external(:sk_path_rewind))
"""
function sk_path_rewind(cpath)
    ccall((:sk_path_rewind, libskia), Cvoid, (Ptr{sk_path_t},), cpath)
end

"""
    sk_path_rline_to(cpath, dx::Cfloat, yd::Cfloat)

$(_doc_external(:sk_path_rline_to))
"""
function sk_path_rline_to(cpath, dx::Cfloat, yd::Cfloat)
    ccall((:sk_path_rline_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat), cpath, dx, yd)
end

"""
    sk_path_rmove_to(cpath, dx::Cfloat, dy::Cfloat)

$(_doc_external(:sk_path_rmove_to))
"""
function sk_path_rmove_to(cpath, dx::Cfloat, dy::Cfloat)
    ccall((:sk_path_rmove_to, libskia), Cvoid, (Ptr{sk_path_t}, Cfloat, Cfloat), cpath, dx, dy)
end

"""
    sk_path_set_filltype(cpath, cfilltype::sk_path_fill_type_t)

$(_doc_external(:sk_path_set_filltype))
"""
function sk_path_set_filltype(cpath, cfilltype::sk_path_fill_type_t)
    ccall((:sk_path_set_filltype, libskia), Cvoid, (Ptr{sk_path_t}, sk_path_fill_type_t), cpath, cfilltype)
end

"""
    sk_path_to_svg_string(cpath, absolute::Bool)

$(_doc_external(:sk_path_to_svg_string))
"""
function sk_path_to_svg_string(cpath, absolute::Bool)
    ccall((:sk_path_to_svg_string, libskia), Ptr{sk_string_t}, (Ptr{sk_path_t}, Bool), cpath, absolute)
end

"""
    sk_path_transform(cpath, cmatrix)

$(_doc_external(:sk_path_transform))
"""
function sk_path_transform(cpath, cmatrix)
    ccall((:sk_path_transform, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_matrix_t}), cpath, cmatrix)
end

"""
    sk_path_transform_to_dest(cpath, cmatrix, destination)

$(_doc_external(:sk_path_transform_to_dest))
"""
function sk_path_transform_to_dest(cpath, cmatrix, destination)
    ccall((:sk_path_transform_to_dest, libskia), Cvoid, (Ptr{sk_path_t}, Ptr{sk_matrix_t}, Ptr{sk_path_t}), cpath, cmatrix, destination)
end

"""
    sk_path_effect_create_1d_path(path, advance::Cfloat, phase::Cfloat, style::sk_path_effect_1d_style_t)

$(_doc_external(:sk_path_effect_create_1d_path))
"""
function sk_path_effect_create_1d_path(path, advance::Cfloat, phase::Cfloat, style::sk_path_effect_1d_style_t)
    ccall((:sk_path_effect_create_1d_path, libskia), Ptr{sk_path_effect_t}, (Ptr{sk_path_t}, Cfloat, Cfloat, sk_path_effect_1d_style_t), path, advance, phase, style)
end

"""
    sk_path_effect_create_2d_line(width::Cfloat, matrix)

$(_doc_external(:sk_path_effect_create_2d_line))
"""
function sk_path_effect_create_2d_line(width::Cfloat, matrix)
    ccall((:sk_path_effect_create_2d_line, libskia), Ptr{sk_path_effect_t}, (Cfloat, Ptr{sk_matrix_t}), width, matrix)
end

"""
    sk_path_effect_create_2d_path(matrix, path)

$(_doc_external(:sk_path_effect_create_2d_path))
"""
function sk_path_effect_create_2d_path(matrix, path)
    ccall((:sk_path_effect_create_2d_path, libskia), Ptr{sk_path_effect_t}, (Ptr{sk_matrix_t}, Ptr{sk_path_t}), matrix, path)
end

"""
    sk_path_effect_create_compose(outer, inner)

$(_doc_external(:sk_path_effect_create_compose))
"""
function sk_path_effect_create_compose(outer, inner)
    ccall((:sk_path_effect_create_compose, libskia), Ptr{sk_path_effect_t}, (Ptr{sk_path_effect_t}, Ptr{sk_path_effect_t}), outer, inner)
end

"""
    sk_path_effect_create_corner(radius::Cfloat)

$(_doc_external(:sk_path_effect_create_corner))
"""
function sk_path_effect_create_corner(radius::Cfloat)
    ccall((:sk_path_effect_create_corner, libskia), Ptr{sk_path_effect_t}, (Cfloat,), radius)
end

"""
    sk_path_effect_create_dash(intervals, count::Cint, phase::Cfloat)

$(_doc_external(:sk_path_effect_create_dash))
"""
function sk_path_effect_create_dash(intervals, count::Cint, phase::Cfloat)
    ccall((:sk_path_effect_create_dash, libskia), Ptr{sk_path_effect_t}, (Ptr{Cfloat}, Cint, Cfloat), intervals, count, phase)
end

"""
    sk_path_effect_create_discrete(segLength::Cfloat, deviation::Cfloat, seedAssist::UInt32)

$(_doc_external(:sk_path_effect_create_discrete))
"""
function sk_path_effect_create_discrete(segLength::Cfloat, deviation::Cfloat, seedAssist::UInt32)
    ccall((:sk_path_effect_create_discrete, libskia), Ptr{sk_path_effect_t}, (Cfloat, Cfloat, UInt32), segLength, deviation, seedAssist)
end

"""
    sk_path_effect_create_sum(first, second)

$(_doc_external(:sk_path_effect_create_sum))
"""
function sk_path_effect_create_sum(first, second)
    ccall((:sk_path_effect_create_sum, libskia), Ptr{sk_path_effect_t}, (Ptr{sk_path_effect_t}, Ptr{sk_path_effect_t}), first, second)
end

"""
    sk_path_effect_create_trim(start::Cfloat, stop::Cfloat, mode::sk_path_effect_trim_mode_t)

$(_doc_external(:sk_path_effect_create_trim))
"""
function sk_path_effect_create_trim(start::Cfloat, stop::Cfloat, mode::sk_path_effect_trim_mode_t)
    ccall((:sk_path_effect_create_trim, libskia), Ptr{sk_path_effect_t}, (Cfloat, Cfloat, sk_path_effect_trim_mode_t), start, stop, mode)
end

"""
    sk_path_effect_unref(effect)

$(_doc_external(:sk_path_effect_unref))
"""
function sk_path_effect_unref(effect)
    ccall((:sk_path_effect_unref, libskia), Cvoid, (Ptr{sk_path_effect_t},), effect)
end

"""
    sk_path_op(path, other, op::sk_path_op_t, result)

$(_doc_external(:sk_path_op))
"""
function sk_path_op(path, other, op::sk_path_op_t, result)
    ccall((:sk_path_op, libskia), Bool, (Ptr{sk_path_t}, Ptr{sk_path_t}, sk_path_op_t, Ptr{sk_path_t}), path, other, op, result)
end

"""
    sk_path_simplify(path, result)

$(_doc_external(:sk_path_simplify))
"""
function sk_path_simplify(path, result)
    ccall((:sk_path_simplify, libskia), Bool, (Ptr{sk_path_t}, Ptr{sk_path_t}), path, result)
end

"""
    sk_opbuilder_add(builder, path, op::sk_path_op_t)

$(_doc_external(:sk_opbuilder_add))
"""
function sk_opbuilder_add(builder, path, op::sk_path_op_t)
    ccall((:sk_opbuilder_add, libskia), Cvoid, (Ptr{sk_op_builder_t}, Ptr{sk_path_t}, sk_path_op_t), builder, path, op)
end

"""
    sk_opbuilder_destroy(builder)

$(_doc_external(:sk_opbuilder_destroy))
"""
function sk_opbuilder_destroy(builder)
    ccall((:sk_opbuilder_destroy, libskia), Cvoid, (Ptr{sk_op_builder_t},), builder)
end

"""
    sk_opbuilder_new()

$(_doc_external(:sk_opbuilder_new))
"""
function sk_opbuilder_new()
    ccall((:sk_opbuilder_new, libskia), Ptr{sk_op_builder_t}, ())
end

"""
    sk_opbuilder_resolve(builder, result)

$(_doc_external(:sk_opbuilder_resolve))
"""
function sk_opbuilder_resolve(builder, result)
    ccall((:sk_opbuilder_resolve, libskia), Bool, (Ptr{sk_op_builder_t}, Ptr{sk_path_t}), builder, result)
end

"""
    sk_shader_new_blend(mode::sk_blend_mode_t, dst, src)

$(_doc_external(:sk_shader_new_blend))
"""
function sk_shader_new_blend(mode::sk_blend_mode_t, dst, src)
    ccall((:sk_shader_new_blend, libskia), Ptr{sk_shader_t}, (sk_blend_mode_t, Ptr{sk_shader_t}, Ptr{sk_shader_t}), mode, dst, src)
end

"""
    sk_shader_new_color(color::sk_color_t)

$(_doc_external(:sk_shader_new_color))
"""
function sk_shader_new_color(color::sk_color_t)
    ccall((:sk_shader_new_color, libskia), Ptr{sk_shader_t}, (sk_color_t,), color)
end

"""
    sk_shader_new_linear_gradient(points, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)

$(_doc_external(:sk_shader_new_linear_gradient))
"""
function sk_shader_new_linear_gradient(points, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)
    ccall((:sk_shader_new_linear_gradient, libskia), Ptr{sk_shader_t}, (Ptr{sk_point_t}, Ptr{sk_color_t}, Ptr{Cfloat}, Cint, sk_tile_mode_t, Ptr{sk_matrix_t}), points, colors, colorPos, colorCount, tileMode, localMatrix)
end

"""
    sk_shader_new_perlin_noise_fractal_noise(baseFrequencyX::Cfloat, baseFrequencyY::Cfloat, numOctaves::Cint, seed::Cfloat, tileSize)

$(_doc_external(:sk_shader_new_perlin_noise_fractal_noise))
"""
function sk_shader_new_perlin_noise_fractal_noise(baseFrequencyX::Cfloat, baseFrequencyY::Cfloat, numOctaves::Cint, seed::Cfloat, tileSize)
    ccall((:sk_shader_new_perlin_noise_fractal_noise, libskia), Ptr{sk_shader_t}, (Cfloat, Cfloat, Cint, Cfloat, Ptr{sk_isize_t}), baseFrequencyX, baseFrequencyY, numOctaves, seed, tileSize)
end

"""
    sk_shader_new_perlin_noise_turbulence(baseFrequencyX::Cfloat, baseFrequencyY::Cfloat, numOctaves::Cint, seed::Cfloat, tileSize)

$(_doc_external(:sk_shader_new_perlin_noise_turbulence))
"""
function sk_shader_new_perlin_noise_turbulence(baseFrequencyX::Cfloat, baseFrequencyY::Cfloat, numOctaves::Cint, seed::Cfloat, tileSize)
    ccall((:sk_shader_new_perlin_noise_turbulence, libskia), Ptr{sk_shader_t}, (Cfloat, Cfloat, Cint, Cfloat, Ptr{sk_isize_t}), baseFrequencyX, baseFrequencyY, numOctaves, seed, tileSize)
end

"""
    sk_shader_new_radial_gradient(center, radius::Cfloat, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)

$(_doc_external(:sk_shader_new_radial_gradient))
"""
function sk_shader_new_radial_gradient(center, radius::Cfloat, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)
    ccall((:sk_shader_new_radial_gradient, libskia), Ptr{sk_shader_t}, (Ptr{sk_point_t}, Cfloat, Ptr{sk_color_t}, Ptr{Cfloat}, Cint, sk_tile_mode_t, Ptr{sk_matrix_t}), center, radius, colors, colorPos, colorCount, tileMode, localMatrix)
end

"""
    sk_shader_new_sweep_gradient(center, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, startAngle::Cfloat, endAngle::Cfloat, localMatrix)

$(_doc_external(:sk_shader_new_sweep_gradient))
"""
function sk_shader_new_sweep_gradient(center, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, startAngle::Cfloat, endAngle::Cfloat, localMatrix)
    ccall((:sk_shader_new_sweep_gradient, libskia), Ptr{sk_shader_t}, (Ptr{sk_point_t}, Ptr{sk_color_t}, Ptr{Cfloat}, Cint, sk_tile_mode_t, Cfloat, Cfloat, Ptr{sk_matrix_t}), center, colors, colorPos, colorCount, tileMode, startAngle, endAngle, localMatrix)
end

"""
    sk_shader_new_two_point_conical_gradient(start, startRadius::Cfloat, _end, endRadius::Cfloat, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)

$(_doc_external(:sk_shader_new_two_point_conical_gradient))
"""
function sk_shader_new_two_point_conical_gradient(start, startRadius::Cfloat, _end, endRadius::Cfloat, colors, colorPos, colorCount::Cint, tileMode::sk_tile_mode_t, localMatrix)
    ccall((:sk_shader_new_two_point_conical_gradient, libskia), Ptr{sk_shader_t}, (Ptr{sk_point_t}, Cfloat, Ptr{sk_point_t}, Cfloat, Ptr{sk_color_t}, Ptr{Cfloat}, Cint, sk_tile_mode_t, Ptr{sk_matrix_t}), start, startRadius, _end, endRadius, colors, colorPos, colorCount, tileMode, localMatrix)
end

"""
    sk_shader_unref(shader)

$(_doc_external(:sk_shader_unref))
"""
function sk_shader_unref(shader)
    ccall((:sk_shader_unref, libskia), Cvoid, (Ptr{sk_shader_t},), shader)
end

"""
    sk_shader_with_color_filter(shader, filter)

$(_doc_external(:sk_shader_with_color_filter))
"""
function sk_shader_with_color_filter(shader, filter)
    ccall((:sk_shader_with_color_filter, libskia), Ptr{sk_shader_t}, (Ptr{sk_shader_t}, Ptr{sk_color_filter_t}), shader, filter)
end

"""
    sk_shader_with_local_matrix(shader, localMatrix)

$(_doc_external(:sk_shader_with_local_matrix))
"""
function sk_shader_with_local_matrix(shader, localMatrix)
    ccall((:sk_shader_with_local_matrix, libskia), Ptr{sk_shader_t}, (Ptr{sk_shader_t}, Ptr{sk_matrix_t}), shader, localMatrix)
end

"""
    sk_string_new(text, len::Csize_t)

$(_doc_external(:sk_string_new))
"""
function sk_string_new(text, len::Csize_t)
    ccall((:sk_string_new, libskia), Ptr{sk_string_t}, (Ptr{UInt8}, Csize_t), text, len)
end

"""
    sk_string_new_empty()

$(_doc_external(:sk_string_new_empty))
"""
function sk_string_new_empty()
    ccall((:sk_string_new_empty, libskia), Ptr{sk_string_t}, ())
end

"""
    sk_string_delete(str)

$(_doc_external(:sk_string_delete))
"""
function sk_string_delete(str)
    ccall((:sk_string_delete, libskia), Cvoid, (Ptr{sk_string_t},), str)
end

"""
    sk_string_get_c_str(str)

$(_doc_external(:sk_string_get_c_str))
"""
function sk_string_get_c_str(str)
    ccall((:sk_string_get_c_str, libskia), Ptr{UInt8}, (Ptr{sk_string_t},), str)
end

"""
    sk_string_get_size(str)

$(_doc_external(:sk_string_get_size))
"""
function sk_string_get_size(str)
    ccall((:sk_string_get_size, libskia), Csize_t, (Ptr{sk_string_t},), str)
end

"""
    sk_surface_make_raster_direct(imageInfo, pixels, rowBytes::Csize_t, surfaceProps)

$(_doc_external(:sk_surface_make_raster_direct))
"""
function sk_surface_make_raster_direct(imageInfo, pixels, rowBytes::Csize_t, surfaceProps)
    ccall((:sk_surface_make_raster_direct, libskia), Ptr{sk_surface_t}, (Ptr{sk_image_info_t}, Ptr{Cvoid}, Csize_t, Ptr{sk_surface_props_t}), imageInfo, pixels, rowBytes, surfaceProps)
end

"""
    sk_surface_make_raster_n32_premul(imageInfo, surfaceProps)

$(_doc_external(:sk_surface_make_raster_n32_premul))
"""
function sk_surface_make_raster_n32_premul(imageInfo, surfaceProps)
    ccall((:sk_surface_make_raster_n32_premul, libskia), Ptr{sk_surface_t}, (Ptr{sk_image_info_t}, Ptr{sk_surface_props_t}), imageInfo, surfaceProps)
end

"""
    sk_surface_make_surface(surface, width::Cint, height::Cint)

$(_doc_external(:sk_surface_make_surface))
"""
function sk_surface_make_surface(surface, width::Cint, height::Cint)
    ccall((:sk_surface_make_surface, libskia), Ptr{sk_surface_t}, (Ptr{sk_surface_t}, Cint, Cint), surface, width, height)
end

"""
    sk_surface_make_image_snapshot(surface)

$(_doc_external(:sk_surface_make_image_snapshot))
"""
function sk_surface_make_image_snapshot(surface)
    ccall((:sk_surface_make_image_snapshot, libskia), Ptr{sk_image_t}, (Ptr{sk_surface_t},), surface)
end

"""
    sk_surface_get_canvas(surface)

$(_doc_external(:sk_surface_get_canvas))
"""
function sk_surface_get_canvas(surface)
    ccall((:sk_surface_get_canvas, libskia), Ptr{sk_canvas_t}, (Ptr{sk_surface_t},), surface)
end

"""
    sk_surface_new_backend_render_target(context, target, origin::gr_surface_origin_t, colorType::sk_color_type_t, colorspace, props)

$(_doc_external(:sk_surface_new_backend_render_target))
"""
function sk_surface_new_backend_render_target(context, target, origin::gr_surface_origin_t, colorType::sk_color_type_t, colorspace, props)
    ccall((:sk_surface_new_backend_render_target, libskia), Ptr{sk_surface_t}, (Ptr{gr_direct_context_t}, Ptr{gr_backendrendertarget_t}, gr_surface_origin_t, sk_color_type_t, Ptr{sk_color_space_t}, Ptr{sk_surface_props_t}), context, target, origin, colorType, colorspace, props)
end

"""
    sk_surface_unref(surface)

$(_doc_external(:sk_surface_unref))
"""
function sk_surface_unref(surface)
    ccall((:sk_surface_unref, libskia), Cvoid, (Ptr{sk_surface_t},), surface)
end

"""
    sk_surfaceprops_new(flags::UInt32, geometry::sk_pixel_geometry_t)

$(_doc_external(:sk_surfaceprops_new))
"""
function sk_surfaceprops_new(flags::UInt32, geometry::sk_pixel_geometry_t)
    ccall((:sk_surfaceprops_new, libskia), Ptr{sk_surface_props_t}, (UInt32, sk_pixel_geometry_t), flags, geometry)
end

"""
    sk_surfaceprops_delete(surface_props)

$(_doc_external(:sk_surfaceprops_delete))
"""
function sk_surfaceprops_delete(surface_props)
    ccall((:sk_surfaceprops_delete, libskia), Cvoid, (Ptr{sk_surface_props_t},), surface_props)
end

"""
    sk_textblob_builder_alloc_run(builder, font, count::Cint, x::Cfloat, y::Cfloat, bounds)

$(_doc_external(:sk_textblob_builder_alloc_run))
"""
function sk_textblob_builder_alloc_run(builder, font, count::Cint, x::Cfloat, y::Cfloat, bounds)
    ccall((:sk_textblob_builder_alloc_run, libskia), Ptr{sk_text_blob_builder_run_buffer_t}, (Ptr{sk_text_blob_builder_t}, Ptr{sk_font_t}, Cint, Cfloat, Cfloat, Ptr{sk_rect_t}), builder, font, count, x, y, bounds)
end

"""
    sk_textblob_builder_alloc_run_pos(builder, font, count::Cint, bounds)

$(_doc_external(:sk_textblob_builder_alloc_run_pos))
"""
function sk_textblob_builder_alloc_run_pos(builder, font, count::Cint, bounds)
    ccall((:sk_textblob_builder_alloc_run_pos, libskia), Ptr{sk_text_blob_builder_run_buffer_t}, (Ptr{sk_text_blob_builder_t}, Ptr{sk_font_t}, Cint, Ptr{sk_rect_t}), builder, font, count, bounds)
end

"""
    sk_textblob_builder_alloc_run_pos_h(builder, font, count::Cint, y::Cfloat, bounds)

$(_doc_external(:sk_textblob_builder_alloc_run_pos_h))
"""
function sk_textblob_builder_alloc_run_pos_h(builder, font, count::Cint, y::Cfloat, bounds)
    ccall((:sk_textblob_builder_alloc_run_pos_h, libskia), Ptr{sk_text_blob_builder_run_buffer_t}, (Ptr{sk_text_blob_builder_t}, Ptr{sk_font_t}, Cint, Cfloat, Ptr{sk_rect_t}), builder, font, count, y, bounds)
end

"""
    sk_textblob_builder_delete(builder)

$(_doc_external(:sk_textblob_builder_delete))
"""
function sk_textblob_builder_delete(builder)
    ccall((:sk_textblob_builder_delete, libskia), Cvoid, (Ptr{sk_text_blob_builder_t},), builder)
end

"""
    sk_textblob_builder_make(builder)

$(_doc_external(:sk_textblob_builder_make))
"""
function sk_textblob_builder_make(builder)
    ccall((:sk_textblob_builder_make, libskia), Ptr{sk_text_blob_t}, (Ptr{sk_text_blob_builder_t},), builder)
end

"""
    sk_textblob_builder_new()

$(_doc_external(:sk_textblob_builder_new))
"""
function sk_textblob_builder_new()
    ccall((:sk_textblob_builder_new, libskia), Ptr{sk_text_blob_builder_t}, ())
end

"""
    sk_textblob_get_bounds(blob, bounds)

$(_doc_external(:sk_textblob_get_bounds))
"""
function sk_textblob_get_bounds(blob, bounds)
    ccall((:sk_textblob_get_bounds, libskia), Cvoid, (Ptr{sk_text_blob_t}, Ptr{sk_rect_t}), blob, bounds)
end

"""
    sk_textblob_get_intercepts(blob, bounds, intervals, paint)

$(_doc_external(:sk_textblob_get_intercepts))
"""
function sk_textblob_get_intercepts(blob, bounds, intervals, paint)
    ccall((:sk_textblob_get_intercepts, libskia), Cint, (Ptr{sk_text_blob_t}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sk_paint_t}), blob, bounds, intervals, paint)
end

"""
    sk_textblob_make_from_text(text, byteLength::Csize_t, font, encoding::sk_text_encoding_t)

$(_doc_external(:sk_textblob_make_from_text))
"""
function sk_textblob_make_from_text(text, byteLength::Csize_t, font, encoding::sk_text_encoding_t)
    ccall((:sk_textblob_make_from_text, libskia), Ptr{sk_text_blob_t}, (Ptr{Cvoid}, Csize_t, Ptr{sk_font_t}, sk_text_encoding_t), text, byteLength, font, encoding)
end

"""
    sk_textblob_unref(blob)

$(_doc_external(:sk_textblob_unref))
"""
function sk_textblob_unref(blob)
    ccall((:sk_textblob_unref, libskia), Cvoid, (Ptr{sk_text_blob_t},), blob)
end

"""
    sk_typeface_get_family_name(typeface)

$(_doc_external(:sk_typeface_get_family_name))
"""
function sk_typeface_get_family_name(typeface)
    ccall((:sk_typeface_get_family_name, libskia), Ptr{sk_string_t}, (Ptr{sk_typeface_t},), typeface)
end

"""
    sk_typeface_get_fontstyle(typeface)

$(_doc_external(:sk_typeface_get_fontstyle))
"""
function sk_typeface_get_fontstyle(typeface)
    ccall((:sk_typeface_get_fontstyle, libskia), Ptr{sk_font_style_t}, (Ptr{sk_typeface_t},), typeface)
end

"""
    sk_typeface_get_units_per_em(typeface)

$(_doc_external(:sk_typeface_get_units_per_em))
"""
function sk_typeface_get_units_per_em(typeface)
    ccall((:sk_typeface_get_units_per_em, libskia), Cint, (Ptr{sk_typeface_t},), typeface)
end

"""
    sk_typeface_is_fixed_pitch(typeface)

$(_doc_external(:sk_typeface_is_fixed_pitch))
"""
function sk_typeface_is_fixed_pitch(typeface)
    ccall((:sk_typeface_is_fixed_pitch, libskia), Bool, (Ptr{sk_typeface_t},), typeface)
end

"""
    sk_typeface_unref(typeface)

$(_doc_external(:sk_typeface_unref))
"""
function sk_typeface_unref(typeface)
    ccall((:sk_typeface_unref, libskia), Cvoid, (Ptr{sk_typeface_t},), typeface)
end

"""
    sk_dynamic_memory_wstream_new()

$(_doc_external(:sk_dynamic_memory_wstream_new))
"""
function sk_dynamic_memory_wstream_new()
    ccall((:sk_dynamic_memory_wstream_new, libskia), Ptr{sk_dynamic_memory_wstream_t}, ())
end

"""
    sk_dynamic_memory_wstream_as_wstream(stream)

$(_doc_external(:sk_dynamic_memory_wstream_as_wstream))
"""
function sk_dynamic_memory_wstream_as_wstream(stream)
    ccall((:sk_dynamic_memory_wstream_as_wstream, libskia), Ptr{sk_wstream_t}, (Ptr{sk_dynamic_memory_wstream_t},), stream)
end

"""
    sk_dynamic_memory_wstream_write(stream, buffer, size::Csize_t)

$(_doc_external(:sk_dynamic_memory_wstream_write))
"""
function sk_dynamic_memory_wstream_write(stream, buffer, size::Csize_t)
    ccall((:sk_dynamic_memory_wstream_write, libskia), Bool, (Ptr{sk_dynamic_memory_wstream_t}, Ptr{Cvoid}, Csize_t), stream, buffer, size)
end

"""
    sk_dynamic_memory_wstream_bytes_written(stream)

$(_doc_external(:sk_dynamic_memory_wstream_bytes_written))
"""
function sk_dynamic_memory_wstream_bytes_written(stream)
    ccall((:sk_dynamic_memory_wstream_bytes_written, libskia), Csize_t, (Ptr{sk_dynamic_memory_wstream_t},), stream)
end

"""
    sk_dynamic_memory_wstream_read(stream, buffer, offset::Csize_t, size::Csize_t)

$(_doc_external(:sk_dynamic_memory_wstream_read))
"""
function sk_dynamic_memory_wstream_read(stream, buffer, offset::Csize_t, size::Csize_t)
    ccall((:sk_dynamic_memory_wstream_read, libskia), Csize_t, (Ptr{sk_dynamic_memory_wstream_t}, Ptr{Cvoid}, Csize_t, Csize_t), stream, buffer, offset, size)
end

"""
    sk_dynamic_memory_wstream_delete(stream)

$(_doc_external(:sk_dynamic_memory_wstream_delete))
"""
function sk_dynamic_memory_wstream_delete(stream)
    ccall((:sk_dynamic_memory_wstream_delete, libskia), Cvoid, (Ptr{sk_dynamic_memory_wstream_t},), stream)
end

"""
    sk_file_wstream_new(path)

$(_doc_external(:sk_file_wstream_new))
"""
function sk_file_wstream_new(path)
    ccall((:sk_file_wstream_new, libskia), Ptr{sk_file_wstream_t}, (Ptr{UInt8},), path)
end

"""
    sk_file_wstream_as_wstream(stream)

$(_doc_external(:sk_file_wstream_as_wstream))
"""
function sk_file_wstream_as_wstream(stream)
    ccall((:sk_file_wstream_as_wstream, libskia), Ptr{sk_wstream_t}, (Ptr{sk_file_wstream_t},), stream)
end

"""
    sk_file_wstream_write(stream, buffer, size::Csize_t)

$(_doc_external(:sk_file_wstream_write))
"""
function sk_file_wstream_write(stream, buffer, size::Csize_t)
    ccall((:sk_file_wstream_write, libskia), Bool, (Ptr{sk_file_wstream_t}, Ptr{Cvoid}, Csize_t), stream, buffer, size)
end

"""
    sk_file_wstream_bytes_written(stream)

$(_doc_external(:sk_file_wstream_bytes_written))
"""
function sk_file_wstream_bytes_written(stream)
    ccall((:sk_file_wstream_bytes_written, libskia), Csize_t, (Ptr{sk_file_wstream_t},), stream)
end

"""
    sk_file_wstream_flush(stream)

$(_doc_external(:sk_file_wstream_flush))
"""
function sk_file_wstream_flush(stream)
    ccall((:sk_file_wstream_flush, libskia), Cvoid, (Ptr{sk_file_wstream_t},), stream)
end

"""
    sk_file_wstream_delete(stream)

$(_doc_external(:sk_file_wstream_delete))
"""
function sk_file_wstream_delete(stream)
    ccall((:sk_file_wstream_delete, libskia), Cvoid, (Ptr{sk_file_wstream_t},), stream)
end



"""
    sk_document_begin_page(doc, width::Cfloat, height::Cfloat)

$(_doc_external(:sk_document_begin_page))
"""
function sk_document_begin_page(doc, width::Cfloat, height::Cfloat)
    ccall((:sk_document_begin_page, libskia), Ptr{sk_canvas_t}, (Ptr{sk_document_t}, Cfloat, Cfloat), doc, width, height)
end

"""
    sk_document_end_page(doc)

$(_doc_external(:sk_document_end_page))
"""
function sk_document_end_page(doc)
    ccall((:sk_document_end_page, libskia), Cvoid, (Ptr{sk_document_t},), doc)
end

"""
    sk_document_close(doc)

$(_doc_external(:sk_document_close))
"""
function sk_document_close(doc)
    ccall((:sk_document_close, libskia), Cvoid, (Ptr{sk_document_t},), doc)
end

"""
    sk_document_abort(doc)

$(_doc_external(:sk_document_abort))
"""
function sk_document_abort(doc)
    ccall((:sk_document_abort, libskia), Cvoid, (Ptr{sk_document_t},), doc)
end

"""
    sk_document_make_pdf(stream, metadata)

$(_doc_external(:sk_document_make_pdf))
"""
function sk_document_make_pdf(stream, metadata)
    ccall((:sk_document_make_pdf, libskia), Ptr{sk_document_t}, (Ptr{sk_wstream_t}, Ptr{sk_metadata_t}), stream, metadata)
end

# no prototype is found for this function at sk_capi.h:992:16, please use with caution
"""
    register_image_codecs()

$(_doc_external(:register_image_codecs))
"""
function register_image_codecs()
    ccall((:register_image_codecs, libskia), Cvoid, ())
end


# exports
const PREFIXES = ["sk"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
