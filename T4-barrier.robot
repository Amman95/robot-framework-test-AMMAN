*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
#To Ensure Error of Barrier pops up
${contract_lower_btn}    //*[contains(@class,"btn-purchase btn-purchase--2")]
${barrier_field}    //*[@name="barrier_1"]
${multiplier_btn}   //*[@value="multiplier"]

*** Keywords ***
Barrier
    wait until page contains element    ${contract_lower_btn}    60
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120
    ${current_value}=   Get Element Attribute    ${barrier_field}     value
    ${value_length}=    Get Length  ${current_value}
    Repeat Keyword  ${value_length}     Press Keys  ${barrier_field}     BACKSPACE
    Input Text  ${barrier_field}     +1
#    Wait Until Page Contains    Contracts more than 24 hours in duration would need an absolute barrier.
    Wait Until Page Does Not Contain    ${contract_lower_btn}