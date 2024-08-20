*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Test Cases ***
Alta AltaPlay1CLARO
    Run Process    robot    AutomatizacionALTASCLARO/AltaPlayClaro/AltaPlay1CLARO.robot   #ALTA PLAY1 CLARO

Alta AltaPlay1CLARO ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay1CLARO APROVISIONAR ALTAPLAY1
    Run Process    robot    AutomatizacionALTASCLARO/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY1.robot    #APROVISIONAR ALTAPLAY1

Alta AltaPlay1CLARO DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD

Alta AltaPlay1CLARO COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorNiveles/CoordinadorNivelesALTA1.robot    #COMPLETA LOS NIVELES

Alta AltaPlay1CLARO FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay1CLARO PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividadFin/ActividadFin1PlayCLARO.robot        #PROCESO COMPLETO