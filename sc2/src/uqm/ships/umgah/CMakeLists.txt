add_library(uqm_ships_umgah umgah.c umgah.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_umgah PRIVATE uqm_options)
