add_library(uqm_network_socket OBJECT socket.c socket.h)

if(USE_WINSOCK)
    target_sources(uqm_network_socket PRIVATE socket_win.c socket_win.h)
else()
    target_sources(uqm_network_socket PRIVATE socket_bsd.c socket_bsd.h)
endif()

target_link_libraries(uqm_network_socket PRIVATE uqm_options)
