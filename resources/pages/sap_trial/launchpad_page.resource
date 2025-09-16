*** Settings ***
Library            Browser
Library            String
Variables          ../../locators/sap_trial/launchpad.yaml

*** Keywords ***
Open Space
    [Arguments]    ${space_name}
    ${loc}=    Format String    ${launchpad.space_tile_by_name_contains}    SPACE_NAME=${space_name}
    Click    ${loc}
    Close Help Tour If Visible

Close Help Tour If Visible
    ${found}=    Run Keyword And Return Status    Wait For Elements State    ${launchpad.leave_tour_button}    visible    3s
    IF    ${found}
        Click    ${launchpad.leave_tour_button}
        Log    "Help Tour closed"
    ELSE
        Log    "Help Tour not visible, continue"
    END