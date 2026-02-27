*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          LoginKeywords.robot


*** Test Cases ***
 Sort products by price low to high
    Login
    Click Element    //*[@id="header_container"]/div[2]/div/span/select
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${product_prices}=    Get All Product prices
    Verify low to high order    ${product_prices}


Sort products by price high to low
    Login
    Click Element    //*[@id="header_container"]/div[2]/div/span/select
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${product_prices}=    Get All Product prices
    Verify high to low order    ${product_prices}
    Sleep    2s
    Close All Browsers

    
*** Keywords ***
Get All Product prices    
    ${products}=    Create List
    @{products_elements}=    Get WebElements    class:inventory_item_price    
    FOR    ${element}    IN    @{products_elements}
        ${product_price}=    Get Text    ${element}
        Append To List    ${products}    ${product_price.replace('$','')}    
        
    END
    RETURN    ${products}


Verify low to high order
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_prices}    ${index}
        ${next}    Get From List    ${product_prices}    ${index+1}

        Should Be True    ${current} <= ${next}
    END


Verify high to low order
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_prices}    ${index}
        ${next}    Get From List    ${product_prices}    ${index+1}

        Should Be True    ${current} >= ${next}
    END