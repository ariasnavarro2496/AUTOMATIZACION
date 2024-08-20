

*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem



*** Test Cases ***
Alta AltaPlay3VTR
    Run Process    robot    AutomatizacionALTASVTR/AltaPlayVTR/AltaPlay3VTR.robot   #ALTA PLAY3

Alta AltaPlay3VTR ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay3VTR APROVISIONAR ALTAPLAY3
    Run Process    robot    AutomatizacionALTASVTR/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY3.robot    #APROVISIONAR ALTAPLAY3      

Alta AltaPlay3VTR DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD 

Alta AltaPlay3VTR COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASVTR/CoordinadorNiveles/CoordinadorNivelesALTA3.robot    #COMPLETA LOS NIVELES

Alta AltaPlay3VTR FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASVTR/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay3VTR PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASVTR/DetalleActividadFin/ActividadFin3PlayVTR.robot        #PROCESO COMPLETO            