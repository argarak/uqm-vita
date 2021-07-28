add_library(uqm_ships_orz orz.c orz.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_orz PRIVATE uqm_options)
