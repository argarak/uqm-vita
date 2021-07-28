add_library(uqm_ships_lastbat lastbat.c lastbat.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_lastbat PRIVATE uqm_options)
