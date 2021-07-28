add_library(uqm_ships_mycon mycon.c mycon.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_mycon PRIVATE uqm_options)
