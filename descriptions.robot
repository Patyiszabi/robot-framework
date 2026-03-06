*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          LoginKeywords.robot


*** Test Cases ***
validate products by clicking on the product label
    Login
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${product_name}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Should Be Equal As Strings    ${product_name}    Sauce Labs Backpack
    Sleep    2s
    Close Browser

validate products by clicking on the product image
    Login
    Click Image    //*[@id="item_4_img_link"]/img
    Page Should Contain Image    //*[@id="inventory_item_container"]/div/div/div[1]/img
    ${product_name}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Should Be Equal As Strings    ${product_name}    Sauce Labs Backpack
    Sleep    2s
    Close Browser


validate product_name
    Login
    ${original_name}=    Get Text    //*[@id="item_4_title_link"]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${product_name}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Should Be Equal As Strings    ${product_name}    ${original_name}
    Sleep    2s
    Close Browser


validate product price
    Login
    ${original_price}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${product_price}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    Should Be Equal As Strings    ${product_price}    ${original_price}
    Sleep    2s
    Close Browser

validate product description
    Login
    ${original_desc}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${product_price}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Should Be Equal As Strings    ${product_price}    ${original_desc}
    Sleep    2s
    Close Browser

validate product image
    Login
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Image    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Sleep    2s
    Close Browser

validate navigation button
    Login
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Button    //*[@id="back-to-products"]
    Click Button    //*[@id="back-to-products"]
    Sleep    2s
    Close Browser
    





