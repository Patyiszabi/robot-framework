*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login
    OpenBrowser    https://www.saucedemo.com/    firefox
    Input Text     id=user-name    standard_user
    Input Password     //*[@id="password"]    secret_sauce
    Click Button     //*[@id="login-button"]
    Sleep    2s