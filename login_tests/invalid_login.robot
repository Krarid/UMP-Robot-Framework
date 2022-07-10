*** Settings ***
Documentation     A test suite with a plenty of test for invalid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Login With Invalid Credentials Should Fail
    Open Browser To Login Page
    Input Username    random
    Input Password    1234
    Submit Credentials
    Login Error Should Be Open
    [Teardown]    Close Browser

Login With Empty Username Should Fail
    Open Browser To Login Page
    Input Password    0000
    Submit Credentials
    Login Error Should Be Open
    [Teardown]    Close Browser

Login With Empty Password Should Fail
    Open Browser To Login Page
    Input Username    iconsAdmin
    Submit Credentials
    Login Error Should Be Open
    [Teardown]    Close Browser

Login With Empty Username And Password Should Fail
    Open Browser To Login Page
    Submit Credentials
    Login Error Should Be Open
    [Teardown]    Close Browser