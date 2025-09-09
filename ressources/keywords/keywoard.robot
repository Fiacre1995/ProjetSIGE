*** Settings ***
Library    String
Library    SeleniumLibrary
Library    JSONLibrary
Library    DateTime
Library    Collections
Library    OperatingSystem

*** Variables ***
${SELENIUM_SPEED}          0.5s
${SELENIUM_TIMEOUT}        10s

*** Keywords ***
Ouvrir L'application
    [Arguments]    ${url}    ${browser}    ${timeout}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Timeout    ${timeout}

Ouvrir Navigateur Chrome Headless
    [Documentation]    Ouvre Chrome en mode headless avec les options optimisées pour CI
    [Arguments]    ${url}   ${browser}

    # Version ultra-simple
    Open Browser    ${url}    ${browser}
    ...    options=add_argument('--headless'); add_argument('--no-sandbox'); add_argument('--disable-dev-shm-usage'); add_argument('--disable-gpu'); add_argument('--window-size=1920,1080'); add_argument('--disable-extensions'); add_argument('--disable-plugins'); add_argument('--remote-debugging-port=9222')

    Set Selenium Speed    ${SELENIUM_SPEED}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}

Fermer Navigateur
    Run Keyword And Ignore Error    Close Browser

charger fichier json
    [Arguments]    ${fichier}
    ${data}=    Load Json From File    ${fichier}
    RETURN      ${data}

Vérifier L'URL
    [Arguments]    ${expected}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${expected}

Vérifier que l'URL contient un mot
    [Arguments]    ${expected}
    ${url}=    Get Location
    Should Contain    ${url}    ${expected}

Vérifier la présence d'un Texte
    [Arguments]    ${motRechercher}
    Wait Until Element Is Visible    ${motRechercher}
    Page Should Contain    ${motRechercher}

Cliquer sur un élément
    [Arguments]    ${bouton_menu}
    Wait Until Element Is Visible    ${bouton_menu}
    Click Element    ${bouton_menu}

Champ de liste déroulante
    [Arguments]    ${selector}   ${motSelectionner}
    Wait Until Element Is Visible    ${selector}
    Select From List By Label    ${selector}    ${motSelectionner}

Champ de chargement de fichier
    [Arguments]    ${selector}   ${fichierSelectionner}
    #Wait Until Element Is Visible    ${selector}
    Choose File    ${selector}    ${fichierSelectionner}

Champ de saisir
    [Arguments]    ${selector}   ${motSaisir}
    Wait Until Element Is Visible    ${selector}
    Input Text    ${selector}    ${motSaisir}

Générer Date actuelle
    Get Current Date    result_format=%d/%m/%Y
