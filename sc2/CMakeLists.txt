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
# TODO This should probably be moved to uqm_defines_* ?
target_compile_definitions(uqm_options INTERFACE CMAKE)
target_link_libraries(uqm_options INTERFACE uqm_defines_c)

add_subdirectory(src)

# This is the actual UQM game executable.
add_executable(uqm $<TARGET_OBJECTS:uqm_src_files>)

# Some linkers are sensitive to the order of the inputs - we have to list _first_ mingw32
# (if applicable), _then_ SDLmain, _then_ SDL.
if(MINGW)
  target_link_libraries(uqm PRIVATE mingw32)
endif()
target_link_libraries(uqm PRIVATE uqm_game libs uqm_sdlmain uqm_libs_external uqm_options)
if(NOT HAVE_GETOPT_LONG)
    target_link_libraries(uqm PRIVATE uqm_getopt)
endif()
