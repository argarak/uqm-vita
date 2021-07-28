add_library(uqm_ships_vux vux.c vux.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_vux PRIVATE uqm_options)
