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
Go to LinkedIn Homepage
    Open Browser    ${LINKEDIN_SIGN_UP}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    LinkedIn Homepage Should Have Valid Title

LinkedIn Homepage Should Have Valid Title
    Title Should Be   LinkedIn Login, Sign in | LinkedIn

Go To Homepage
    Go To    ${LOGIN URL}
    LinkedIn Homepage Should Have Valid Title

Input Username
    [Arguments]   ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]   ${password}
    Input Text    password    ${password}

Submit User Credentials
    Click Button    Sign in

LinkedIn Dashboard Page Should Have Valid Title
    Location Should Be      ${LINKEDIN_DASHBOARD}
    Title Should Be    LinkedIn
    
Logout And Validate Title
    Click Element       css:div #nav-settings__dropdown
    Title Should Be     LinkedIn