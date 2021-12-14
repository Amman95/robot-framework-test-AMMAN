*** Settings ***
Library     SeleniumLibrary
Resource    login.robot
Resource    api-token.robot

*** Variable ***
#For Login to Account
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}   //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]

*** Keyword ***


*** Test Cases ***
Open Deriv
    Login   ${VALID_USER}   ${VALID_PW}
    API Token