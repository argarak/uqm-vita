add_library(uqm_ships_spathi spathi.c spathi.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_spathi PRIVATE uqm_options)
