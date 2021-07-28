add_library(uqm_ships_arilou arilou.c arilou.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_arilou PRIVATE uqm_options)
