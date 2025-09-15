*** Settings ***
Library            Browser
Library            String
Library            Collections
Variables          ../../locators/sap_browse_orders/searchbar.yaml
Variables          ../../locators/sap_browse_orders/order_overview.yaml

*** Keywords ***
Enter search term
    [Documentation]    Enter a search term and execute the search
    [Arguments]    ${search_term}
    Browser.Fill Text    ${order searchbar input field}    ${search_term}
    Browser.Keyboard Key    press    Enter
    
    # Wait for search to execute and results to update
    Sleep    2s
    Browser.Wait For Elements State    ${list of orders}    visible    timeout=5s

Reset search
    [Documentation]    Reset the search to show all orders
    Browser.Click    ${reset searchbar button}
    Browser.Wait For Elements State    ${list of orders}    visible    timeout=5s

Get order count from title
    [Documentation]    Extract the number of orders from the page title
    ${title_text}=    Browser.Get Text    ${title total orders}
    Log    Title text: "${title_text}"
    
    # Extract number from "Orders (0)" format
    ${order_count}=    String.Get Regexp Matches    ${title_text}    \(([0-9]+)\)
    ${matches_count}=    Get Length    ${order_count}
    
    Should Be True    ${matches_count} > 0    msg=Could not extract order count from title: "${title_text}"
    ${order_count}=    Get From List    ${order_count}    0
    ${order_count}=    Convert To Integer    ${order_count}
    RETURN    ${order_count}

Get displayed order items count
    [Documentation]    Get the actual number of order items displayed in the list
    ${item_count}=    Browser.Get Element Count    ${list of orders} >> .sapMLIB
    RETURN    ${item_count}

Verify search results are correct
    [Documentation]    Verify that search results show correct counts in both title and list
    ${title_count}=    Get order count from title
    ${item_count}=    Get displayed order items count
    
    Log    Title count: ${title_count}, Item count: ${item_count}
    
    # Verify both counts are greater than 0
    Should Be True    ${title_count} > 0    msg=Title count should be greater than 0, but was ${title_count}
    Should Be True    ${item_count} > 0    msg=Item count should be greater than 0, but was ${item_count}
    
    # Verify both counts are equal
    Should Be Equal As Integers    ${title_count}    ${item_count}
    ...    msg=Title count (${title_count}) should equal item count (${item_count})
    
    RETURN    ${title_count}    ${item_count}

Verify no matching orders banner is present
    [Documentation]    Verify that the "no matching orders" banner is displayed
    Browser.Wait For Elements State    ${no_matching_orders_banner}    visible    timeout=5s

Verify matching orders are present
    [Documentation]    Verify that matching orders are present with correct counts
    ${title_count}    ${item_count}=    Verify search results are correct
    RETURN    ${title_count}    ${item_count}

Clear search
    [Documentation]    Clear the search field and execute empty search
    Browser.Fill Text    ${order searchbar input field}    ${EMPTY}
    Browser.Keyboard Key    press    Enter
    Sleep    2s

Get search input value
    [Documentation]    Get the current value in the search input field
    ${search_value}=    Browser.Get Text    ${order searchbar input field}
    RETURN    ${search_value}

Verify search input is empty
    [Documentation]    Verify that the search input field is empty
    ${search_value}=    Get search input value
    Should Be Equal    ${search_value}    ${EMPTY}    msg=Search input should be empty but contains: "${search_value}"


