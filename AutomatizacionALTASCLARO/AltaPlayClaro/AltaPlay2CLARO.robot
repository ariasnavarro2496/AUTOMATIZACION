*** Settings ***

Library  SeleniumLibrary
Library    Dialogs
Library    Process
Library    OperatingSystem


*** Variables ***

${username}    skim
${password}    skim
${nombre}    JAIRO
${apellido}    ARIAS
${direccion}    VARAS MENA
${email}    LEONARDO@GMAIL.COM
${BUTTON_SELECTOR}    class:siebui-ctrl-btn.appletButton.siebui-icon-change.position.s_1_1_0_0
${BUTTON_CLIENTESPRIMERNIVEL}   

${FILE_PATH}   AutomatizacionALTASCLARO/ID_CLARO.txt
${SCREENSHOT_DIR}    AutomatizacionALTASCLARO/Evidencia_CLARO\screenshots
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
AltaPlay2CLARO

    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    Chrome    options=add_argument("--start-maximized")

    Login    
    Navigate To Main Page
    Create New Account
    Fill Account Information
    Add Address
    Add Phone Number
    New Order Record
    Sales Orders - Examine Catalog
    TSQ, Generate document and Send order
    Copy and save to txt file
    
    

*** Keywords ***
Login
    [Documentation]    Realiza el login en el sistema con las credenciales proporcionadas.
    Sleep    5s
    Input Text    name:SWEUserName    ${username}
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    Run Process    python   AutomatizacionALTASCLARO/Documentacion/Alta2PlayDoc.py


Navigate To Main Page
    [Documentation]    Navega a la pagina principal del sistema.
    Wait Until Page Contains Element    xpath://*[@id="6_s_1_l_Position"]    40s
    Click Element    xpath://*[@id="6_s_1_l_Active_Position"]
    Wait Until Page Contains Element    ${BUTTON_SELECTOR}    timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_1_1_0_0_Ctrl"] 
    Sleep    10s
    Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]
    Wait Until Page Contains Element   xpath:/html/body/div[1]/div/div[4]/div/div/div[1]/div[2]/ul/li[2]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]

Create New Account
    [Documentation]    Crea una nueva cuenta en el sistema.
    Wait Until Page Contains Element   xpath://*[@id="s_2_1_116_0_Ctrl"]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_2_1_116_0_Ctrl"]
    Sleep    10s  #FALTA AUTOMATIZAR
    ${result}    Run Process    python   AutomatizacionALTASCLARO/GeneradorRutAleatoreo/Generador.py
    Input Text     xpath://*[@id="a_2"]/div/table/tbody/tr[3]/td[3]/div/input   ${result.stdout}
    Sleep    5s

Fill Account Information
    [Documentation]    Llena la informacion de la cuenta con los datos proporcionados.
    Click Element   xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input 
	Sleep    5s
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[4]/td[3]/div/input    ${nombre}
    Sleep    3s
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[3]/div/input    ${apellido}
    Input Text    xpath://*[@id="a_2"]/div/table/tbody/tr[5]/td[5]/div/input    ${email}
    Click Element    xpath://*[@id="s_2_1_124_0_icon"]

Add Address
    [Documentation]    Agrega la direccion a la cuenta.
    Wait Until Element Is Visible    xpath://*[@id="sieb-ui-popup-mvg-available"]/form/table/tbody/tr[1]/td[2]/span[4]/input    timeout=${WAIT_TIMEOUT}
    Input Text    xpath://*[@id="sieb-ui-popup-mvg-available"]/form/table/tbody/tr[1]/td[2]/span[4]/input    ${direccion}
    #
    Click Element    xpath://*[@id="s_4_1_188_0_Ctrl"]     #CLICK BUSCAR
    Click Element    xpath://*[@id="last_pager_s_4_l"]/span    #SIGUIENTE
    Sleep    7S
    Click Element    xpath://*[@id="1_s_4_l_Street_Address"]    #SELECCIONO DIRECCION
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura1.png
    Click Element    xpath://*[@id="s_3_1_185_0_Ctrl"]
    Sleep    10s
    Click Element    xpath://*[@id="s_3_1_189_0_Ctrl"]
    Sleep     10s

