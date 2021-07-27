add_library(uqm_math mthintrn.h
                     random.c random.h
                     random2.c
                     sqrt.c)
target_link_libraries(uqm_math PRIVATE uqm_options)
