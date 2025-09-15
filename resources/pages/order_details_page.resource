*** Settings ***
Library            Browser
Variables          ../locators/order_details_section.yaml

*** Keywords ***
Wait for order details to load
    Browser.Wait For Elements State    ${order details panel}    visible    timeout=10s

Verify order details are visible
    Browser.Wait For Elements State    ${order details title}                    visible    timeout=10s
    Browser.Wait For Elements State    ${order details general info}             visible    timeout=10s
    Browser.Wait For Elements State    ${order details shipping address panel}   visible    timeout=10s