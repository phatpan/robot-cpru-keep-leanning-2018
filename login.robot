*** Settings ***
Library    Selenium2Library
Suite Teardown    Close All Browsers

*** Variable ***
${URL}    http://cpru.printcode.co.th/login
${BROWSER_DRIVER}     chrome

*** Test Case ***
Valid Login
    Open Browser    ${URL}    ${BROWSER_DRIVER}
    Input Text    id=username    admin
    Input Text    id=password    password
    Click Button    login-button
    Wait Until Page Contains    Member

Cannot Login When User Has No Authorize
    Open Browser    ${URL}    ${BROWSER_DRIVER}
    Input Text    id=username    phatpan
    Input Text    id=password    123467
    Click Button    login-button
    Wait Until Element Is Visible    error-message
    Wait Until Page Contains    authorization failed

Disabled Login Button When Username Or Password Are Blank
    Open Browser    ${URL}    ${BROWSER_DRIVER}
    Input Text    id=username     phatpan
    Input Text    id=password     ${EMPTY}
    Element Should Be Disabled    login-button

Enabled Login Button When Username And Password Not Blank
    Open Browser    ${URL}    ${BROWSER_DRIVER}
    Input Text    id=username     phatpan
    Input Text    id=password     1234
    Element Should Be Enabled     login-button
    