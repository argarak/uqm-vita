add_library(uqm_ships_supox supox.c supox.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_supox PRIVATE uqm_options)
