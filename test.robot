*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem



*** Variables ***

${username}    skim
${password}    skim

${DOCSERIESIMCARD}    https://docs.google.com/spreadsheets/d/1SqXDq2AuOJeYSvpL50nxqlzBDsVZbSsQ-2_izOZPzoY/edit?pli=1&gid=234591020#gid=234591020
${SCREENSHOT_DIR}    Evidencia
${JS_FILE}    keypress.js
${JAR_FILE}    AutomatizacionAltaMovilVentaPresencialNoPortado/limpiaMaterialesHPBX PreQA.jar
${SOAPUI}    C:\Program Files\SmartBear\SoapUI-5.7.1\bin\SoapUI-5.7.2.exe

*** Test Cases ***
Capture and Insert Screenshot
    
    Insert Screenshot Into DOCX    
    
*** Keywords ***

Insert Screenshot Into DOCX
    
    [Documentation]    Inserta la captura de pantalla en el documento DOCX
    
        

    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    Chrome    options=add_argument("--start-maximized")
    
    Sleep    5s
    Input Text    name:SWEUserName    ${username}
    Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_s.py
    Pause Execution
    Press Keys    None    CONTROL+S+ENTER
    Input Password    name:SWEPassword    ${password}
    Sleep    5s
    Run Process    python    press_ctrl_s.py 

    

    Sleep    10s
    Pause Execution
    Execute JavaScript    window.open('${DOCSERIESIMCARD}');
    Pause Execution
    Press Keys    None    CTRL+s
    Sleep    10s
    Press Keys    None    CTRL+s

    Pause Execution    COPIAR SERIAL DISPONIBLE VERIFICAR COLUMNA C, MARCAR COMO OCUPADO COLUMNA D, FINALIZAR OK.
    Switch Window    MAIN   #DEVUELVE A LA PAGINA PRINCIPAL
    
    #Sleep    5s
    #Open Browser    ${DOCSERIESIMCARD}        Chrome    options=add_argument("--incognito --start-maximized")
    #Pause Execution    COPIAR SERIAL DISPONIBLE VERIFICAR COLUMNA C, MARCAR COMO OCUPADO COLUMNA D, FINALIZAR OK.
    Sleep    5s
    Run Process    java    -jar    ${JAR_FILE}
    #Sleep    10s
    #Click Element    xpath://*[@id="a_2"]/div/table/tbody/tr[16]/td[9]/div/input
    Pause Execution    PEGAR SERIAL, CLICK EN OK PARA CONTINUAR PROCESO.
    Sleep    5s
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    
    Pause Execution
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura1.png
    Open Browser    https://docs.google.com/spreadsheets/d/1SqXDq2AuOJeYSvpL50nxqlzBDsVZbSsQ-2_izOZPzoY/edit?pli=1&gid=234591020#gid=234591020        Chrome    options=add_argument("--start-maximized")
    Pause Execution    COPIAR SERIAL DISPONIBLE VERIFICAR COLUMNA C, MARCAR COMO OCUPADO COLUMNA D.
    Close Browser
    Run Process    java    -jar    ${JAR_FILE}
    Pause Execution
    Sleep    5S  
    Open Browser    http://www.google.com    Chrome    options=add_argument("--start-maximized")
    Sleep    5S
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura2.png  

    Sleep    5s
    Open Browser    https://vtr4.test.etadirect.com/    Chrome    options=add_argument("--start-maximized")
    Sleep    5S
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura3.png
    Run Process    python    Documentacion/insert.py    
    Sleep    10s
    
    


    