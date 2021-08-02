add_subdirectory(regex)
add_subdirectory(libs)
add_subdirectory(uqm)

# add_executable(uqm config.h
#                    endian_uqm.h
#                    options.c options.h
#                    port.c port.h
#                    types.h
#                    uqm.c
#                    uqmversion.h)
# target_link_libraries(uqm PRIVATE uqm_game libs uqm_libs_external uqm_sdlmain uqm_options)

if(NOT HAVE_GETOPT_LONG)
    add_subdirectory(getopt)
    # target_link_libraries(uqm PRIVATE uqm_getopt)
endif()
