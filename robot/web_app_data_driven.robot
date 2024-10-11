***Settings*** 
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     BuiltIn

Test Template    login success
Test Teardown    Close All Browsers

***Test Cases***                                         USERNAME                       PASSWORD
Example web app data driven success with standard       standard_user                  secret_sauce
Example web app data driven success with problem        problem_user                   secret_sauce
Example web app data driven success with performance    performance_glitch_user        secret_sauce

***Keywords*** 
login success
    [Arguments]    ${username}    ${password}
    Open Browser      https://www.saucedemo.com/v1/index.html    chrome
    Input text        id=user-name      ${username}
    Input text        id=password       ${password}
    Click Element     id=login-button
    #Sleep 5s
    Wait Until Element Is Visible    //div[contains(text(), "Products")]  timeout=30s
