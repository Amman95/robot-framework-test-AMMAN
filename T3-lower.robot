*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
#To buy Contract - Lower
${underlying_btn}     //*[@class="cq-symbol-select-btn"]
${synthetic_btn}    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
${aud_usd_btn}    //*[text()="AUD/USD"]
${tradetype_btn}    //*[@class="contract-type-widget__display"]
${high-low_btn}  //*[@id="dt_contract_high_low_item"]
${day_field}    //*[@name="duration"]
${payout_btn}   //*[@id="dc_payout_toggle_item"]
${payout_field}     //*[@name="amount"]
${10_payout_field}  //*[@value="10"]
${contract_lower_btn}    //*[contains(@class,"btn-purchase--2")]

*** Keywords ***
Lower
    wait until page contains element    ${contract_rise_btn}    60
    Click Element   ${underlying_btn}
    Wait Until Page Contains Element    //*[text()="Forex"]
    Click Element   //*[text()="Forex"]
    Click Element   ${aud_usd_btn}
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120
    Click Element   ${tradetype_btn}
#    Wait Until Page Contains    //*[text()="Trade types"]   60
    Click Element   ${high-low_btn}
    Clear Element Text  ${day_field}
    Input Text  ${day_field}    2
    Click Element   ${payout_btn}
    ${current_value}=   Get Element Attribute    ${payout_field}     value
    ${value_length}=    Get Length  ${current_value}
    Repeat Keyword  ${value_length}     Press Keys  ${payout_field}     BACKSPACE
    Input Text  ${payout_field}     15.50
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120
    Click Element   ${contract_lower_btn}