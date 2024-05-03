*** Settings ***
Library   Browser    jsextension=${EXECDIR}/resources/module.js

Test Setup       Start session
Task Teardown    Finish Session

*** Test Cases ***
Deve tocar uma musica
    ${song_name}    Set Variable    Smells Like Test Script

    Mock My Song
    Go To     https://parodify.vercel.app/

    Get Text    css=.logged-user    contains    Fernando Papito

    ${play}    Get play button    ${song_name}
    ${pause}    Get play button    ${song_name}
  
    Click    ${play}

    Wait For Elements State    ${pause}    visible    2
    Wait For Elements State    ${play}    visible    7

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    about:black

Finish Session
    Take Screenshot

Get play button
    [Arguments]    ${song_name}

    ${play}    Set Variable
    ...    //div[contains(@class,"song")]//h6[text()="${song_name}"]/..//button[contains(@class,"play")]

    RETURN    ${play}

Get pause button
    [Arguments]    ${song_name}

      ${pause}    Set Variable
    ...    //div[contains(@class,"song")]//h6[text()="${song_name}"]/..//button[contains(@class,"pause")]

    RETURN    ${pause}