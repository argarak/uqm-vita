add_library(uqm_ships_druuge druuge.c druuge.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_druuge PRIVATE uqm_options)
