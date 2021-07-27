add_subdirectory(proto)

add_library(uqm_netplay checkbuf.c checkbuf.h
                        checksum.c checksum.h
                        crc.c crc.h
                        nc_connect.ci
                        netconnection.c netconnection.h
                        netinput.c netinput.h
                        netmelee.c netmelee.h
                        netmisc.c netmisc.h
                        netoptions.c netoptions.h
                        netplay.h
                        netrcv.c netrcv.h
                        netsend.c netsend.h
                        netstate.c netstate.h
                        notify.c notify.h
                        notifyall.c notifyall.h
                        packet.c packet.h
                        packethandlers.c packethandlers.h
                        packetq.c packetq.h
                        packetsenders.c packetsenders.h
                        )
target_link_libraries(uqm_netplay PRIVATE uqm_options
                                          uqm_netplay_proto)
