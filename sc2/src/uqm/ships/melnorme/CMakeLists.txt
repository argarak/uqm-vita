add_library(uqm_ships_melnorme melnorme.c melnorme.h
                               icode.h 
                               resinst.h)
target_link_libraries(uqm_ships_melnorme PRIVATE uqm_options)
