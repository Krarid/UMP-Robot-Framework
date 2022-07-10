*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         35.219.183.240
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     iconsAdmin
${VALID PASSWORD}    0000
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    https://${SERVER}/
${ERROR URL}      https://${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Giri User Management Dashboard

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    xpath://input[1]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath://input[2]    ${password}

Submit Credentials
    Click Button    xpath://button[contains(text(), 'Login')]

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Giri User Management Dashboard

Login Error Should Be Open
    Wait Until Element Is Visible    //h5[contains(text(), 'Error')]

    Click Button    //button[contains(text(), 'Ok')]