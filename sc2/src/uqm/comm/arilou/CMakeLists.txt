add_library(uqm_comm_arilou arilouc.c resinst.h strings.h)
target_link_libraries(uqm_comm_arilou PRIVATE uqm_options)
