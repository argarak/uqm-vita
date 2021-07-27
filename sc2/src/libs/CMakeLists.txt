add_subdirectory(file)
add_subdirectory(graphics)
add_subdirectory(log)
add_subdirectory(memory)
add_subdirectory(resource)
add_subdirectory(task)
add_subdirectory(threads)
add_subdirectory(time)
add_subdirectory(uio)

add_library(libs INTERFACE)
target_link_libraries(libs INTERFACE uqm_file
                                     uqm_log
                                     uqm_memory
                                     uqm_resource
                                     uqm_sdl
                                     uqm_task
                                     uqm_threads
                                     uqm_time
                                     uqm_uio)
