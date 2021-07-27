add_library(regex regcomp.ci
                  regex_internal.ci regex_internal.h
                  regex.c regex.h
                  regexec.ci)
target_include_directories(regex PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(regex PRIVATE uqm_options)
