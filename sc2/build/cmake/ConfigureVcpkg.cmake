# Configure CMake to use the vcpkg CMake toolchain file, found in the vcpkg submodule
function(configure_vcpkg VCPKG_TOOLCHAIN_FILE)
    if(NOT EXISTS ${VCPKG_TOOLCHAIN_FILE})
        message(WARNING "The vcpkg submodule was not found! If using a vcpkg submodule, check that submodule is initialized and updated and try again.")
    endif()

    if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
        set(CMAKE_TOOLCHAIN_FILE ${VCPKG_TOOLCHAIN_FILE} PARENT_SCOPE)
    elseif(NOT CMAKE_TOOLCHAIN_FILE STREQUAL VCPKG_TOOLCHAIN_FILE)
        message(STATUS "Not using vcpkg toolchain file; CMAKE_TOOLCHAIN_FILE is already set: ${CMAKE_TOOLCHAIN_FILE}")
    endif()
endfunction()
