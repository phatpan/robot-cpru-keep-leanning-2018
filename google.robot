*** Settings ***
Library    Selenium2Library

*** Variable ***
${URL}    https://www.google.co.th
${BROWSER_DRIVER}    chrome

*** Test Case ***
Go To Page Google
    Open Browser    ${URL}    ${BROWSER_DRIVER}

