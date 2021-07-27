add_subdirectory(decoders)
add_subdirectory(mixer)

add_library(uqm_sound audiocore.c audiocore.h
                      fileinst.c
                      music.c
                      resinst.c
                      sfx.c
                      sndintrn.h
                      sound.c sound.h
                      stream.c stream.h
                      trackint.h
                      trackplayer.c trackplayer.h)
target_link_libraries(uqm_sound PRIVATE uqm_options
                                        uqm_sound_decoders
                                        uqm_sound_mixer)

if(SOUNDMODULE STREQUAL openal)
    add_subdirectory(openal)
    target_link_libraries(uqm_sound PRIVATE uqm_sound_openal)
endif()
