add_library(uqm_callback alarm.c alarm.h
                         async.c async.h
                         callback.c callback.h)
target_link_libraries(uqm_callback PRIVATE uqm_options uqm_lib_sdl)
