*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Variables  C:/robot/data.yaml
*** Variables ***
${CHROME_DRIVER_PATH}    C:/chromedriver/chromedriver.exe

*** Test Cases ***
Open Google Chrome Browser
    Open Browser chrome    ${url}    ${browser}
    Input username    ${name.standard.user}
    Input password    ${name.standard.password}
    Click login   
    Verify text Products
     

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


