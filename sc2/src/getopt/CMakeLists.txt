add_library(uqm_getopt getopt.c getopt.h getopt1.c)
target_link_libraries(uqm_getopt PRIVATE uqm_options)
