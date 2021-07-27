add_subdirectory(connect)
add_subdirectory(netmanager)
add_subdirectory(socket)

add_library(uqm_network bytesex.h
                        netport.c netport.h
                        network.h)

if(USE_WINSOCK)
    target_sources(uqm_network PRIVATE network_win.c)
    if(MACRO___MINGW32__)
        target_sources(uqm_network PRIVATE wspiapiwrap.c wspiapiwrap.h)
    endif()
else()
    target_sources(uqm_network PRIVATE network_bsd.c)
endif()

target_link_libraries(uqm_network PRIVATE uqm_options
                                          uqm_network_connect
                                          uqm_network_netmanager
                                          uqm_network_socket)
