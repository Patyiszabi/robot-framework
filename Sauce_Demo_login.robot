*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login Test
    OpenBrowser    https://www.saucedemo.com/    firefox
    Input Text     id=user-name    standard_user
    Input Password     //*[@id="password"]    secret_sauce
    Click Button     //*[@id="login-button"]
    Sleep    2s
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login with wrong password
     OpenBrowser    https://www.saucedemo.com/    firefox
     Input Text     id=user-name    standard_user
     Input Password     id=password    wrong_password
     Click Button     id=login-button
     Sleep    2s
     Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]/h3
     Close Browser

Login with wrong username
     OpenBrowser    https://www.saucedemo.com/    firefox
     Input Text     id=user-name    wrong_user
     Input Password     id=password    secret_sauce
     Click Button     id=login-button
     Sleep    2s
     Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]/h3
     Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    firefox
    Input Password     id=password    secret_sauce
    Click Button     id=login-button
    Sleep    2s
    Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text     id=user-name    standard_user
    Click Button     id=login-button
    Sleep    2s
    Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser