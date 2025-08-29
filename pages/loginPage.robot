*** Settings ***
Library    SeleniumLibrary
Resource   ../ressources/keywords/keywoard.robot

*** Variables ***
${champ_nomUtilisateur}   name=username
${champ_motDePasse}   name=password
${bouton_Login}     name=submit
${motConnexion}     Connexion
${Url_login}    https://openemis.preprod-sige.education.gouv.ci/
${Mot_url}      preprod-sige

*** Keywords ***

Champ NomUtilisateur
    [Arguments]    ${username}
    Input Text    ${champ_nomUtilisateur}    ${username}

Champ MotDePasse
    [Arguments]    ${password}
    Input Text    ${champ_motDePasse}    ${password}

Bouton Connexion
    Click Button    ${bouton_Login}

Connexion Utilisateur
    [Arguments]    ${username}    ${password}   ${timeout}
    Champ NomUtilisateur    ${username}
    Champ MotDePasse    ${password}
    Bouton Connexion
    Set Selenium Timeout    ${timeout}

Chercher mot connexion
    Vérifier la présence d'un Texte     ${motConnexion}

Verifier Url de la page login
    Vérifier L'URL    ${Url_login}

Vérifier que l'Url login contient Preprop-sige
    Vérifier que l'URL contient un mot    ${Mot_url}
    
Vérifier erreur
    Page Should Contain    Maman

Charger données valident
    [Arguments]    ${fichierJson}
    ${data}=    charger fichier json    ${fichierJson}
    ${nomUtilisateur}=    Get Value From Json    ${data}    $.utilisateur_valide.username
    ${motDePasse}=    Get Value From Json    ${data}    $.utilisateur_valide.password
    ${nomUtilisateur}=    Set Variable    ${nomUtilisateur[0]}
    ${motDePasse}=      Set Variable    ${motDePasse[0]}
    RETURN    ${nomUtilisateur}    ${motDePasse}

Charger mot_de_passe_ivalide
    [Arguments]    ${fichierJson}
    ${data}=    charger fichier json    ${fichierJson}
    ${nomUtilisateur}=    Get Value From Json    ${data}    $.mot_de_passe_invalide.username
    ${motDePasse}=    Get Value From Json    ${data}    $.mot_de_passe_invalide.password
    ${nomUtilisateur}=    Set Variable    ${nomUtilisateur[0]}
    ${motDePasse}=      Set Variable    ${motDePasse[0]}
    RETURN    ${nomUtilisateur}    ${motDePasse}

Charger nom_utilisateur_invalide
    [Arguments]    ${fichierJson}
    ${data}=    charger fichier json    ${fichierJson}
    ${nomUtilisateur}=    Get Value From Json    ${data}    $.nom_utilisateur_invalide.username
    ${motDePasse}=    Get Value From Json    ${data}    $.nom_utilisateur_invalide.password
    ${nomUtilisateur}=    Set Variable    ${nomUtilisateur[0]}
    ${motDePasse}=      Set Variable    ${motDePasse[0]}
    RETURN    ${nomUtilisateur}    ${motDePasse}

Charger nom_et_mot_de_passe_utilisateur_invalide
    [Arguments]    ${fichierJson}
    ${data}=    charger fichier json    ${fichierJson}
    ${nomUtilisateur}=    Get Value From Json    ${data}    $.nom_utilisateur_et_mot_de_passe_invalide.username
    ${motDePasse}=    Get Value From Json    ${data}    $.nom_utilisateur_et_mot_de_passe_invalide.password
    ${nomUtilisateur}=    Set Variable    ${nomUtilisateur[0]}
    ${motDePasse}=      Set Variable    ${motDePasse[0]}
    RETURN    ${nomUtilisateur}    ${motDePasse}