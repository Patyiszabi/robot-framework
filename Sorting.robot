*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          LoginKeywords.robot


*** Test Cases ***
Sort products by z-a
    Login
    Click Element    //*[@id="header_container"]/div[2]/div/span/select
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Products
    Verify reversed alphabetical order    ${product_names}

Sort products by a-z
    Login
    Click Element    //*[@id="header_container"]/div[2]/div/span/select
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get All Products
    Verify alphabetical order    ${product_names}
    Sleep    2s
    Close All Browsers



*** Keywords ***
Get All Products
    ${products}=    Create List
    @{products_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{products_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}    
        
    END
    RETURN    ${products}

Verify reversed alphabetical order
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_names}    ${index}
        ${next}    Get From List    ${product_names}    ${index+1}

        Should Be True    '${current}' >= '${next}'
    END
    
    
Verify alphabetical order
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_names}    ${index}
        ${next}    Get From List    ${product_names}    ${index+1}

        Should Be True    '${current}' <= '${next}'
        
    END
    
