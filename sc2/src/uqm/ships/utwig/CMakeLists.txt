add_library(uqm_ships_utwig utwig.c utwig.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_utwig PRIVATE uqm_options)
