add_subdirectory(connect)
add_subdirectory(netmanager)
add_subdirectory(socket)

add_library(uqm_network bytesex.h
                        netport.c netport.h
                        network.h
                        $<TARGET_OBJECTS:uqm_network_connect>
                        $<TARGET_OBJECTS:uqm_network_netmanager>
                        $<TARGET_OBJECTS:uqm_network_socket>)

if(USE_WINSOCK)
    target_sources(uqm_network PRIVATE network_win.c)
    if(MACRO___MINGW32__)
        target_sources(uqm_network PRIVATE wspiapiwrap.c wspiapiwrap.h)
    endif()
    target_link_libraries(uqm_network PRIVATE ws2_32)
else()
    target_sources(uqm_network PRIVATE network_bsd.c)
endif()

target_link_libraries(uqm_network PRIVATE uqm_options)