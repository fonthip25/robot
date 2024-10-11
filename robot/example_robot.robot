*** Settings ***
Library        OperatingSystem
Library        Collections
Library        String
Test Template    Example test keyword

*** Test Cases ***                                                      USERNAME                        PASSWORD
Example keyword1                                                        standard_user                    secret_sauce
    [Tags]    test1
    [Documentation]    ทำการ login สำเร็จโดยใช้ username แบบธรรมดา
    # {Template} login success
Example keyword                                                        performance_gliteh_user           secret_sauce
    [Tags]    test2
    [Documentation]    ทำการ login สำเร็จโดยใช้ username แบบโหลดหน้าเพจช้า
    # {Template} login success

*** Keywords ***
Example test keyword
    [Arguments]    ${username}    ${password}
    Log    ${username}    console=${True}
    Log    ${password}    console=${True}