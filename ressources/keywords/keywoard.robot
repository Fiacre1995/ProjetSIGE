*** Settings ***
Library    String
Library    SeleniumLibrary
Library    JSONLibrary
Library    DateTime

*** Variables ***

*** Keywords ***
*** Keywords ***
Ouvrir L'application
    [Arguments]    ${url}    ${browser}    ${timeout}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --headless
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --no-sandbox
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --disable-gpu
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --window-size=1920,1080
    Run Keyword If    '${browser}' == 'chrome'    Call Method    ${options}    add_argument    --user-data-dir=/tmp/robot-${RANDOM}
    Run Keyword If    '${browser}' == 'chrome'    Create WebDriver    Chrome    options=${options}
    Run Keyword If    '${browser}' != 'chrome'    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Timeout    ${timeout}


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
