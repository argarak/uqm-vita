add_library(uqm_mikmod drv_nos.c
                       load_it.c
                       load_mod.c
                       load_s3m.c
                       load_stm.c
                       load_xm.c
                       mdreg.c
                       mdriver.c
                       mikmod_build.h
                       mikmod_internals.h
                       mikmod.h
                       mloader.c
                       mlreg.c
                       mlutil.c
                       mmalloc.c
                       mmerror.c
                       mmio.c
                       mplayer.c
                       munitrk.c
                       mwav.c
                       npertab.c
                       sloader.c
                       virtch_common.c
                       virtch.c
                       virtch2.c)
target_link_libraries(uqm_mikmod PRIVATE uqm_options)
