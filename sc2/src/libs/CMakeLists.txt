add_subdirectory(log)

add_library(libs INTERFACE)
target_link_libraries(libs INTERFACE log)
