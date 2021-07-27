add_library(uqm_strings getstr.c
                        sfileins.c
                        sresins.c
                        stringhashtable.c stringhashtable.h
                        strings.c
                        strintrn.h
                        unicode.c)
target_link_libraries(uqm_strings PRIVATE uqm_options)
