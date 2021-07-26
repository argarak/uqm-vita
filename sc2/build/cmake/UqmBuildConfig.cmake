include(CheckSymbolExists)
include(CheckTypeSize)

# TODO: Write a function to add these
# TODO: Reflect the individual option decriptions from the original
# TODO: Actually act on these options
# TODO: Put more thought into this file's organization and comments

add_library(uqm_lib_graphics INTERFACE)
add_library(uqm_lib_threadlib INTERFACE)

add_library(uqm_libs_external INTERFACE)
target_link_libraries(uqm_libs_external INTERFACE uqm_lib_graphics
                                                  uqm_lib_threadlib)

# Preprocessor define targets
add_library(uqm_defines_common INTERFACE)
add_library(uqm_defines_c INTERFACE)
add_library(uqm_defines_cxx INTERFACE)
target_link_libraries(uqm_defines_c INTERFACE uqm_defines_common)
target_link_libraries(uqm_defines_cxx INTERFACE uqm_defines_common)

# From build.config
set(graphics sdl2 CACHE STRING "Graphics Engine")
set_property(CACHE graphics PROPERTY STRINGS pure opengl sdl2)

if(${graphics} STREQUAL sdl2)
    find_package(SDL2 REQUIRED)
    target_link_libraries(uqm_lib_graphics INTERFACE SDL2::SDL2)
    target_compile_definitions(uqm_defines_c INTERFACE GFXMODULE_SDL SDL_DIR=SDL)
    set(GFXMODULE sdl)
    set(HAVE_OPENGL 0)
elseif(${graphics} STREQUAL opengl)
    message(FATAL_ERROR "TODO: Graphics option 'opengl' not yet implemented")
elseif(${graphics} STREQUAL pure)
    message(FATAL_ERROR "TODO: Graphics option 'pure' not yet implemented")
else()
    message(FATAL_ERROR "Invalid graphics option: ${graphics}")
endif()

set(sound mixsdl CACHE STRING "Sound backend")
set_property(CACHE sound PROPERTY STRINGS mixsdl openal)

set(ovcodec standard CACHE STRING "Ogg Vorbis codec")
set_property(CACHE ovcodec PROPERTY STRINGS standard tremor none)

set(mikmod internal CACHE STRING "Tracker music support")
set_property(CACHE mikmod PROPERTY STRINGS internal external)

set(joystick enabled CACHE STRING "Joystick support")
set_property(CACHE joystick PROPERTY STRINGS enabled disabled)

set(netplay full CACHE STRING "Network Supermelee support")
set_property(CACHE netplay PROPERTY STRINGS none full ipv4)

set(ioformat stdio_zip CACHE STRING "Supported file i/o methods")
set_property(CACHE ioformat PROPERTY STRINGS stdio stdio_zip)

set(accel asm CACHE STRING "Graphics/Sound optimizations")
set_property(CACHE ioformat PROPERTY STRINGS asm plainc)

set(threadlib sdl CACHE STRING "Thread library")
set_property(CACHE ioformat PROPERTY STRINGS sdl pthread)
if(${threadlib} STREQUAL sdl)
    find_package(SDL2 REQUIRED)
    target_link_libraries(uqm_lib_threadlib INTERFACE SDL2::SDL2)
    target_compile_definitions(uqm_defines_common INTERFACE THREADLIB_SDL)
    set(THREADLIB SDL)
elseif(${threadlib} STREQUAL pthread)
    target_compile_definitions(uqm_defines_common INTERFACE THREADLIB_PTHREAD)
    set(THREADLIB PTHREAD)
else()
    message(FATAL_ERROR "Invalid thread library option: ${threadlib}")
endif()

# TODO: "install_prefix" is a CMake thing. Maybe don't use these names?
set(install_prefix      "/usr/local/games"  CACHE STRING "Installation prefix")
set(install_bindir      "$prefix/bin"       CACHE STRING "Location for binaries")
set(install_libdir      "$prefix/lib"       CACHE STRING "Location for non-sharable data")
set(install_sharedir    "$prefix/share"     CACHE STRING "Location for sharable data")

# Set INSTALL_LIBDIR, INSTALL_BINDIR, and INSTALL_SHAREDIR to the specified
# values, replacing '$prefix' to the prefix set.
string(REPLACE $prefix ${install_prefix} INSTALL_BINDIR ${install_bindir})
string(REPLACE $prefix ${install_prefix} INSTALL_LIBDIR ${install_libdir})
string(REPLACE $prefix ${install_prefix} INSTALL_SHAREDIR ${install_sharedir})
string(CONCAT UNIX_CONTENTDIR ${INSTALL_SHAREDIR} /uqm/content)


# TODO: Is Cygwin Windows, or Unix, for UQM's purposes? config.h treats it
# as Windows.  Does anyone actually build or test the game on Cygwin?
# TODO: The CYGWIN variable refers to Cygwin CMake, not a Cygwin target, which
# is not necessarily what we want here.
# TODO: Handle other targets?
if(WIN32 OR CYGWIN)
    set(CONTENTDIR "../content/")
    set(USERDIR "%APPDATA%/uqm/")
    set(MELEEDIR "%UQM_CONFIG_DIR%/teams/")
    set(SAVEDIR "%UQM_CONFIG_DIR%/save/")
elseif(UNIX)
    set(CONTENTDIR UNIX_CONTENTDIR)
    set(USERDIR "~/.uqm/")
    set(MELEEDIR "${UQM_CONFIG_DIR}/teams/")
    set(SAVEDIR "${UQM_CONFIG_DIR}/save/")
else()
    message(FATAL_ERROR "Unrecognized target operating system")
endif()

# TODO: CMAKE_C_BYTE_ORDER may be undefined in which case this will treat
# it as little-endian, possibly wrongly. The Unix build system can detect
# build order, consider trying the same?  Letting the user override this
# may be good enough.
if(CMAKE_C_BYTE_ORDER STREQUAL BIG_ENDIAN)
    set(WORD_BIGENDIAN 1)
endif()
# option(WORD_BIGENDIAN "Whether the target architecture is big-endian" (CMAKE_C_BYTE_ORDER STREQUAL BIG_ENDIAN))

check_symbol_exists(readdir_r   "dirent.h"  HAVE_READDIR_R)
check_symbol_exists(setenv      "stdlib.h"  HAVE_SETENV)
check_symbol_exists(strupr      "string.h"  HAVE_STRUPR)
check_symbol_exists(strcasecmp  "strings.h" HAVE_STRCASECMP_UQM)
check_symbol_exists(stricmp     "string.h"  HAVE_STRICMP)
check_symbol_exists(getopt_long "getopt.h"  HAVE_GETOPT_LONG)
check_symbol_exists(iswgraph    "wctype.h"  HAVE_ISWGRAPH)
check_type_size(wchar_t WCHAR_T)
check_type_size(_Bool   _BOOL)

# check_type_size(wint_t  WINT_T)
# FIXME This check does not seem to work reliably on all platforms, and I
# couldn't find a check that does with some modest effort.  Because wint_t
# is required by the C standard I'm not going to lose any sleep over failing
# to accomodate systems that don't have it for some reason.
set(HAVE_WINT_T TRUE)

configure_file(${PROJECT_SOURCE_DIR}/sc2/src/config_cmake.h.in
               ${PROJECT_BINARY_DIR}/sc2/src/config_cmake.h)
