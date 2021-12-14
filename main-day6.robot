*** Settings ***
Library     SeleniumLibrary
Resource    login.robot
Resource    T1-virtual.robot
Resource    T2-rise.robot
Resource    T3-lower.robot
Resource    T4-barrier.robot
Resource    T5-parameter.robot

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
    Virtual
    Contract
    Lower
    Barrier
    Parameter
