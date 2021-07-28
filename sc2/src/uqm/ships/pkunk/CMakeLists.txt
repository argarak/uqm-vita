add_library(uqm_ships_pkunk pkunk.c pkunk.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_pkunk PRIVATE uqm_options)
