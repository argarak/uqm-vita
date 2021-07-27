add_subdirectory(callback)
add_subdirectory(file)
add_subdirectory(graphics)
add_subdirectory(input)
add_subdirectory(log)
add_subdirectory(memory)
add_subdirectory(resource)
add_subdirectory(sound)
add_subdirectory(strings)
add_subdirectory(task)
add_subdirectory(threads)
add_subdirectory(time)
add_subdirectory(uio)

add_library(libs INTERFACE)
target_link_libraries(libs INTERFACE uqm_callback
                                     uqm_file
                                     uqm_graphics
                                     uqm_input
                                     uqm_log
                                     uqm_memory
                                     uqm_resource
                                     uqm_sound
                                     uqm_strings
                                     uqm_task
                                     uqm_threads
                                     uqm_time
                                     uqm_uio)
