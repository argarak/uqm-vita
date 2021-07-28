add_library(uqm_ships_blackurq blackurq.c blackurq.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_blackurq PRIVATE uqm_options)
