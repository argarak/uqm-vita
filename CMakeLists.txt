cmake_minimum_required(VERSION 3.20.3)

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  if(DEFINED ENV{VITASDK})
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VITASDK}/share/vita.toolchain.cmake" CACHE PATH "toolchain file")
  else()
    message(FATAL_ERROR "Please define VITASDK to point to your SDK path!")
  endif()
endif()

include("$ENV{VITASDK}/share/vita.cmake" REQUIRED)

set(VITA_APP_NAME "Ur-Quan Masters")
set(VITA_TITLEID  "UQMC00001")
set(VITA_VERSION  "01.00")

# TODO: Consider moving project to sc2 directory so we can do all this there

# Configure vcpkg (requires vcpkg submodule)
option(USE_VCPKG "Use vcpkg for library dependencies" OFF)
option(GIT_SUBMODULE "Update submodules during build" OFF)
if(USE_VCPKG)
    # Optionally update vcpkg submodule (mainly for use by CI)
    include(sc2/build/cmake/UpdateSubmodule.cmake)
    update_submodule("${CMAKE_CURRENT_LIST_DIR}/vcpkg")

    # Configure vcpkg
    include(sc2/build/cmake/ConfigureVcpkg.cmake)
    configure_vcpkg("${CMAKE_CURRENT_LIST_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
endif()

project(uqm VERSION 0.8.0
            LANGUAGES C)

# Targets can "link" this "library" to inherit project options.
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE c_std_99) # Require _at least_ C99

add_subdirectory(sc2)

vita_create_self(${PROJECT_NAME}.self "sc2/${PROJECT_NAME}")
vita_create_vpk(${PROJECT_NAME}.vpk ${VITA_TITLEID} ${PROJECT_NAME}.self
  VERSION ${VITA_VERSION}
  NAME ${VITA_APP_NAME}
  FILE sce_sys/icon0.png sce_sys/icon0.png
  FILE sce_sys/livearea/contents/bg.png sce_sys/livearea/contents/bg.png
  FILE sce_sys/livearea/contents/startup.png sce_sys/livearea/contents/startup.png
  FILE sce_sys/livearea/contents/template.xml sce_sys/livearea/contents/template.xml
)
