add_library(uqm_threads thrcommon.c thrcommon.h)
target_link_libraries(uqm_threads PRIVATE uqm_options uqm_lib_threadlib)

if (THREADLIB STREQUAL SDL)
    add_subdirectory(sdl)
    target_link_libraries(uqm_threads PRIVATE uqm_sdlthreads)
elseif(THREADLIB STREQUAL PTHREAD)
    # TODO: this
    add_subdirectory(pthread)
    target_link_libraries(uqm_threads PRIVATE uqm_pthreads)
else()
    message(FATAL_ERROR "Invalid THREADLIB: ${THREADLIB}")
endif()
