*** Settings ***
Library           Selenium2Library

*** Test Cases ***
OpenBrowser
    OpenBrowser    https://www.saucedemo.com/    firefox
    Sleep    3s
    Close Browser

