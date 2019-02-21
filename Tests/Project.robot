*** Settings ***
Documentation       Suite description
Library             SeleniumLibrary
Suite Setup         Log     I am inside Test Suite Setup
Suite Teardown      Log     I am inside Test Suite Teardown
Test Setup          Log     I am inside Test Case Setup
Test Teardown       Log     I am inside Test Case Teardown

Default Tags        Sanity

*** Variables ***
# Scalar变量
${URL}          http://118.31.187.124:81
# List
@{CREDENTIALS}  test01      test01#
# Dictionary
&{LoginDate}    account=test01  password=test01#

*** Test Cases ***
My First RF Test Case
    Set Tags    Regression
    Log     Hello RobotFramework
    # Remove Tags     Regression

User can open home page
    [Tags]      Smoke
    [Documentation]             As a user I can open the home page and see the tagline
    Open Browser                ${URL}    chrome
    Set Browser Implicit Wait   5
    Click Element               id=zentao
    login page                  @{CREDENTIALS}[0]       &{LoginDate}[password]
    Sleep                       2
    Close Browser
    Log                         This test was excuted by %{username} on %{os}

*** Keywords ***
# Keywords 编写实例
#Title Should Start With
#    [Arguments]    ${expected}
#    ${title} =    Get Title
#    Should Start With    ${title}    ${expected}
Login Page
    [Arguments]    ${account}   ${password}
    Input Text                  name=account             ${account}
    Input Text                  name=password            ${password}
    Click Element               id=submit