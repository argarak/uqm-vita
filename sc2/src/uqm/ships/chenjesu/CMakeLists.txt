add_library(uqm_ships_chenjesu chenjesu.c chenjesu.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_chenjesu PRIVATE uqm_options)
