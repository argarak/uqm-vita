add_library(uqm_uio_zip zip.c zip.h)
target_link_libraries(uqm_uio_zip PRIVATE uqm_options uqm_uio)
