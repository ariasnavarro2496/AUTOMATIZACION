*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Test Cases ***
Alta AltaPlay2CLARO
    Run Process    robot    AutomatizacionALTASCLARO/AltaPlayClaro/AltaPlay2CLARO.robot   #ALTA PLAY2 CLARO

Alta AltaPlay2CLARO ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay2CLARO APROVISIONAR ALTAPLAY2
    Run Process    robot    AutomatizacionALTASCLARO/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY2.robot    #APROVISIONAR ALTAPLAY2

Alta AltaPlay2CLARO DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD

Alta AltaPlay2CLARO COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorNiveles/CoordinadorNivelesALTA2.robot    #COMPLETA LOS NIVELES

Alta AltaPlay2CLARO FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay2CLARO PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividadFin/ActividadFin2PlayCLARO.robot        #PROCESO COMPLETO