add_library(uqm_video dukvid.c dukvid.h
                      legacyplayer.c
                      vfileins.c
                      video.c video.h
                      videodec.c videodec.h
                      vidintrn.h
                      vidplayer.c vidplayer.h
                      vresins.c)
target_link_libraries(uqm_video PRIVATE uqm_options)
