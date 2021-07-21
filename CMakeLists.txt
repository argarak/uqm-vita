cmake_minimum_required(VERSION 3.20.3)

project(uqm VERSION 0.8.0
            LANGUAGES C)

# Targets can "link" this "library" to inherit project options.
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE c_std_99) # Require _at least_ C99

add_subdirectory(sc2)
