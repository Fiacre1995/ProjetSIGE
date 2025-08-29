*** Settings ***
Resource   ../ressources/keywords/keywoard.robot

*** Variables ***
${lien_nationalité}     xpath=//*[@id="tabs"]/div[2]/span[6]
${bouton_ajouter_nationalité}       xpath=//*[@id="rightPane"]/div[1]/div[1]/div/a
${champ_nationalité}        id=usernationalities-nationality-id
${champ_privilégié}        id=usernationalities-preferred
${bouton_sauvegarder_nationalité}       name=submit
${champ_file_pièce_jointe}       xpath=//div[contains(@class,"btn-file")]//input[@type="file"]
${champ_nom}       id=attachments-name
${lien_pièce_jointe}     xpath=//*[@id="tabs"]/div[2]/span[9]
${bouton_ajouter_pièce_jointe}       xpath=//*[@id="rightPane"]/div[1]/div[1]/div/a
${champ_date}       id=attachments-date-on-file
${bouton_sauvegarder_pièce_jointe}       name=submit

*** Keywords ***

Cliquer sur lien nationalité
    Cliquer sur un élément    ${lien_nationalité}

Cliquer sur bouton ajouter nationalité
    Cliquer sur un élément    ${bouton_ajouter_nationalité}

Créer nationalité
    [Arguments]     ${champ_1}  ${champ_2}
    Champ de liste déroulante    ${champ_nationalité}    ${champ_1}
    Champ de liste déroulante    ${champ_privilégié}    ${champ_2}
    Cliquer sur un élément    ${bouton_ajouter_nationalité}

Cliquer sur lien pièces jointes
    Cliquer sur un élément    ${lien_pièce_jointe}

Cliquer sur bouton ajouter pièces jointe
    Cliquer sur un élément    ${bouton_ajouter_pièce_jointe}

Créer pièce jointes
    [Arguments]     ${champ_file}   ${champ_nom_data}
    Champ de chargement de fichier    ${champ_file_pièce_jointe}    ${champ_file}
    Champ de saisir    ${champ_nom}    ${champ_nom_data}
    ${DATE}    Get Current Date    result_format=%d-%m-%Y
    Champ de saisir    ${champ_date}    ${DATE}
    Cliquer sur un élément    ${bouton_ajouter_pièce_jointe}


