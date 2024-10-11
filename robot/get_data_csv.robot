*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    CSVLibrary
Library    SeleniumLibrary
Variables    C:/robot/data.yaml
Resource    open_website.robot

*** Test Cases ***
Get csv testing
    ${CVS_FILE}    Set Variable    C:/robot/test_robot.csv
    ${DATA_CSV}    Read Csv File To Associative    ${CVS_FILE}
    #Log To Console    ${DATA_CSV}
    FOR    ${row}    IN    @{DATA_CSV}
        Open Browser chrome    ${url}    ${browser}
        Input username    ${row}[username]
        Input password    ${row}[password]   
        Click login    
        Verify text Products
        #Log To Console    ${row}[username]
        #Log To Console    ${row}[password]
    END

*** Keywords ***
Open Browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser      ${url}    ${browser}  
Input username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}
Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]     ${password}
Click login
    Click Button    //*[@id="login-button"] 
Verify text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s
