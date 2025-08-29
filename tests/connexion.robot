*** Settings ***
Documentation     Suite de tests pour valider le cas passant et les cas non passant de la connexion

Resource    ${CURDIR}/../pages/loginPage.robot
Resource   ${CURDIR}/../ressources/variables/${ENV}.robot

Test Setup      Ouvrir L'application    ${BASE_URL}    ${BROWSER}    ${TIMEOUT}
Test Teardown       Fermer Navigateur

*** Variables ***
${Utilisateurs}      ${CURDIR}/../data/utilisateurs.json

*** Test Cases ***
Connexion valider
    [Tags]    demo_valide
    Verifier Url de la page login
    ${username}     ${password}=     Charger données valident    ${Utilisateurs}
    Connexion Utilisateur    ${username}    ${password}     ${TIMEOUT}

Nom Utilisateur Invalide
    [Tags]    username_invalide
    Verifier Url de la page login
    ${username}     ${password}=     Charger mot_de_passe_ivalide    ${Utilisateurs}
    Connexion Utilisateur    ${username}    ${password}     ${TIMEOUT}

Mot de passe Invalide
    [Tags]    password_invalide
    Verifier Url de la page login
    ${username}     ${password}=     Charger nom_utilisateur_invalide    ${Utilisateurs}
    Connexion Utilisateur    ${username}    ${password}     ${TIMEOUT}

Nom utilisateur et Mot de passe Invalident
    [Tags]    password_invalide
    Verifier Url de la page login
    ${username}     ${password}=     Charger nom_et_mot_de_passe_utilisateur_invalide    ${Utilisateurs}
    Connexion Utilisateur    ${username}    ${password}     ${TIMEOUT}

