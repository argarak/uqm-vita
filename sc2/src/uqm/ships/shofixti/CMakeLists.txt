add_library(uqm_ships_shofixti shofixti.c shofixti.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_shofixti PRIVATE uqm_options)
