*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../resources/utils/browser_management.resource
Resource           ../resources/pages/order_overview_page.resource

*** Test Cases ***
Order List
    [Documentation]    Validate each order card has: OrderID, Customer Name, ShippedDate, OrderDate, Status
    [Tags]    smoke    order_list

    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

    Verify order cards exist
    Verify first N order cards have required fields    5

    Browser.Close Browser

*** Keywords ***
Verify order cards exist
    ${count}=    Browser.Get Element Count    ${order card}
    BuiltIn.Should Be True    ${count} > 0    msg=Expected at least 1 order card, found ${count}

Get order cards count
    ${count}=    Browser.Get Element Count    ${order card}
    RETURN    ${count}

Verify order card has required fields
    [Arguments]    ${card_locator}
    Browser.Wait For Elements State    ${card_locator}${/}${order card order id}        visible    timeout=10s
    Browser.Wait For Elements State    ${card_locator}${/}${order card customer name}   visible    timeout=10s
    Browser.Wait For Elements State    ${card_locator}${/}${order card shipped date}    visible    timeout=10s
    Browser.Wait For Elements State    ${card_locator}${/}${order card order date}      visible    timeout=10s
    Browser.Wait For Elements State    ${card_locator}${/}${order card status}          visible    timeout=10s

Verify first order card has required fields
    ${first_card}=    BuiltIn.Set Variable    ${order card}[1]
    Verify order card has required fields    ${first_card}

Verify first N order cards have required fields
    [Arguments]    ${n}=5
    ${total}=    Get order cards count
    ${limit}=    BuiltIn.Set Variable If    ${n} <= ${total}    ${n}    ${total}
    FOR    ${index}    IN RANGE    1    ${limit + 1}
        ${card}=    BuiltIn.Set Variable    ${order card}[${index}]
        Verify order card has required fields    ${card}
    END

Verify all order cards have required fields
    ${total}=    Get order cards count
    FOR    ${index}    IN RANGE    1    ${total + 1}
        ${card}=    BuiltIn.Set Variable    ${order card}[${index}]
        Verify order card has required fields    ${card}
    END