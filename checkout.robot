*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          LoginKeywords.robot


*** Test Cases ***
verify blank name_field
    Login
    Checkout
    Input Text    //*[@id="last-name"]    Doe
    Input Text    //*[@id="postal-code"]    6100
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Sleep    2s
    Close Browser

verify blank postal_code field
    Login
    Checkout
    Input Text    //*[@id="first-name"]    John
    Input Text    //*[@id="last-name"]    Doe
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Sleep    2s
    Close Browser

verify blank fields
    Login
    Checkout
    Click Button    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Sleep    2s
    Close Browser

verify unvalid name
    Login
    Checkout
    ${long_name}=  Evaluate    "A" * 1000
    Input Text    //*[@id="first-name"]    ${long_name}
    Sleep    1s
    Input Text    //*[@id="last-name"]    Doe
    Input Text    //*[@id="postal-code"]    6100
    Click Button    //*[@id="continue"]
    Sleep    2s
    Close Browser

verify unvalid name with special characters
    Login
    Checkout
    Input Text    //*[@id="first-name"]    John@#$%
    Input Text    //*[@id="last-name"]    Doe
    Input Text    //*[@id="postal-code"]    6100
    Click Button    //*[@id="continue"]
    Sleep    2s
    Close Browser


verify name with numbers
    Login
    Checkout
    Input Text    //*[@id="first-name"]    5435435345345435345
    Input Text    //*[@id="last-name"]    Doe
    Input Text    //*[@id="postal-code"]    6100
    Click Button    //*[@id="continue"]
    Sleep    2s
    Close Browser

verify cancelling checkout
    Login
    Checkout
    Input Text    //*[@id="first-name"]    John
    Input Text    //*[@id="last-name"]    Doe
    Input Text    //*[@id="postal-code"]    6100
    Click Button    //*[@id="cancel"]
    Location Should Be     https://www.saucedemo.com/cart.html
    Sleep    2s
    Close Browser



*** Keywords ***
Checkout
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Link    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]