add_subdirectory(stdio)

if(USE_ZIP_IO)
    add_subdirectory(zip)
endif()

add_library(uqm_uio charhashtable.c charhashtable.h
                    defaultfs.c defaultfs.h
                    fileblock.c fileblock.h
                    fstypes.c fstypes.h
                    getint.h
                    gphys.c gphys.h
                    io.c io.h
                    ioaux.c ioaux.h
                    iointrn.h
                    match.c match.h
                    mem.h
                    mount.c mount.h
                    mounttree.c mounttree.h
                    paths.c paths.h
                    physical.c physical.h
                    types.h
                    uioport.h
                    uiostream.c uiostream.h
                    uioutils.c uioutils.h
                    utils.c utils.h)
target_link_libraries(uqm_uio PRIVATE uqm_options regex)

# TODO I'm not sure how these actually get set in the original build system
if(DEBUG OR uqm_UIO_DEBUG)
    target_sources(uqm_uio PRIVATE debug.c debug.h)
endif()

# TODO These files don't actually compile.  I'm guessing that they hadn't
# been tested in the old build system in some time.
if(MEMDEBUG)
    target_sources(uqm_uio PRIVATE hashtable.c hashtable.h
                                   memdebug.c memdebug.h)
endif()
