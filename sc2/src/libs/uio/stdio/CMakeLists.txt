add_library(uqm_stdio stdio.c stdio.h)
target_link_libraries(uqm_stdio PRIVATE uqm_options uqm_uio)
