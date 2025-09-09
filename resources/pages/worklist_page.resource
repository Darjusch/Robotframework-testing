*** Settings ***
Library    Browser
Variables  ../../config/dev.yaml

*** Variables ***
${LIST}         css=ul[id*="--list-listUl"]
${LIST_ITEMS}   css=.sapMLIB

*** Keywords ***
Wait For Worklist Ready
    Wait For Elements State    ${LIST}    visible    ${DEFAULT_TIMEOUT}
    Wait For Elements State    ${LIST} >> ${LIST_ITEMS}    visible    ${DEFAULT_TIMEOUT}