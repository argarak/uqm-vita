add_library(uqm_ships_syreen syreen.c syreen.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_syreen PRIVATE uqm_options)
