add_library(uqm_file dirs.c
                     files.c
                     filintrn.h)
target_link_libraries(uqm_file PRIVATE uqm_options)