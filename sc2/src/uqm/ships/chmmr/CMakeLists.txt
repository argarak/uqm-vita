add_library(uqm_ships_chmmr chmmr.c chmmr.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_chmmr PRIVATE uqm_options)
