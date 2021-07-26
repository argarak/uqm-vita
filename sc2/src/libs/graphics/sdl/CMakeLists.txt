
add_library(sdl 2xscalers.c 2xscalers.h
                2xscalers_mmx.c 2xscalers_mmx.h
                2xscalers_sse.c
                2xscalers_3dnow.c
                biadv2x.c
                bilinear2x.c
                canvas.c
                hq2x.c
                nearest2x.c
                opengl.c opengl.h
                palette.c palette.h
                png2sdl.c png2sdl.h
                primitives.c primitives.h
                pure.c pure.h
                rotozoom.c rotozoom.h
                scaleint.h
                scalemmx.h
                scalers.c scalers.h
                sdl_common.c sdl_common.h
                sdl1_common.c
                sdl2_common.c
                sdl2_pure.c
                sdluio.c sdluio.h
                triscan2x.c)
find_package(PNG REQUIRED)
# uqm_lib_graphics will include the library and headers for whichever
# SDL was selected by the "graphics" option in UqmBuildConfig.cmake.
# TODO: Test other options besides SDL2
target_link_libraries(sdl PRIVATE uqm_options uqm_lib_graphics PNG::PNG)
