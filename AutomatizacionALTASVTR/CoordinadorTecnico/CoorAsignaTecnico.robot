#PRIMERA SESION, ASIGNAR TECNICO A LA ACTIVIDAD POR MEDIO DEL 
COOORDINADOR 


*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem

*** Variables ***

${username}    Leandro.ward
${password}    Oracle2023.

${technical}    tec0022

${FILE_PATH}   AutomatizacionALTASVTR/ID_VTR.txt
${SCREENSHOT_DIR}    AutomatizacionALTASVTR/Evidencia_VTR\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel
    [Documentation]    Proceso estructurado
    Open Browser   https://vtr4.test.etadirect.com/    browser=chrome    options=add_argument("--incognito --start-maximized")
    Login    
    Assign technician
    

*** Keywords ***
Login
    [Documentation]  Inicio de sesion
    Sleep    5s
    Input Text    xpath://*[@id="username"]    ${username}
    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    Sleep    10S
    Click Element    xpath://*[@id="delsession"]
    Sleep    5S
    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    
Assign technician
    [Documentation]    Asignacion del tecnico
    Wait Until Element Is Visible    xpath://input[@class='search-bar-input icon global-search-bar-input-button']    30s
    Click Element    xpath://input[@class="search-bar-input icon global-search-bar-input-button"]
    Sleep    8s
    ${idActividad}         Get File    ${FILE_PATH}    #ASIGNA VALOR
    Log    ${idActividad}    
    Press Keys     xpath://input[@class="search-bar-input icon global-search-bar-input-button"]   ${idActividad}    #ID ACTIVIDAD 
    #Press Keys     css:input.search-bar-input        1-91KR7U8
    Sleep    5s
    Wait Until Element Is Visible    css:div.global-search-found-item div.activity-title
    Click Element    css:div.global-search-found-item div.activity-title
    Sleep    5s
    Wait Until Element Is Visible    css:button[data-ofsc-id='move_activity']
    Click Element    css:button[data-ofsc-id='move_activity']
    Sleep    8S
    Click Element    xpath://button[contains(text(),'Continuar')]
    Sleep    8S
    Click Element    css:div.oj-switch-thumb 
    Sleep    8S
    Input Text    css:input.oj-inputsearch-input[type='text']    ${technical}
    Sleep    10S
    Click Element     xpath://div[@class="resource-main-info"]
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura6.png
    Sleep    10S
    Click Element    xpath://button[contains(text(),'Mover')]
    Sleep    3s

    #Run Process    python    AutomatizacionALTASVTR/Documentacion/insert_VTR.py 
    #Sleep    3s
    #Remove Directory    ${SCREENSHOT_DIR}    recursive=True
    
    Pause Execution   Finalizar OK
