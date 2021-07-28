add_subdirectory(generate)

add_library(uqm_planets calc.c
                        cargo.c
                        devices.c
                        elemdata.h
                        generate.h
                        gentopo.c
                        lander.c lander.h
                        lifeform.h
                        orbits.c
                        oval.c
                        pl_stuff.c
                        plandata.h
                        planets.c planets.h
                        plangen.c
                        pstarmap.c
                        report.c
                        roster.c
                        scan.c scan.h
                        solarsys.c solarsys.h
                        sundata.h
                        surface.c
                        $<TARGET_OBJECTS:uqm_planets_generate>
                        )
target_link_libraries(uqm_planets OBJECT uqm_options)
