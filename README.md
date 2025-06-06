# Skia in Julia

Support for the Skia libary in Julia. Skia is the 2D drawing library used by Chrome and other browsers to draw web pages. The library is suited for e.g. real time plotting on all platforms. 

Currently, it works on Linux, and sample code is only provided for OpenGL. Vulkan support will be added, and hopefully Metal support as well. Mac and Windows will be added later.

```julia

using Skia

using GLFW

const WIDTH::Int32 = 960
const HEIGHT::Int32 = 640


function init_skia(width::Int32, height::Int32)

	interface = Skia.gr_glinterface_create_native_interface()
	sContext = Skia.gr_direct_context_make_gl(interface)
	framebufferInfo = Skia.gr_gl_framebufferinfo_t(0, 0x8058, false)
	backendRenderTarget  = Skia.gr_backendrendertarget_new_gl(width, height, Int32(0), Int32(0), Ref(framebufferInfo))
	surfaceOrigin =  Skia.GR_SURFACE_ORIGIN_BOTTOM_LEFT	
	colorType = Skia.SK_COLOR_TYPE_RGBA_8888
	colorSpace = C_NULL
	sSurface = sk_surface_new_backend_render_target(sContext, backendRenderTarget, surfaceOrigin, colorType, colorSpace, C_NULL)

	return sSurface, sContext
end

   
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3);
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 2);
GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, true);
GLFW.WindowHint(GLFW.OPENGL_PROFILE, GLFW.OPENGL_CORE_PROFILE);

GLFW.WindowHint(GLFW.STENCIL_BITS, 0);
	
GLFW.WindowHint(GLFW.DEPTH_BITS, 0);

window = GLFW.CreateWindow(WIDTH, HEIGHT, "GLFW.jl")

# Make the window's context current
GLFW.MakeContextCurrent(window)

sSurface, sContext = init_skia(WIDTH, HEIGHT)

canvas = sk_surface_get_canvas(sSurface)

GLFW.SwapInterval(1)

paint = sk_paint_new()

rect = Ref(sk_rect_t(100, 200, 300, 500))

# Loop until the user closes the window
while !GLFW.WindowShouldClose(window)

	# Move the mouse and the loop responds by repainting
	GLFW.WaitEvents()
 

	paintColor::UInt32 = 0xFF000000::UInt32 + rand(UInt32)

	
	sk_paint_set_color(paint, paintColor)

	
	sk_canvas_draw_rect(canvas,rect, paint)

	Skia.gr_direct_context_flush_and_submit(sContext, false)

	# Swap front and back buffers
	GLFW.SwapBuffers(window)

	
end

GLFW.DestroyWindow(window)


```

This is how you can use Skia to create a PDF

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

fileWstream = sk_file_wstream_new("test.pdf")

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
