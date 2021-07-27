add_library(uqm_sdltime stltime.c sdltime.h)
target_link_libraries(uqm_sdltime PRIVATE uqm_options uqm_lib_sdl)
