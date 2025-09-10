*** Settings ***
Library    Browser
Variables    ../locators/order_overview_page.yaml

*** Keywords ***
Check if Order Overview Page Titel is correct
    Get Element    title total orders
    