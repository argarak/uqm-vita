add_library(uqm_uio_stdio stdio.c stdio.h)
target_link_libraries(uqm_uio_stdio PRIVATE uqm_options uqm_uio)
