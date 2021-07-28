add_library(uqm_ships_sis_ship sis_ship.c sis_ship.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_sis_ship PRIVATE uqm_options)
