*** Settings ***
Library    SeleniumLibrary
Resource   ../ressources/keywords/keywoard.robot

*** Variables ***

${motPageAccueil}     Page d'accueil
${Url_dashboard}    https://openemis.preprod-sige.education.gouv.ci/Dashboard
${Mot_url_dashboard}      Dashboard
${bouton_menu}      xpath=/html/body/header/nav/div[2]/div/div[5]/button
${bouton_deconnexion}      xpath=//a[span[text()=" Déconnexion"]]
${bouton_deconnexion_sso}      xpath=/html/body/header/nav/div[2]/div/div[5]/ul/div[2]/li[6]/a
${lien_profil_utilisateur}      xpath=//*[@id="nav-menu-1"]/li[1]
*** Keywords ***

Chercher mot Dashboard
    Vérifier la présence d'un Texte     ${motPageAccueil}

Verifier Url de la page Dashboard
    Vérifier L'URL    ${Url_dashboard}

Vérifier que l'Url login contient Dashboard
    Vérifier que l'URL contient un mot    ${Mot_url_dashboard}

Cliquer sur Bouton Menu
    Cliquer sur un élément    ${bouton_menu}

Cliquer sur Bouton Deconnexion
    Wait Until Element Is Visible    ${bouton_deconnexion}    10s
    Click Element    ${bouton_deconnexion}

Cliquer sur Bouton Deconnexion SSO
    Wait Until Element Is Visible    ${bouton_deconnexion_sso}    10s
    Click Element    ${bouton_deconnexion}

Cliquer sur lien profil utilisateur
    Cliquer sur un élément    ${lien_profil_utilisateur}