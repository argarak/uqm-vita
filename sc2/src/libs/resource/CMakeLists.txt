add_library(uqm_resource direct.c
                         filecntl.c
                         getres.c
                         index.h
                         loadres.c
                         propfile.c propfile.h
                         resinit.c
                         resintrn.h
                         stringbank.c stringbank.h)
target_link_libraries(uqm_resource PRIVATE uqm_options)
