*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Test Cases ***
Alta AltaPlay3CLARO
    Run Process    robot    AutomatizacionALTASCLARO/AltaPlayClaro/AltaPlay3CLARO.robot   #ALTA PLAY3 CLARO

Alta AltaPlay3CLARO ASIGNACION TECNICO
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorTecnico/CoorAsignaTecnico.robot   #ASIGNACION TECNICO

Alta AltaPlay3CLARO APROVISIONAR ALTAPLAY3
    Run Process    robot    AutomatizacionALTASCLARO/AprovisionarMateriales/TecnicoAprovisionaALTAPLAY3.robot    #APROVISIONAR ALTAPLAY3

Alta AltaPlay3CLARO DETALLE DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividad/DetalleActividad.robot        #DETALLE DE LA ACTIVIDAD

Alta AltaPlay3CLARO COMPLETA LOS NIVELES
    Run Process    robot    AutomatizacionALTASCLARO/CoordinadorNiveles/CoordinadorNivelesALTA3.robot    #COMPLETA LOS NIVELES

Alta AltaPlay3CLARO FIN DE LA ACTIVIDAD
    Run Process    robot    AutomatizacionALTASCLARO/Tecnico/TecnicoFin.robot        #FIN DE LA ACTIVIDAD

Alta AltaPlay3CLARO PROCESO COMPLETO
    Run Process    robot    AutomatizacionALTASCLARO/DetalleActividadFin/ActividadFin3PlayCLARO.robot        #PROCESO COMPLETO