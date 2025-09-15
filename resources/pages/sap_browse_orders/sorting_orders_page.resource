*** Settings ***
Library            Browser
Variables          ../../locators/sap_browse_orders/order_overview.yaml
Variables          ../../locators/sap_browse_orders/searchbar.yaml
Variables          ../../locators/sap_browse_orders/sorting_orders.yaml

*** Keywords ***
Sort by customer name
    Browser.Click    ${sorting button}
    Browser.Wait For Elements State    ${group by customer option}    visible    timeout=10s
    Browser.Click    ${group by customer option}
    Browser.Wait For Elements State    ${ok button}    visible    timeout=10s
    Browser.Click    ${ok button}
    
Get sorted group titles
    [Documentation]    Returns array of group titles on the page based on sorting
    @{titles}=    Browser.Get Elements    ${sorted group titles}
    RETURN    @{titles}