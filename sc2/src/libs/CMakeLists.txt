add_subdirectory(graphics)
add_subdirectory(log)

add_library(libs INTERFACE)
target_link_libraries(libs INTERFACE uqm_log uqm_sdl)
