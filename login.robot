*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary


*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    Set Window Size     1280    1028
    Wait Until Page Does Not Contain Element    dt_core_header_acc-info-preloader
#    Wait Until Page Contains Element    dt_login_button     60
    Click Element   ${login_btn}
    Wait Until Page Contains Element    ${email_field}     20
    Input Text      ${email_field}      ${email}
    Input Text    ${pw_field}   ${pw}
    Click Element   ${login_oauth_btn}


