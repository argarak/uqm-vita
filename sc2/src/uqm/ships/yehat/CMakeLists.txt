add_library(uqm_ships_yehat yehat.c yehat.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_yehat PRIVATE uqm_options)
