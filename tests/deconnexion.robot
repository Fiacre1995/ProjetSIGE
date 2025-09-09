*** Settings ***

Resource    ../pages/loginPage.robot
Resource    ../pages/dashboard.robot
Resource   ../ressources/variables/${ENV}.robot

Test Setup      Ouvrir Navigateur Chrome Headless    ${BASE_URL}    ${BROWSER}
Test Teardown       Fermer Navigateur

*** Variables ***
${Utilisateurs}      ${CURDIR}/../data/utilisateurs.json

*** Test Cases ***
Deconnexion normale
    [Tags]    demo_valide
    Verifier Url de la page login
    ${data}=    charger fichier json    ${Utilisateurs}
    ${nomUtilisateurValide}=    Get Value From Json    ${data}    $.utilisateur_valide.username
    ${motDePasseValide}=    Get Value From Json    ${data}    $.utilisateur_valide.password
    ${nomUtilisateurValide}=    Set Variable    ${nomUtilisateurValide[0]}
    ${motDePasseValide}=      Set Variable    ${motDePasseValide[0]}
    Connexion Utilisateur    ${nomUtilisateurValide}    ${motDePasseValide}     ${TIMEOUT}
    Vérifier que l'Url login contient Dashboard
    Cliquer sur Bouton Menu
    Cliquer sur Bouton Deconnexion

Deconnexion SSO
    [Tags]    deconnexion_sso
    Verifier Url de la page login
    ${data}=    charger fichier json    ${Utilisateurs}
    ${nomUtilisateurValide}=    Get Value From Json    ${data}    $.utilisateur_valide.username
    ${motDePasseValide}=    Get Value From Json    ${data}    $.utilisateur_valide.password
    ${nomUtilisateurValide}=    Set Variable    ${nomUtilisateurValide[0]}
    ${motDePasseValide}=      Set Variable    ${motDePasseValide[0]}
    Connexion Utilisateur    ${nomUtilisateurValide}    ${motDePasseValide}     ${TIMEOUT}
    Vérifier que l'Url login contient Dashboard
    Cliquer sur Bouton Menu
    Cliquer sur Bouton Deconnexion SSO
    Sleep    3S
