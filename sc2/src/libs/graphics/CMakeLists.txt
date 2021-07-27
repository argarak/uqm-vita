add_library(uqm_graphics bbox.c bbox.h
                         boxint.c
                         clipline.c
                         cmap.c cmap.h
                         context.c context.h
                         dcqueue.c dcqueue.h
                         drawable.c drawable.h
                         drawcmd.h
                         filegfx.c
                         font.c font.h
                         frame.c
                         gfx_common.c gfx_common.h
                         gfxintrn.h
                         gfxload.c
                         intersec.c
                         loaddisp.c
                         pixmap.c
                         prim.h
                         resgfx.c
                         tfb_draw.c tfb_draw.h
                         tfb_prim.c tfb_prim.h
                         widgets.c widgets.h)
target_link_libraries(uqm_graphics PRIVATE uqm_options)

if (GFXMODULE STREQUAL sdl)
    add_subdirectory(sdl)
    target_link_libraries(uqm_graphics PUBLIC uqm_sdl)
endif()
