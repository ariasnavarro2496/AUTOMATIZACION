
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
${DOCSERIESIMCARD}    https://docs.google.com/spreadsheets/d/1SqXDq2AuOJeYSvpL50nxqlzBDsVZbSsQ-2_izOZPzoY/edit?pli=1&gid=234591020#gid=234591020
${JAR_FILE}    AutomatizacionAltaMovilVentaPresencialNoPortado/limpiaMaterialesHPBX PreQA.jar

${SCREENSHOT_DIR}    AutomatizacionAltaMovilVentaPresencialNoPortado/Evidencia_ALTAMOVIL
${WAIT_TIMEOUT}    45s  # Cambiar el tiempo de espera a 45 segundos



*** Test Cases ***
AltaMovil

    Open Browser    http://172.17.227.70:2080/ecommunications_VTR_esn/start.swe?SWECmd=Login&SWECM=S&SRN=&SWEHo=172.17.227.70    Chrome    options=add_argument("--start-maximized")

    Login    
    Navigate To Main Page
    Create New Account
    Fill Account Information
    Add Address
    Add Phone Number
    New Order Record
    Sales Modality
    Sales Orders - Examine Catalog
    Customize Promotion
    Simcard Series
    TSQ, Generate document and Send order
    Status

*** Keywords ***
Login
    [Documentation]    Realiza el login en el sistema con las credenciales proporcionadas.
    Sleep    5s
    Input Text    name:SWEUserName    ${username}
    Input Password    name:SWEPassword    ${password}
    Click Element    xpath://*[@id="s_swepi_22"]
    Run Process    python   AutomatizacionAltaMovilVentaPresencialNoPortado/Documentacion/AltaMovilPresencial.py

    
Navigate To Main Page
    [Documentation]    Navega a la pagina principal del sistema.
    Wait Until Page Contains Element    xpath://*[@id="5_s_1_l_Position"]    30s
    Click Element    xpath://*[@id="5_s_1_l_Position"]
    Wait Until Page Contains Element    ${BUTTON_SELECTOR}    timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_1_1_0_0_Ctrl"] 
    #Sleep    15s
    Sleep    20s
    Click Element    xpath://*[@id="s_sctrl_tabScreen"]/ul/li[2]
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[4]/div/div/div[1]/div[2]/ul/li[2]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_sctrl_tabView"]/ul/li[2]


Create New Account
    [Documentation]    Crea una nueva cuenta en el sistema.
    Wait Until Page Contains Element   xpath://*[@id="s_2_1_116_0_Ctrl"]   timeout=${WAIT_TIMEOUT}
    Click Element    xpath://*[@id="s_2_1_116_0_Ctrl"]
    Sleep    10s  #FALTA AUTOMATIZAR
    ${result}    Run Process    python   AutomatizacionAltaMovilVentaPresencialNoPortado/GeneradorRutAleatoreo/Generador.py
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
    Wait Until Element Is Visible    xpath://*[@id="1_s_7_l_Order_Number"]/a     timeout=45s    #CLICK NUMERO DE PEDIDO
    Click Element    xpath://*[@id="1_s_7_l_Order_Number"]/a


Sales Modality
    [Documentation]    Se modifica la modalidad de venta, metodo de envio y tipo de portado
    Sleep    15s
    Click Element    id=s_1_1_32_0_icon
    Sleep    10s
    Wait Until Element Is Visible    xpath://li[text()='Móvil']    10s
    Click Element    xpath://li[text()='Móvil']

