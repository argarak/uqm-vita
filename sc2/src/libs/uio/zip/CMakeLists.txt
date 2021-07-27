add_library(uqm_zip zip.c zip.h)
target_link_libraries(uqm_zip PRIVATE uqm_options uqm_uio)
