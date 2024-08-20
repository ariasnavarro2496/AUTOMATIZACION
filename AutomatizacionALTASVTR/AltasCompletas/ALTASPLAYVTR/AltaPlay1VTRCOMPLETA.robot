

*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Test Cases ***
Alta AltaPlay1VTR
    Run Process  robot    AutomatizacionALTASVTR/AltaPlayVTR/AltaPlay1VTR.robot   #ALTA PLAY1

Alta AltaPlay1VTR ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay1VTR APROVISIONAR ALTAPLAY1
    Run Process    robot    AutomatizacionALTASVTR/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY1.robot    #APROVISIONAR ALTAPLAY1

Alta AltaPlay1VTR DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD

Alta AltaPlay1VTR COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorNiveles/CoordinadorNivelesALTA1.robot    #COMPLETA LOS NIVELES

Alta AltaPlay1VTR FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay1VTR PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividadFin/ActividadFin1PlayVTR.robot        #PROCESO COMPLETO








