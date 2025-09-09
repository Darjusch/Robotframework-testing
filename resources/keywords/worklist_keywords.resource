*** Settings ***
Resource    ../pages/worklist_page.resource

*** Keywords ***
# Worklist shows expected columns
#     [Arguments]    @{columns}
#     Ensure columns exist    @{columns}

# Worklist has at least N rows
#     [Arguments]    ${min}
#     ${count}=    Get Row Count
#     Should Be True    ${count} >= ${min}    Expected ≥ ${min}, got ${count}

Wait For Worklist Ready
    Wait For Worklist Ready

Verify Worklist Row
    [Arguments]    ${order_id}    ${customer}    ${status}    ${shipped_text}    ${secondary_date}
    # pass-through to the page keyword (same name here for simplicity)
    Verify Worklist Row    ${order_id}    ${customer}    ${status}    ${shipped_text}    ${secondary_date}