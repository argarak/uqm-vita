add_library(uqm_sound_openal audiodrv_openal.c audiodrv_openal.h)
target_link_libraries(uqm_sound_openal PRIVATE uqm_options)
# TODO We need to actually link OpenAL
