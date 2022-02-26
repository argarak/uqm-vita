include(CheckSymbolExists)
include(CheckTypeSize)

# TODO: Write a function to add these
# TODO: Reflect the individual option decriptions from the original
# TODO: Actually act on these options
# TODO: Put more thought into this file's organization and comments

add_library(uqm_lib_sdl INTERFACE)
add_library(uqm_lib_vorbis INTERFACE)
add_library(uqm_lib_threadlib INTERFACE)

add_library(uqm_libs_external INTERFACE)
target_link_libraries(uqm_libs_external INTERFACE uqm_lib_sdl
                                                  uqm_lib_vorbis
                                                  uqm_lib_threadlib
                                                  uqm_vita_stub)

# SDL applications need to be linked with a special SDL target which provides
# a WinMain function on Windows. This target is an alias for the appropriate
# library target from either SDL1 or SDL2.
add_library(uqm_sdlmain INTERFACE)

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
    #find_package(SDL2 REQUIRED)
    target_link_libraries(uqm_lib_sdl INTERFACE SDL2)
    target_link_libraries(uqm_sdlmain INTERFACE SDL2main)
    target_compile_definitions(uqm_defines_c INTERFACE GFXMODULE_SDL SDL_DIR=SDL2)
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
if(${sound} STREQUAL mixsdl)
    set(SOUNDMODULE sdlmix)
elseif(${sound} STREQUAL openal)
    set(SOUNDMODULE openal)
    message(FATAL_ERROR "TODO: Graphics option 'openal' not yet implemented")
else()
    message(FATAL_ERROR "Invalid sound option: ${sound}")
endif()

set(ovcodec standard CACHE STRING "Ogg Vorbis codec")
set_property(CACHE ovcodec PROPERTY STRINGS standard tremor none)
if(${ovcodec} STREQUAL standard)
    set(OGGVORBIS vorbisfile)
    #find_package(Vorbis)
    if (TARGET Vorbis::vorbis)
        target_link_libraries(uqm_lib_vorbis INTERFACE Vorbis::vorbis Vorbis::vorbisfile)
    else()
        # XXX The MSYS2 libvorbis distribution is missing VorbisConfig.cmake and
        # related files, so attempt to fall back to pkg-config as an alternative.
        message(WARNING "find_package(Vorbis) failed; trying pkg_check_modules instead")
        include(FindPkgConfig)
        pkg_check_modules(vorbis REQUIRED IMPORTED_TARGET vorbis)
        pkg_check_modules(vorbisfile REQUIRED IMPORTED_TARGET vorbisfile)
        target_link_libraries(uqm_lib_vorbis INTERFACE PkgConfig::vorbis PkgConfig::vorbisfile)
    endif()
elseif(${ovcodec} STREQUAL tremor)
    target_compile_definitions(uqm_defines_common INTERFACE OVCODEC_TREMOR)
    set(OGGVORBIS tremor)
elseif(${ovcodec} STREQUAL none)
    target_compile_definitions(uqm_defines_common INTERFACE OVCODEC_NONE)
    set(OGGVORBIS none)
else()
    message(FATAL_ERROR "Invalid Ogg Vorbis codec option: ${ovcodec}")
endif()

set(mikmod internal CACHE STRING "Tracker music support")
set_property(CACHE mikmod PROPERTY STRINGS internal external)
if(${mikmod} STREQUAL internal)
    target_compile_definitions(uqm_defines_common INTERFACE USE_INTERNAL_MIKMOD)
    set(USE_INTERNAL_MIKMOD 1)
elseif(${mikmod} STREQUAL external)
    message(FATAL_ERROR "TODO: tracker option 'external' not yet implemented")
else()
    message(FATAL_ERROR "Invalid tracker option: ${mikmod}")
endif()

set(joystick enabled CACHE STRING "Joystick support")
set_property(CACHE joystick PROPERTY STRINGS enabled disabled)

set(netplay none CACHE STRING "Network Supermelee support")

set_property(CACHE netplay PROPERTY STRINGS none full ipv4)
if(${netplay} STREQUAL none)
    # Do nothing
  elseif(${netplay} STREQUAL full)
    if(VITA)
      message("netplay is not supported on the vita")
    else()
      set(NETPLAY FULL)
      target_compile_definitions(uqm_defines_common INTERFACE NETPLAY=NETPLAY_FULL)
    endif()
    # TODO "netlibs" library? "ws2_32"?
elseif(${netplay} STREQUAL ipv4)
    set(NETPLAY IPV4)
    target_compile_definitions(uqm_defines_common INTERFACE NETPLAY=NETPLAY_IPV4)
else()
    message(FATAL_ERROR "Invalid netplay option: ${netplay}")
endif()

set(ioformat stdio_zip CACHE STRING "Supported file i/o methods")
set_property(CACHE ioformat PROPERTY STRINGS stdio stdio_zip)

set(accel asm CACHE STRING "Graphics/Sound optimizations")
set_property(CACHE ioformat PROPERTY STRINGS asm plainc)

set(threadlib sdl CACHE STRING "Thread library")
set_property(CACHE ioformat PROPERTY STRINGS sdl pthread)
set(threadlib sdl)
if(${threadlib} STREQUAL sdl)
    #find_package(SDL2 REQUIRED)
    target_link_libraries(uqm_lib_threadlib INTERFACE SDL2)
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

set(USE_ZIP_IO 1)

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
  set(MELEEDIR "~/.uqm/teams/")
  set(SAVEDIR "~/.uqm/save/")
elseif(VITA)
  add_library(uqm_vita_stub INTERFACE)
  target_link_libraries(uqm_vita_stub INTERFACE
    SceDisplay_stub
    SceCtrl_stub
    SceAudio_stub
    SceSysmodule_stub
    SceGxm_stub
    SceCommonDialog_stub
    SceAppMgr_stub
    SceTouch_stub
    SceHid_stub
    SceMotion_stub
    SceLibKernel_stub
    m
    )

  add_definitions(-DVITA -DVITA_DATA_DRIVE="ux0" -DHAVE_ZIP -DHAVE_JOYSTICK)
  set(CONTENTDIR "ux0:/data/uqm/content")
  set(USERDIR "ux0:/data/uqm/")
  set(MELEEDIR "ux0:/data/uqm/teams/")
  set(SAVEDIR "ux0:/data/uqm/save/")
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

check_symbol_exists(WIN32 "" MACRO_WIN32)
check_symbol_exists(__MINGW32__ "" MACRO___MINGW32__)
if (MACRO_WIN32)
    set(USE_WINSOCK 1)
endif()

configure_file(${PROJECT_SOURCE_DIR}/sc2/src/config_cmake.h.in
               ${PROJECT_BINARY_DIR}/sc2/src/config_cmake.h)
