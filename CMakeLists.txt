cmake_minimum_required(VERSION 3.20.3)

# TODO: Consider moving project to sc2 directory so we can do all this there

# Optionally update vcpkg submodule (mainly for use by CI)
include(sc2/build/cmake/UpdateSubmodule.cmake)
option(GIT_SUBMODULE "Update submodules during build" OFF)
update_submodule("${CMAKE_CURRENT_LIST_DIR}/vcpkg")

# Configure vcpkg (requires vcpkg submodule)
include(sc2/build/cmake/ConfigureVcpkg.cmake)
configure_vcpkg("${CMAKE_CURRENT_LIST_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")

project(uqm VERSION 0.8.0
            LANGUAGES C)

# Targets can "link" this "library" to inherit project options.
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE c_std_99) # Require _at least_ C99

add_subdirectory(sc2)
