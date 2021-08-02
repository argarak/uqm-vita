add_subdirectory(regex)
add_subdirectory(libs)
add_subdirectory(uqm)

if(NOT HAVE_GETOPT_LONG)
    add_subdirectory(getopt)
endif()

add_library(uqm_src_files OBJECT config.h
                                 endian_uqm.h
                                 options.c options.h
                                 port.c port.h
                                 types.h
                                 uqm.c
                                 uqmversion.h)
target_link_libraries(uqm_src_files PRIVATE uqm_game libs uqm_libs_external uqm_options)
