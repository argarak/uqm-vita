add_library(uqm_input_sdl input.c input.h
                          keynames.c keynames.h
                          vcontrol.c vcontrol.h)
target_link_libraries(uqm_input_sdl PRIVATE uqm_options uqm_lib_sdl)
