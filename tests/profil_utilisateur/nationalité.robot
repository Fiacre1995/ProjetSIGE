*** Settings ***
Documentation     Rajouté la nationalité de l'utilisateur

Resource    ${CURDIR}/../../pages/profil_utilisateur.robot
Resource    ${CURDIR}/../../pages/loginPage.robot
Resource    ${CURDIR}/../../pages/dashboard.robot
Resource   ${CURDIR}/../../ressources/variables/${ENV}.robot
Resource   ${CURDIR}/../../ressources/variables/nationnalité_variable.robot

Test Setup      Ouvrir L'application    ${BASE_URL}    ${BROWSER}    ${TIMEOUT}
Test Teardown       Fermer Navigateur

*** Variables ***
${Utilisateurs}      ${CURDIR}/../../data/utilisateurs.json

*** Test Cases ***
Nationalité valider
    [Tags]    nationalité_valider
    Verifier Url de la page login
    ${data}=    charger fichier json    ${Utilisateurs}
    ${nomUtilisateurValide}=    Get Value From Json    ${data}    $.utilisateur_valide.username
    ${motDePasseValide}=    Get Value From Json    ${data}    $.utilisateur_valide.password
    ${nomUtilisateurValide}=    Set Variable    ${nomUtilisateurValide[0]}
    ${motDePasseValide}=      Set Variable    ${motDePasseValide[0]}
    Connexion Utilisateur    ${nomUtilisateurValide}    ${motDePasseValide}     ${TIMEOUT}
    Cliquer sur lien profil utilisateur
    Cliquer sur lien nationalité
    Cliquer sur bouton ajouter nationalité
    Créer nationalité    ${NATIONALITE}[1]    ${PRIVILEGIE}[1]
    Cliquer sur bouton ajouter nationalité