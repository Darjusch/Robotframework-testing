# Test Cases

| #   | Test Case Description       | Steps                                                                                                                                          | Expected Result                                                        |
| --- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| 1   | **Initial Orders Load**     | 1. Wait for - Title, Searchbar, Filter, Sorting, Orderlist - to appear.                                                                        | The order list populates with mock data; UI shows order entries        |
| 2   | **Search by Customer Name** | 1. Type part of a customer name (e.g. "Alfreds") into the search field                                                                         | Only orders matching "Alfreds" are displayed                           |
| 3   | **Verify Status Color**     | 1. Open the order list<br>2. Check the color coding of the "Status" field (e.g., "Delivered" = green, "Processing" = orange, "Canceled" = red) | Each status has correct predefined color coding applied                |
| 4   | **Order Detail Display**    | 1. Click on a specific order row<br>2. Check the detail view or information pane                                                               | Correct order details (e.g., customer, status, shipped date) displayed |
| 5   | **Sorting by Order Date**   | 1. Click on the "Order Customer" column header<br>2. Check the displayed order sequence                                                        | Orders sorted by Customer name ascending;                              |
| 6   | **Order List**              | 1.Verify if the Orders have the correct fields.                                                                                                | OrderID, FN - LN, ShippedDate, OrderDate, Status                       |

## Swag Labs Login - End-to-End Test Flows

### Flow 1: Complete Happy Path Purchase Flow

**Objective**: Test the complete user journey from login to successful purchase and logout

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Login with valid credentials (standard_user)
3. Add 2-3 items to shopping cart
4. Navigate to shopping cart
5. Verify cart items and calculate total price (subtotal + tax)
6. Proceed to checkout
7. Fill shipping information with generated test data
8. Verify checkout overview (items, shipping, payment, total)
9. Complete purchase
10. Verify order confirmation message
11. Return to products page
12. Logout from application

**Expected Result**: Complete end-to-end flow executes successfully with accurate price calculations and proper data handling

---

### Flow 2: Data-Driven Purchase Flow with Multiple Users

**Objective**: Test complete purchase flow with different user types and generated shipping data

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Login with different user accounts (standard_user, problem_user, performance_glitch_user)
3. Add various items to cart
4. Navigate to shopping cart and verify items
5. Proceed to checkout
6. Fill shipping information with generated test data (names, addresses, postal codes)
7. Complete purchase process
8. Verify order confirmation
9. Logout

**Expected Result**: All user types can complete purchase successfully with generated shipping data

---

### Flow 3: Cart Management and Price Verification Flow

**Objective**: Test comprehensive cart operations with price calculations

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Login with valid credentials
3. Add multiple items to cart
4. Remove some items from cart
5. Navigate to shopping cart
6. Verify remaining items and prices
7. Calculate and verify total price (subtotal + tax)
8. Continue shopping and add more items
9. Return to cart and verify updated totals
10. Proceed to checkout with generated shipping data
11. Complete purchase
12. Logout

**Expected Result**: Cart operations work correctly with accurate price calculations throughout the flow

---

### Flow 4: Error Handling and Edge Cases Flow

**Objective**: Test error scenarios and edge cases in the complete flow

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Attempt login with invalid credentials (verify error message)
3. Login with locked user (verify error message)
4. Login with valid credentials
5. Add items to cart
6. Navigate to cart and verify items
7. Proceed to checkout
8. Test with empty shipping fields (verify validation)
9. Fill shipping information with generated data
10. Complete purchase
11. Verify order confirmation
12. Logout

**Expected Result**: Error handling works correctly and flow continues after resolving issues

---

### Flow 5: Security and Data Validation Flow

**Objective**: Test security measures and data validation throughout the complete flow

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Verify password field masking during login
3. Login with valid credentials
4. Add items to cart
5. Navigate to cart and verify items
6. Proceed to checkout
7. Test shipping form with special characters and edge cases
8. Fill shipping information with generated data (including special characters)
9. Verify data validation and sanitization
10. Complete purchase
11. Verify order confirmation
12. Logout

**Expected Result**: Security measures are in place and data validation works correctly with generated test data

---

### Flow 6: Performance and Persistence Flow

**Objective**: Test performance and data persistence throughout the complete flow

**Steps**:

1. Navigate to https://www.saucedemo.com/
2. Login with performance_glitch_user
3. Add items to cart
4. Navigate away from cart and return (verify persistence)
5. Navigate to cart and verify items remain
6. Proceed to checkout
7. Fill shipping information with generated data
8. Complete purchase
9. Verify order confirmation
10. Navigate back to products and verify cart is empty
11. Logout

**Expected Result**: Cart persistence works correctly and performance is acceptable throughout the flow
