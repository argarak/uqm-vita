add_library(uqm_ships_human human.c human.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_human PRIVATE uqm_options)
