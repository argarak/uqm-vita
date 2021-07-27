
add_library(uqm_comm commall.h
                     arilou/arilouc.c   arilou/resinst.h    arilou/strings.h
                     blackur/blackurc.c blackur/resinst.h   blackur/strings.h
                     chmmr/chmmrc.c     chmmr/resinst.h     chmmr/strings.h
                     blackur/blackurc.c blackur/resinst.h   blackur/strings.h
                     comandr/comandr.c  comandr/resinst.h   comandr/strings.h
                     druuge/druugec.c   druuge/resinst.h    druuge/strings.h
                     ilwrath/ilwrathc.c ilwrath/resinst.h   ilwrath/strings.h
                     melnorm/melnorm.c  melnorm/resinst.h   melnorm/strings.h
                     mycon/myconc.c     mycon/resinst.h     mycon/strings.h
                     orz/orzc.c         orz/resinst.h       orz/strings.h
                     pkunk/pkunkc.c     pkunk/resinst.h     pkunk/strings.h
                     rebel/rebel.c                          rebel/strings.h
                     shofixt/shofixt.c  shofixt/resinst.h   shofixt/strings.h
                     slyhome/slyhome.c  slyhome/resinst.h   slyhome/strings.h
                     slyland/slyland.c  slyland/resinst.h   slyland/strings.h
                     spahome/spahome.c                      spahome/strings.h
                     spathi/spathic.c   spathi/resinst.h    spathi/strings.h
                     starbas/starbas.c                      starbas/strings.h
                     supox/supoxc.c     supox/resinst.h     supox/strings.h
                     syreen/syreenc.c   syreen/resinst.h    syreen/strings.h
                     talkpet/talkpet.c  talkpet/resinst.h   talkpet/strings.h
                     thradd/thraddc.c   thradd/resinst.h    thradd/strings.h
                     umgah/umgahc.c     umgah/resinst.h     umgah/strings.h
                     urquan/urquanc.c   urquan/resinst.h    urquan/strings.h
                     utwig/utwigc.c     utwig/resinst.h     utwig/strings.h
                     vux/vuxc.c         vux/resinst.h       vux/strings.h
                     yehat/yehatc.c     yehat/resinst.h     yehat/strings.h
                     zoqfot/zoqfotc.c   zoqfot/resinst.h    zoqfot/strings.h
                     )
target_link_libraries(uqm_comm PRIVATE uqm_options)
