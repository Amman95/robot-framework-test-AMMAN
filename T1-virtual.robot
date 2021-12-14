*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
#To go to Virtual Account
${currency_btn}     //*[@class="acc-info"]
${demo_btn}     //*[@id="dt_core_account-switcher_demo-tab"]
${virtual_acc_btn}      //*[@id="dt_VRTC5169164"]/span

*** Keywords ***
Virtual
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Click Element   ${currency_btn}
    Wait Until Page Contains Element    //*[text()="Demo"]     30
#    Wait Until Page Does Not Contain Element    dt_core_header_acc-info-preloader
    Click Element   ${demo_btn}
    Wait Until Page Contains Element    ${virtual_acc_btn}     30
    Click Element   ${virtual_acc_btn}