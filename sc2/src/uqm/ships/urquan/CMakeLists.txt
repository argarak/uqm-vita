add_library(uqm_ships_urquan urquan.c urquan.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_urquan PRIVATE uqm_options)
