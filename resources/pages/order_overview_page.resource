*** Settings ***
Library    Browser
Variables    ../locators/order_overview_page.yaml

*** Keywords ***
Check Order Overview Page Title Is Correct
    ${el}=    Get Element    ${title_total_orders}
    ${txt}=   Get Text       ${el}
    # Accepts "Orders" or "Orders (10)"
    Should Match Regexp      ${txt}    ^Orders( \(\d+\))?$