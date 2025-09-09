*** Settings ***
Documentation     Rajouté la nationalité de l'utilisateur

Resource    ${CURDIR}/../../pages/profil_utilisateur.robot
Resource    ${CURDIR}/../../pages/loginPage.robot
Resource    ${CURDIR}/../../pages/dashboard.robot
Resource   ${CURDIR}/../../ressources/variables/${ENV}.robot
Resource   ${CURDIR}/../../ressources/variables/nationnalité_variable.robot

Test Setup      Ouvrir Navigateur Chrome Headless    ${BASE_URL}    ${BROWSER}
Test Teardown       Fermer Navigateur

*** Variables ***
${Utilisateurs}      ${CURDIR}/../../data/utilisateurs.json
${fichier1}          C:/Users/afiac/PycharmProjects/ProjetSIGE/data/utilisateurs.json

*** Test Cases ***
Nationalité valider
    [Tags]    ajouté_pièces_jointes
    Verifier Url de la page login
    ${data}=    charger fichier json    ${Utilisateurs}
    ${nomUtilisateurValide}=    Get Value From Json    ${data}    $.utilisateur_valide.username
    ${motDePasseValide}=    Get Value From Json    ${data}    $.utilisateur_valide.password
    ${nomUtilisateurValide}=    Set Variable    ${nomUtilisateurValide[0]}
    ${motDePasseValide}=      Set Variable    ${motDePasseValide[0]}
    Connexion Utilisateur    ${nomUtilisateurValide}    ${motDePasseValide}     ${TIMEOUT}
    Cliquer sur lien profil utilisateur
    Cliquer sur lien pièces jointes
    Cliquer sur bouton ajouter pièces jointe
    Créer pièce jointes    ${fichier1}      ${NOM}
    Sleep    5S