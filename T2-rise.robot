*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
#To buy Contract - Rise
${underlying_btn}     //*[@class="cq-symbol-select-btn"]
${synthetic_btn}    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
${vol_10_1s_btn}    //*[contains(@class,"item--1HZ10V")]
#${vol_10_1s_btn}    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V"]
${contract_rise_btn}    //*[contains(@class,"btn-purchase--1")]

*** Keywords ***
Contract
    wait until page contains element    ${contract_rise_btn}    30
    Click Element   ${underlying_btn}
    Wait Until Page Contains Element    ${vol_10_1s_btn}    60
    Click Element   //*[text()="Synthetic Indices"]
    Click Element   ${vol_10_1s_btn}
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120
    Click Element   ${contract_rise_btn}