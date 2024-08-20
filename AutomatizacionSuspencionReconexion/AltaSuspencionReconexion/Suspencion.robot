*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem



*** Variables ***  

${RUTCLIENTE}    14645123-3



${username}    skim
${password}    skim
${BUTTON_SELECTOR}    class:siebui-ctrl-btn.appletButton.siebui-icon-change.position.s_1_1_0_0 
${SCREENSHOT_DIR}    AutomatizacionSuspencionReconexion/Evidencia_SUSPENCION\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Suspencion
    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    browser=chrome    options=add_argument("--incognito --start-maximized")
    Login    
    Navigate To Main Page
    
    

*** Keywords ***
Login
    [Documentation]    Inicio de sesion
    Sleep    5s
    Input Text    name:SWEUserName    ${username}
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    Run Process    python   AutomatizacionSuspencionReconexion/Documentacion/Suspencion.py
    
Navigate To Main Page
    [Documentation]    Navega a la pagina principal del sistema.
    Sleep    15s
    Click Element    xpath://*[@id="4_s_1_l_Active_Position"]
    Wait Until Page Contains Element    ${BUTTON_SELECTOR}    timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_1_1_0_0_Ctrl"] 
    Sleep    15s
    Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]
    Wait Until Element Is Visible    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]
    Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]
    Sleep    22s
    Click Button    xpath://button[@class="siebui-ctrl-btn appletButton siebui-icon-newquery s_1_1_6_0"]
    #Sleep    10s
    #${RutCliente}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    #Log    ${RutCliente}    
    Sleep    5s
    Input Text    id:1_OCS_Rut     ${RUTCLIENTE}    
    Sleep    3s
    Press Keys    id:1_OCS_Rut    ENTER
    Sleep    10s
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura1.png  
    Wait Until Element Is Visible    xpath=//a[@name="OCS Identificador de la cuenta"]    #RUT DEL CLIENTE
    Click Element    xpath=//a[@name="OCS Identificador de la cuenta"]
    #Wait Until Element Is Visible    xpath=//a[@name="Order Number"]    #NUMERO DE PEDIDO
    #Click Element    xpath=//a[@name="Order Number"]
    
    Pause Execution    SELECCIONAR PROMOCION EN PRODUCTOS INSTALADOS, CONTINUAR
    Sleep    5s
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura2.png  
    Click Element    xpath://*[@id="s_at_m_1"]
    Sleep    5s
    Click Element    xpath://li[a[text()='Suspender']]
    Pause Execution    CONTINUAR CUANDO CARGUE NUEVA VISTA
    Sleep    5S
    Click Element    id:1_s_3_l_OCS_Motivo
    Sleep    10S
    Input Text    name:OCS_Motivo  TEST
    Sleep    8s
    Click Element    id:1_s_3_l_OCS_Codigo_Cierre
    Sleep    8s
    Input Text    name:OCS_Codigo_Cierre    Solicitud ingresada
    Sleep    8s
    Click Element     id:1_s_3_l_Status
    Sleep    8s
    Click Element    xpath://*[@id="s_3_2_34_0_icon"]
    Sleep    8s
    Click Element    xpath=//li[text()='Finalizada']
    Sleep    8s
    Run Process    python    AutomatizacionSuspencionReconexion/Comandos/press_ctrl_s.py
    Sleep    5s
    Pause Execution    ESPERAR CARGUE VISTA DE DETALLES, ACTUALIZAR MANUALMENTE, CONTINUAR CUANDO EL ESTADO CAMBIE A COMPLETADA
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura3.png  
    Sleep    5s
    Go Back
    Sleep    5s
    Go Back
    Sleep    3s
    Pause Execution    SERVICIO DE SUSPENSION COMPLETADO
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura4.png  
    Sleep    2s
    Run Process    python    AutomatizacionSuspencionReconexion/InsertarCapture/Suspencion.py 
    Sleep    3s