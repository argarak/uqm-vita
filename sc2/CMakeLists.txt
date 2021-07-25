include(build/cmake/UqmBuildConfig.cmake)

# The uqm_options interface "library" will be "linked" by every target in
# the project to inherit include directories and definitions that the code
# needs to compile.
add_library(uqm_options INTERFACE)
# UqmBuildConfig.cmake will generate config_cmake.h out-of-source, so add
# the output directory as an include directory along with the source
# directory.
target_include_directories(uqm_options INTERFACE ${PROJECT_SOURCE_DIR}/sc2/src
                                                 ${PROJECT_BINARY_DIR}/sc2/src)
# CMAKE tells config.h to use CMake-generated build config.
target_compile_definitions(uqm_options INTERFACE CMAKE)

add_subdirectory(src)
