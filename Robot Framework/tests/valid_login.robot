*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Go to LinkedIn Homepage
    Submit User Credentials
    Input Username    ******
    Input Password    ******
    Submit User Credentials
    LinkedIn Dashboard Page Should Have Valid Title
    Logout And Validate Title
    [Teardown]    Close Browser