add_library(uqm_network_connect connect.c connect.h
                                listen.c listen.h
                                resolve.c resolve.h)
target_link_libraries(uqm_network_connect PRIVATE uqm_options)
