add_library(uqm_ships_slylandr slylandr.c slylandr.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_slylandr PRIVATE uqm_options)
