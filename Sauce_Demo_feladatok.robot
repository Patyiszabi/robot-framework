*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Add multiple items to cart
    Login
    Click items
    Sleep    2s
    Click Link     //*[@id="shopping_cart_container"]/a
    Check
    ${item_count} =    Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Numbers    ${item_count}    3
    Sleep    2s
    Close Browser


Remove item from cart
    Login
    Click items
    Sleep    2s
    Click Link     //*[@id="shopping_cart_container"]/a
    Check
    Sleep    2s
    Remove items
    ${item_count} =    Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Numbers    ${item_count}    0
    Sleep    2s
    Close Browser     


    
*** Keywords ***
Login
    OpenBrowser    https://www.saucedemo.com/    firefox
    Input Text     id=user-name    standard_user
    Input Password     //*[@id="password"]    secret_sauce
    Click Button     //*[@id="login-button"]
    Sleep    2s

Click items
    Click Button     //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]

Remove items
    Click Button     //*[@id="remove-sauce-labs-backpack"]
    Click Button    //*[@id="remove-sauce-labs-bike-light"]
    Click Button    //*[@id="remove-sauce-labs-bolt-t-shirt"]
    
Check
    Page Should Contain Element    //*[@id="cart_contents_container"]/div/div[1]/div[3]
    Page Should Contain Element    //*[@id="cart_contents_container"]/div/div[1]/div[4]
    Page Should Contain Element    //*[@id="cart_contents_container"]/div/div[1]/div[5]


