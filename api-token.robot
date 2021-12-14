*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variable ***
${manage_acc_btn}   //*[@class="account-settings-toggle"]
${read_cbox}  //*[text()="Read"]
${payments_cbox}  //*[text()="Payments"]
${trading_info_cbox}  //*[text()="Trading information"]
${trade_cbox}  //*[text()="Trade"]
${admin_cbox}  //*[text()="Admin"]
#${active_tick_cbox}    //*[@class="dc-checkbox__box dc-checkbox__box--active"]
${token_field}  //*[@name="token_name"]
${create_btn}   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
${copy_btn}     //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
${delete_btn}   //*[@class="dc-btn dc-btn--secondary dc-btn__small"]
${delete_yes_btn}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]

*** Keywords ***
API Token
    Wait Until Page Does Not Contain Element    //*[@class="chart-container__loader"]    60
    Click Element   ${manage_acc_btn}
    Wait Until Page Contains Element    dc_api-token_link   20
    Click Element    dc_api-token_link
#    Wait Until Page Does Not Contain Element    //*[@class="initial-loader"]    60

    # Check on tickboxes of Scopes of API Token
    wait until page contains element    ${read_cbox}
    Click Element   ${read_cbox}
    Click Element   ${payments_cbox}
    Click Element   ${trading_info_cbox}
    Click Element   ${trade_cbox}
    Click Element   ${admin_cbox}

    # Input token name
    Input Text      ${token_field}      Test Token
    Click Element   ${create_btn}

    # Copy API Token
    Wait Until Page Contains Element    //*[@class="da-api-token__table-cell"]
    Click Element   ${copy_btn}

    # Delete API Token
    Click Element   ${delete_btn}
    Click Element   ${delete_yes_btn}


