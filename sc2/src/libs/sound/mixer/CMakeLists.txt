add_subdirectory(nosound)
add_subdirectory(sdl)

add_library(uqm_sound_mixer mixer.c mixer.h
                            mixerint.h
                            $<TARGET_OBJECTS:uqm_sound_mixer_nosound>
                            $<TARGET_OBJECTS:uqm_sound_mixer_sdl>)
target_link_libraries(uqm_sound_mixer PRIVATE uqm_options)
