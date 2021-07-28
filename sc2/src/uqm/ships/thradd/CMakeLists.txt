add_library(uqm_ships_thradd thradd.c thradd.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_thradd PRIVATE uqm_options)
