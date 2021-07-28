add_library(uqm_ships_probe probe.c probe.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_probe PRIVATE uqm_options)
