*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem



*** Variables ***  

${username}    skim
${password}    skim
${BUTTON_SELECTOR}    class:siebui-ctrl-btn.appletButton.siebui-icon-change.position.s_1_1_0_0 

${FILE_PATH}   AutomatizacionALTASCLARO/ID_CLARO.txt
${SCREENSHOT_DIR}    AutomatizacionALTASCLARO/Evidencia_CLARO\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
DetalleActividad

    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    browser=chrome    options=add_argument("--incognito --start-maximized")
    Login    
    Navigate To Main Page
    
    

*** Keywords ***
Login
    Sleep    5s
    Input Text    name:SWEUserName    ${username}
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    
Navigate To Main Page
    [Documentation]    Navega a la pagina principal del sistema.
    Sleep    15s
    Click Element    xpath://*[@id="6_s_1_l_Active_Position"]
    Wait Until Page Contains Element    ${BUTTON_SELECTOR}    timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_1_1_0_0_Ctrl"] 
    Sleep    10s
    Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]
    Sleep    15s
    Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]
    Sleep    22s
    Click Button    xpath://button[@class="siebui-ctrl-btn appletButton siebui-icon-newquery s_1_1_6_0"]
    Sleep    10s
    ${RutCliente}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    Log    ${RutCliente}    
    Sleep    5s
    Input Text    id:1_OCS_Rut     ${RutCliente}    
    Sleep    3s
    Press Keys    id:1_OCS_Rut    ENTER


    Sleep    10s
    Wait Until Element Is Visible    xpath=//a[@name="OCS Identificador de la cuenta"]    #RUT DEL CLIENTE
    Click Element    xpath=//a[@name="OCS Identificador de la cuenta"]

    Pause Execution
    #Wait Until Element Is Visible    xpath=//a[@name="Order Number"]    #NUMERO DE PEDIDO
    #Click Element    xpath=//a[@name="Order Number"]
    
    #Pause Execution
    Sleep    5s
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura10.png  
    
    