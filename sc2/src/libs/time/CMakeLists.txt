add_library(uqm_time timecommon.c timecommon.h)
target_link_libraries(uqm_time PRIVATE uqm_options uqm_lib_sdl)
