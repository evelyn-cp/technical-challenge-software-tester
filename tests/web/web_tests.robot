*** Settings ***
Library    SeleniumLibrary
Resource     ../../resources/config/variables.robot
Resource     ../../resources/test_data/user_data.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page    
    Type In Username    ${Username}
    Type In Password    ${Password}
    Click Login Button
    Profile Page Should Be Open
    [Teardown]    Close Browser

Logout
    [Setup]    Do Valid Login
    Click Logout button
    Login Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open browser To Login Page
    Open Browser    ${Url}    ${Browser}
    Page Should Contain    Login

Type In Username
    [Arguments]    ${username}
    Input Text    id=userName    ${username}

Type In Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Click Login Button
    Click Button    id=login

Profile Page Should Be Open
    Wait Until Location Is    ${ProfileUrl}
    Wait Until Element Is Visible    id=submit
    Element Should Contain    id=submit    Log out

Do Valid Login
    Open Browser To Login Page    
    Type In Username    ${Username}
    Type In Password    ${Password}
    Click Login Button
    Profile Page Should Be Open

Click Logout button
    Click Button    id=submit

Login Page Should Be Open
    Wait Until Location Is    ${Url}
    Page Should Contain    Login