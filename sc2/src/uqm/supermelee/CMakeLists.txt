add_library(uqm_supermelee buildpick.c buildpick.h
                           loadmele.c loadmele.h
                           melee.c melee.h
                           meleesetup.c meleesetup.h
                           meleeship.h
                           pickmele.c pickmele.h)
target_link_libraries(uqm_supermelee PRIVATE uqm_options)

if(NETPLAY)
    add_subdirectory(netplay) 
    target_link_libraries(uqm_supermelee PRIVATE uqm_netplay)
endif()
