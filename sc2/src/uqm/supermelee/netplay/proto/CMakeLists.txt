add_library(uqm_netplay_proto npconfirm.c npconfirm.h
                              ready.c ready.h
                              reset.c reset.h)
target_link_libraries(uqm_netplay_proto PRIVATE uqm_options)
