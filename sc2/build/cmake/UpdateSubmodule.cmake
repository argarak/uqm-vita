# Initialize and update one specific git submodule.
# Adapted from https://cliutils.gitlab.io/modern-cmake/chapters/projects/submodule.html
function(update_submodule SUBMODULE_PATH)
    if(GIT_SUBMODULE)
        find_package(Git QUIET REQUIRED)
        message(STATUS "Updating submodule: ${SUBMODULE_PATH}")
        cmake_path(GET SUBMODULE_PATH PARENT_PATH SUBMODULE_PARENT_DIR)
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive -- ${SUBMODULE_PATH}
                        WORKING_DIRECTORY ${SUBMODULE_PARENT_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(WARNING "${SUBMODULE_PATH} update failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif()
    endif()
endfunction()
