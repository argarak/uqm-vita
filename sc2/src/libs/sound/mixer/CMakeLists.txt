add_subdirectory(nosound)
add_subdirectory(sdl)

add_library(uqm_sound_mixer mixer.c mixer.h
                            mixerint.h)
target_link_libraries(uqm_sound_mixer PRIVATE uqm_options
                                              uqm_sound_mixer_nosound
                                              uqm_sound_mixer_sdl)
