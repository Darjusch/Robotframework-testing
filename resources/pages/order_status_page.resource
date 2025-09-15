*** Settings ***
Library            Browser
Library            Collections
Variables          ../locators/order_overview.yaml

*** Keywords ***
Get all order status texts
    [Documentation]    Get all status texts from all visible orders
    ${status_elements}=    Browser.Get Elements    css=.sapMObjStatusText
    ${status_texts}=    Create List
    
    FOR    ${element}    IN    @{status_elements}
        ${status_text}=    Browser.Get Text    ${element}
        Append To List    ${status_texts}    ${status_text}
    END
    
    RETURN    ${status_texts}

Get all order status elements
    [Documentation]    Get all status elements for CSS class verification
    ${status_elements}=    Browser.Get Elements    css=.sapMObjStatus
    RETURN    ${status_elements}

Get order status text by index
    [Documentation]    Get the status text for a specific order by index
    [Arguments]    ${order_index}
    ${status_texts}=    Get all order status texts
    ${status_text}=    Get From List    ${status_texts}    ${order_index-1}
    RETURN    ${status_text}

Get order status element classes by index
    [Documentation]    Get all CSS classes for the status element of a specific order by index
    [Arguments]    ${order_index}
    ${status_elements}=    Get all order status elements
    ${element}=    Get From List    ${status_elements}    ${order_index-1}
    ${element_classes}=    Browser.Get Attribute    ${element}    class
    RETURN    ${element_classes}

Verify status text matches color class
    [Documentation]    Verify that the status text matches the expected CSS color class
    [Arguments]    ${order_index}
    ${status_text}=    Get order status text by index    ${order_index}
    ${element_classes}=    Get order status element classes by index    ${order_index}
    
    # Determine expected class based on status text
    ${expected_class}=    Set Variable If
    ...    "${status_text}" == "In time"    ${STATUS_COLORS.IN_TIME}
    ...    "${status_text}" == "Urgent"     ${STATUS_COLORS.URGENT}
    ...    "${status_text}" == "Too late"   ${STATUS_COLORS.TOO_LATE}
    ...    ${EMPTY}
    
    Should Not Be Equal    ${expected_class}    ${EMPTY}    msg=Unknown status text: "${status_text}"
    Should Contain    ${element_classes}    ${expected_class}    msg=Status "${status_text}" should have class "${expected_class}" but found classes: "${element_classes}"

Verify all order statuses have correct colors
    [Documentation]    Verify that all visible orders have correct status-color mapping
    ${order_count}=    Browser.Get Element Count    ${list of orders} >> .sapMLIB
    
    FOR    ${index}    IN RANGE    1    ${order_count} + 1
        Verify status text matches color class    ${index}
        Log    Verified status-color mapping for order ${index}
    END

Get order count
    [Documentation]    Get the total number of orders displayed
    ${status_elements}=    Browser.Get Elements    css=.sapMObjStatusText
    ${order_count}=    Get Length    ${status_elements}
    RETURN    ${order_count}

Get all order statuses
    [Documentation]    Get all status texts from visible orders
    ${status_texts}=    Get all order status texts
    RETURN    ${status_texts}
