add_library(uqm_ships_androsyn androsyn.c androsyn.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_androsyn PRIVATE uqm_options)
