add_library(uqm_ships_mmrnmhrm mmrnmhrm.c mmrnmhrm.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_mmrnmhrm PRIVATE uqm_options)
