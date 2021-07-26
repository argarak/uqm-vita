add_library(uqm_log uqmlog.c uqmlog.h msgbox.h loginternal.h)

# Add target-specific implementation
# TODO: Cygwin? Also test this on all platforms
if (${CMAKE_SYSTEM_NAME} EQUAL Windows)
    target_sources(uqm_log PRIVATE msgbox_win.c)
elseif(${CMAKE_SYSTEM_NAME} EQUAL Apple)
    target_sources(uqm_log PRIVATE msgbox_macosx.m)
else()
    target_sources(uqm_log PRIVATE msgbox_stub.c)
endif()

target_link_libraries(uqm_log PRIVATE uqm_options)
