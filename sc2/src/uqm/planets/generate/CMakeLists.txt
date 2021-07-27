add_library(uqm_planets_generate genall.h
                                 genand.c
                                 genburv.c
                                 genchmmr.c
                                 gencol.c
                                 gendefault.c gendefault.h
                                 gendru.c
                                 genilw.c
                                 genmel.c
                                 genmyc.c
                                 genorz.c
                                 genpet.c
                                 genpku.c
                                 genrain.c
                                 gensam.c
                                 genshof.c
                                 gensly.c
                                 gensol.c
                                 genspa.c
                                 gensup.c
                                 gensyr.c
                                 genthrad.c
                                 gentrap.c
                                 genutw.c
                                 genvault.c
                                 genvux.c
                                 genwreck.c
                                 genyeh.c
                                 genzfpscout.c
                                 genzoq.c
                                 )
target_link_libraries(uqm_planets_generate PRIVATE uqm_options)
