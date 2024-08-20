#Inicia la actividad y aprovisiona

*** Settings ***
Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Variables ***

${username}    tec0022
${password}    Oracle@123

${FILE_PATH}   AutomatizacionALTASVTR/ID_VTR.txt
${SCREENSHOT_DIR}    AutomatizacionALTASVTR/Evidencia_VTR\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
Visitar Siebel
    Open Browser    https://vtr4.test.etadirect.com/    browser=chrome    options=add_argument("--incognito --start-maximized")
    Login    
    End Activity
    

*** Keywords ***
Login
    Sleep    5s
    Input Text    xpath://*[@id="username"]    ${username}
    Input Password    xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    Sleep   10S
    Click Element    xpath://*[@id="delsession"]
    Sleep   5S
    Input Password     xpath://*[@id="password"]    ${password}
    Click Element    xpath://*[@id="sign-in"]
    
End Activity 
    Wait Until Element Is Visible     xpath://div[@class='activity-action' and @aria-describedby='cs-desc-end_activity']    30s
    Click Element    xpath://div[@class='activity-action' and @aria-describedby='cs-desc-end_activity']
    Sleep    7s        
    Click Element   xpath://button[@aria-owns='#list_index_4']        #CODIGO DE CIERRE
    Sleep    7s 
    Click Element   xpath://div[@role='option' and @aria-label='Finalización ok']
    Sleep    7s 
    Input Text   id:id_index_5    ok
    Sleep    7s 
    Click Element    xpath=//button[@class='button submit' and text()='Submit']
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura9.png
    #Run Process    python    AutomatizacionALTASVTR/Documentacion/insert.py 
    Pause Execution    Finalizar OK