add_library(uqm_ships_zoqfot zoqfot.c zoqfot.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_zoqfot PRIVATE uqm_options)