Sales Orders - Examine Catalog
    [Documentation]    Examina el catalogo de ordenes de venta.
    Sleep    10s   #CLICK CATALOGO
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[2]/a  
    Sleep    10s   #CLICK TIPO DE CATALOGO
    Click Element       xpath://*[@id="s_1_1_0_0_icon"]
    Sleep    8s   #CLICK MOVIL
    Click Element       xpath://li[contains(text(),'Movil')]
    Sleep    8s   #CLICK RESIDENCIAL
    Click Element       xpath://*[@id="ti_1.7"]/i
    Sleep    10s   #CLICK NORMAL
    Click Element       xpath://*[@id="ti_1.7.1"]/i
    Sleep    8s   #CLICK POSPAGO
    Click Element       xpath://*[@id="ti_1.7.1.1"]/i
    Sleep    5s 
    Click Element       xpath://*[@id="ti_1.7.1.1.1"]/i
    Sleep    10s   #MULTIMEDIA 20GB
    Click Element       xpath://td[@title="Multimedia 20 GB 1118"] 
    Sleep    10s 
    Click Element    xpath://*[@id="a_6"]/div[2]/div[1]    #AGREGAR ITEM
    Sleep   30s
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[2]/div[2]/ul/li[3]/a   # DETALLES
    Sleep   20s
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura3.png
    
    
Customize Promotion
    [Documentation]    Se personaliza la promocion y agrega descuento.
    Sleep    10S 
    Click Element    xpath://*[@id="1_s_3_l_Action_Code"]/div
    Sleep    8S 
    Click Element    xpath://button[@id='s_3_1_31_0_Ctrl']    #PERSONALIZAR
    Sleep    30S 
    Click Element    xpath://a[text()='Descuentos']
    Sleep    10S 
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div[6]/div/div[2]/div/div/div[4]/div/div[2]/div[2]/input
    Input Text    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div[6]/div/div[2]/div/div/div[4]/div/div[2]/div[2]/input    1
    Sleep    10s  
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div[6]/div/div[2]/div/div/div[4]/div/div[2]/div[1]/select      
    Sleep    5s
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div[6]/div/div[2]/div/div/div[4]/div/div[2]/div[1]/select/option[2]    
    Sleep    8S     #DESCUENTO SIM ONLY 30%
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div[6]/div/div[2]/div/div/div[4]/div/div[2]/div[3]/button
    Sleep    8S    #TERMINADO
    Click Element    xpath:/html/body/div[1]/div/div[5]/div/div[7]/div/div[1]/div/div[3]/div/div/div/div/div[1]/div[1]/div[1]/div[2]/span[7]/span/button
    Sleep    15S 

Simcard Series
    [Documentation]    Se añade serial valido a SIMCARD.
    Wait Until Element Is Visible      xpath://*[@id="2_s_3_l_Action_Code"]/div/div  timeout=45s
    Click Element    xpath://*[@id="2_s_3_l_Action_Code"]/div
    Sleep    5s       
    Click Element    xpath://*[@id="7_s_3_l_Product"]
    Sleep    5s
    Execute JavaScript    window.open('${DOCSERIESIMCARD}');
    Pause Execution    COPIAR SERIAL DISPONIBLE VERIFICAR COLUMNA C, MARCAR COMO OCUPADO COLUMNA D, FINALIZAR OK.
    Switch Window    MAIN   #DEVUELVE A LA PAGINA PRINCIPAL   
    Sleep    5s
    Run Process    java    -jar    ${JAR_FILE}
    Sleep    5s
    #Click Element    xpath://*[@id="a_2"]/div/table/tbody/tr[16]/td[9]/div/input
    Pause Execution    PEGAR SERIAL, CLICK EN OK PARA CONTINUAR PROCESO.
    Sleep    5s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[10]/td[9]/div/input
    Sleep    5s
    Click Element     xpath://*[@id="a_1"]/div/table/tbody/tr[10]/td[9]/div/input
    Sleep    10s
    Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_alt_k.py
    Sleep    10s
    #Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_alt_k.py
    #Sleep    5s
    Pause Execution    CTRL+ALT+K, Limpiar numero de fila SOAP, continuar
    Sleep    5s
    Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_s.py
    Run Process    python    press_ctrl_s.py 
    Sleep    5s
    
    
TSQ, Generate document and Send order
    [Documentation]    Se envía a TSQ, Genera documento y se Envía pedido.
    Sleep   8s    
    Click Element     xpath://*[@id="s_1_1_11_0_Ctrl"]  #TSQ
    Pause Execution    Continuar para generar DOCUMENTO
    Click Element     xpath://*[@id="s_1_1_69_0_Ctrl"]    #GENERAR DOCUMENTO  
    Sleep    10s
    Switch Window    MAIN   #DEVUELVE A LA PAGINA PRINCIPAL
    Sleep    15s
    Pause Execution    Continuar para ENVIAR ORDEN
    Click Element    xpath://*[@id="s_1_1_79_0_Ctrl"]   #ENVIAR
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura4.png
    Pause Execution  Esperar cargue para continuar.
    Sleep    10s

Status
    [Documentation]    Estado de la orden
    Click Element    xpath://*[@id="s_1_1_136_0_icon"]
    Sleep    12s
    Click Element    xpath://li[contains(text(), 'Enviado')]    #ENVIADO
    Sleep    8s
    Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_s.py 
    Sleep    12s
    Click Element    xpath://*[@id="s_1_1_136_0_icon"]
    Sleep    12s    
    Click Element    xpath://li[contains(text(), 'Recibido')]    #RECIBIDO
    Sleep    8s
    Run Process    python    AutomatizacionAltaMovilVentaPresencialNoPortado/Comandos/press_ctrl_s.py 
    Pause Execution    Ctrl+S para Actualizar, Finalizar cuando orden quede en estado COMPLETADO
    #CAPTURE DE PANTALLA
    Capture Page Screenshot    ${SCREENSHOT_DIR}/captura5.png
    Sleep    5s
    
    


    
    
    

    
    
    
    