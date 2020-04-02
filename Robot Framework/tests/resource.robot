*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${LINKEDIN_SIGN_UP}      https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin
${LINKEDIN_DASHBOARD}    https://www.linkedin.com/feed/?trk=guest_homepage-basic_nav-header-signin

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LINKEDIN_SIGN_UP}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be   LinkedIn Login, Sign in | LinkedIn

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]   ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]   ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Sign in

Welcome Page Should Be Open
    Location Should Be      ${LINKEDIN_DASHBOARD}
    Title Should Be    LinkedIn