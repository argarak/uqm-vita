add_subdirectory(comm)
add_subdirectory(planets)
add_subdirectory(ships)
add_subdirectory(supermelee)

add_library(uqm_game battle.c battle.h
                     battlecontrols.c battlecontrols.h
                     border.c
                     build.c build.h
                     cleanup.c
                     clock.c clock.h
                     cnctdlg.c cnctdlg.h
                     coderes.h
                     collide.c collide.h
                     colors.h
                     comm.c comm.h
                     commanim.c commanim.h
                     commglue.c commglue.h
                     confirm.c
                     cons_res.c cons_res.h
                     controls.h
                     corecode.h
                     credits.c credits.h
                     cyborg.c
                     demo.c demo.h
                     displist.c displist.h
                     dummy.c dummy.h
                     element.h
                     encount.c encount.h
                     flash.c flash.h
                     fmv.c fmv.h
                     galaxy.c
                     gameev.c gameev.h
                     gameinp.c
                     gameopt.c gameopt.h
                     gamestr.h
                     gendef.c gendef.h
                     getchar.c
                     globdata.c globdata.h
                     gravity.c
                     grpinfo.c grpinfo.h
                     grpintrn.h
                     hyper.c hyper.h
                     ifontres.h
                     igfxres.h
                     ikey_con.h
                     imusicre.h
                     init.c init.h
                     intel.c intel.h
                     intro.c
                     ipdisp.c ipdisp.h
                     isndres.h
                     istrtab.h
                     load_legacy.c
                     load.c
                     loadship.c
                     master.c master.h
                     menu.c
                     menustat.h
                     misc.c
                     nameref.h
                     oscill.c oscill.h
                     outfit.c
                     pickship.c pickship.h
                     plandata.c
                     process.c process.h
                     races.h
                     resinst.h
                     restart.c restart.h
                     save.c save.h
                     settings.c settings.h
                     setup.c setup.h
                     setupmenu.c setupmenu.h
                     ship.c ship.h
                     shipcont.h
                     shipstat.c
                     shipyard.c
                     sis.c sis.h
                     sounds.c sounds.h
                     starbase.c starbase.h
                     starcon.c starcon.h
                     starmap.c starmap.h
                     state.c state.h
                     status.c status.h
                     tactrans.c tactrans.h
                     trans.c
                     units.h
                     uqmdebug.c uqmdebug.h
                     util.c util.h
                     velocity.c velocity.h
                     weapon.c weapon.h
                     $<TARGET_OBJECTS:uqm_planets>
                     $<TARGET_OBJECTS:uqm_planets_generate>
                     )

target_link_libraries(uqm_game PRIVATE uqm_options
                                       uqm_comm
                                       uqm_ships
                                       uqm_supermelee)
