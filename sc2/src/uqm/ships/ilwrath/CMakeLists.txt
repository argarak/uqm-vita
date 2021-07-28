add_library(uqm_ships_ilwrath ilwrath.c ilwrath.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_ilwrath PRIVATE uqm_options)
