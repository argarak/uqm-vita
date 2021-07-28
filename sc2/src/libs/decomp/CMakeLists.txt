add_library(uqm_decomp lzdecode.c
                       lzencode.c
                       lzh.h
                       update.c)
target_link_libraries(uqm_decomp PRIVATE uqm_options)
