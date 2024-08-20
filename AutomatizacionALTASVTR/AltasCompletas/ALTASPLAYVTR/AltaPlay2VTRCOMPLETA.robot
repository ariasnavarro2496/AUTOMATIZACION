*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Test Cases ***
Alta AltaPlay2VTR
    Run Process    robot    AutomatizacionALTASVTR/AltaPlayVTR/AltaPlay2VTR.robot   #ALTA PLAY2

Alta AltaPlay2VTR ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay2VTR APROVISIONAR ALTAPLAY2
    Run Process    robot    AutomatizacionALTASVTR/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY2.robot    #APROVISIONAR ALTAPLAY1

Alta AltaPlay2VTR DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD

Alta AltaPlay2VTR COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorNiveles/CoordinadorNivelesALTA2.robot    #COMPLETA LOS NIVELES

Alta AltaPlay2VTR FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay2VTR PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividadFin/ActividadFin2PlayVTR.robot        #PROCESO COMPLETO