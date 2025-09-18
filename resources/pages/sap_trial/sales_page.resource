*** Settings ***
Library            Browser
Library            String
Variables          ../../locators/sap_trial/sales.yaml
Resource           ../../utils/browser_management.resource

*** Keywords ***
Enter Basic Sales Order Data
    Click    ${create sales order button}
    Fill Text    ${create order modal.sales_order_type_input}    Standard Order (OR)
    Fill Text    ${create order modal.sales_organisation_type_input}    1710
    Fill Text    ${create order modal.sales_distributon_channel_type_input}    10
    Fill Text    ${create order modal.sales_organisation_division_input}    00
    Press Keys    ${create order modal.sales_organisation_division_input}    Enter
    Click    ${create order modal.continue_button}

Specify The Customer
    Fill Text    ${new sales order.basic_data.sales_sold_to_party_input}    Silverstar Corp. (17100001)
    Fill Text    ${new sales order.basic_data.customer_reference_input}    Test123

Add Order Line Item
    Fill Text    ${new sales order.item_product.item_product_name}    TG11
    Fill Text    ${new sales order.item_product.item_product_requested_quantity}    1000

Create Sales Order
    Click    ${new sales order.create_button}

Verify Sales Order Notification
    ${success_modal}=    Get Element    ${new sales order.success_message_modal}
    ${modal_text}=       Get Text       ${success_modal}
    Log    ${modal_text}
    Should Contain    ${modal_text}    Standard Order
    Should Contain    ${modal_text}    has been saved.