add_subdirectory(file)
add_subdirectory(graphics)
add_subdirectory(log)
add_subdirectory(memory)
add_subdirectory(resource)
add_subdirectory(threads)
add_subdirectory(uio)

add_library(libs INTERFACE)
target_link_libraries(libs INTERFACE uqm_file
                                     uqm_log
                                     uqm_memory
                                     uqm_resource
                                     uqm_sdl
                                     uqm_threads
                                     uqm_uio)
