*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
${underlying_btn}     //*[@class="cq-symbol-select-btn"]
${volatility_50_btn}    //*[@class="sc-mcd__item sc-mcd__item--R_50 "]
${tradetype_btn}    //*[@class="contract-type-widget__display"]
${multiplier_btn}   //*[@value="multiplier"]
${profit_cbox}  //*[text()="Take profit"]
${profit_+_btn}     //*[@id="dc_take_profit_input_add"]
${profit_-_btn}     //*[@id="dc_take_profit_input_sub"]

${loss_cbox}    //*[text()="Stop loss"]
${cancel_cbox}  //*[text()="Deal cancellation"]
${active_tick_cbox}    //*[@class="dc-checkbox__box dc-checkbox__box--active"]

${multiplier_value_btn}     //*[@id="dropdown-display"]
${stake_field}  //*[@id="dt_amount_input"]
${max_stake_error}  //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
${min_stake_error}  //*[@class="trade-container__tooltip dc-tooltip dc-tooltip--error"]

*** Keywords ***
Parameter
    Click Element   ${underlying_btn}
    Wait Until Page Contains Element    //*[text()="Synthetic Indices"]
    Click Element   //*[text()="Synthetic Indices"]
    Click Element   ${volatility_50_btn}
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120
    Click Element   ${tradetype_btn}
    Click Element   ${multiplier_btn}
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper"]     120

    #5a - Ensure only Stake exists without the Payout option
    Wait Until Page Does Not Contain    //*[text()="Payout"]

    #5b - Check on Take Profit / Stop Loss / Deal Cancellation parameter
    Click Element   ${profit_cbox}
    Wait Until Page Contains Element    ${active_tick_cbox}
    Click Element   ${loss_cbox}
    Wait Until Page Contains Element    ${active_tick_cbox}
    Click Element   ${cancel_cbox}
    Wait Until Page Contains Element    ${active_tick_cbox}

    #5c - Multiplier Value Selection (20x, 40x, 60x, 100x, 200x)
    Click Element   ${multiplier_value_btn}
    Page Should Contain Element   //*[@id="20"]
    Page Should Contain Element    //*[@id="40"]
    Page Should Contain Element    //*[@id="60"]
    Page Should Contain Element    //*[@id="100"]
    Page Should Contain Element    //*[@id="200"]

    #5e - Maximum Stake
    ${current_value}=   Get Element Attribute    ${stake_field}     value
    ${value_length}=    Get Length  ${current_value}
    Repeat Keyword  ${value_length}     Press Keys  ${stake_field}     BACKSPACE
    Input Text  ${stake_field}  20001
    Page Should Contain Element     ${max_stake_error}

    #5f - Minimum Stake
    ${current_value}=   Get Element Attribute    ${stake_field}     value
    ${value_length}=    Get Length  ${current_value}
    Repeat Keyword  ${value_length}     Press Keys  ${stake_field}     BACKSPACE
    Input Text  ${stake_field}  0
    Page Should Contain Element     ${min_stake_error}


    #5g,5h - Add (+) value and Subtract (-) value to Take Profit amount
    Click Element   ${profit_cbox}
    Wait Until Page Contains Element    ${active_tick_cbox}
    Click Element   ${profit_+_btn}
    Wait Until Page Contains Element    //*[@value="1"]
    Click Element   ${profit_+_btn}
    Wait Until Page Contains Element    //*[@value="2"]
    Click Element   ${profit_-_btn}
    Wait Until Page Contains Element    //*[@value="1"]

    #5i - Deal Cancellation Option (5, 10, 15, 30, 60)
    Click Element   ${cancel_cbox}
    Wait Until Page Contains Element    ${active_tick_cbox}
