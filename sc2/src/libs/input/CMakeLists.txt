add_subdirectory(sdl)

add_library(uqm_input inpintrn.h
                      input_common.c input_common.h)
target_link_libraries(uqm_input PRIVATE uqm_options
                                PUBLIC uqm_input_sdl)
