add_library(uqm_network_netmanager ndesc.c ndesc.h
                                   ndindex.ci
                                   netmanager_common.ci
                                   netmanager.h)

if(USE_WINSOCK)
    target_sources(uqm_network_netmanager PRIVATE netmanager_win.c netmanager_win.h)
else()
    target_sources(uqm_network_netmanager PRIVATE netmanager_bsd.c netmanager_bsd.h)
endif()

target_link_libraries(uqm_network_netmanager PRIVATE uqm_options)