Add Phone Number
    [Documentation]    Agrega numero de telefono a la cuenta.
    Click Element    xpath://*[@id="s_2_1_25_0_icon"]
    Sleep    3s
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/table/tbody/tr/td[1]/span[2]/button  timeout=${WAIT_TIMEOUT}
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/table/tbody/tr/td[1]/span[2]/button
    Sleep    3s
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[3]/span
    Sleep    3s
    Click Element    xpath:/html/body/div[8]/ul[2]/li[2]
    Sleep    3s
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]  
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]/input           timeout=${WAIT_TIMEOUT}
    Input Text      xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[3]/div/table/tbody/tr[2]/td[4]/input   999555888
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[2]/span/button    timeout=${WAIT_TIMEOUT}
    Click Element    xpath:/html/body/div[8]/div[2]/div/div/div/form/div/div[2]/span/button
    Sleep    5s 
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura2.png
    Click Element    xpath://*[@id="s_2_1_119_0_Ctrl"]

New Order Record
    [Documentation]    Crea un nuevo registro de pedido en el sistema.
    Wait Until Element Is Visible    xpath://*[@id="1_s_1_l_OCS_Identificador_de_la_cuenta"]/a     timeout=60s
    Click Element    xpath://*[@id="1_s_1_l_OCS_Identificador_de_la_cuenta"]/a
    Wait Until Element Is Visible    xpath://*[@id="s_at_m_7"]     timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_at_m_7"]
    Sleep    5S
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div[3]/div[2]/div/form/span/div/div[1]/div[2]/span[1]/span/ul/li[4]/a
    Sleep    5S
    Reload Page
    Sleep    5S
    Wait Until Element Is Visible    xpath://*[@id="1_s_10_l_Order_Number"]/a     timeout=45s    #CLICK NUMERO DE PEDIDO
    Click Element    xpath://*[@id="1_s_10_l_Order_Number"]/a 

Sales Orders - Examine Catalog
    [Documentation]    Examina el catalogo de ordenes de venta.
    Sleep    10s   #CLICK CATALOGO
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[2]/a  
    Sleep    10s   #CLICK TIPO DE CATALOGO
    Click Element       xpath://*[@id="s_1_1_0_0_icon"]
    Sleep    10s            #FIJO CLARO
    Click Element       xpath:/html/body/div[1]/div/div[5]/div/div[7]/ul[1]/li[3]

    Sleep    10s     #PROMO 2PLAY HFC
    Click Element       xpath://*[@id="ti_1.4_anchor"]

    Sleep    10S   #PROMO HFC 120MB CLARO
    Click Element       xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div[2]/div[3]/div/div/div/form/span/div/div[3]/div/div/div[3]/div[3]/div/table/tbody/tr[4]/td[3]
    Sleep    15S  #AGREGAR ITEM
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura3.png
    Click Element    xpath://*[@id="a_6"]/div[2]/div[1]    #AGREGAR ITEM
    Sleep   33s

TSQ, Generate document and Send order
    [Documentation]    Se envía a TSQ, Genera documento y se Envía pedido.
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[3]/a   # DETALLES
    Sleep   25s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[12]/td[6]/div/input    # DEUDA NO VINCULANTE
    Sleep   10s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[14]/td[4]/div/input    # Pago Upfront Primera Boleta
    Sleep   5s
    Click Element     xpath://*[@id="s_1_1_11_0_Ctrl"]  #TSQ
    Sleep   30s
    Click Element     xpath://*[@id="s_1_1_69_0_Ctrl"]    #GENERAR DOCUMENTO  
    Sleep    10s
    Switch Window    MAIN   #DEVUELVE A LA PAGINA PRINCIPAL
    Sleep    6s
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura4.png
    Pause Execution 
    Wait Until Element Is Visible      xpath://*[@id="s_1_1_37_0_icon"]   timeout=40s
    Click Element    xpath://*[@id="s_1_1_37_0_icon"]
    Sleep    10s
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/ul[3]/li[2]   #VISITA TECNICA 
    Sleep    10s
    Click Element    xpath://*[@id="s_1_1_79_0_Ctrl"]   #ENVIAR
    Pause Execution    
    Sleep    5s   
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura5.png
    
Copy and save to txt file
    [Documentation]    Copia el id de la actividad y lo guarda en un archivo de texto.
    ${idActividad}    Get Value     xpath://*[@id="a_2"]/div/table/tbody/tr[3]/td[3]/div/input    #COPIA IDACTIVIDAD
    Log    ${idActividad}
    # GUARDA EN ARCHIVO id_actividad.txt
    Create File    ${FILE_PATH}    ${idActividad}
    Sleep    10s