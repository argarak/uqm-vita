add_library(uqm_sdltime sdltime.c sdltime.h)
target_link_libraries(uqm_sdltime PRIVATE uqm_options uqm_lib_sdl)
