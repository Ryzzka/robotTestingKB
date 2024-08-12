*** Settings ***
Library    String
Library    SeleniumLibrary

*** Variables ***
${username}    DSLAB\\e_mvysko
${password}    Pr0ject_NemlaZ_0002

*** Keywords ***
Open Chrome With Disable Search Engine Choice Screen
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-search-engine-choice-screen
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}
Element Click
    [Arguments]    ${locator}    ${library}
    Run Keyword If    '${library}' == 'SeleniumLibrary'    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10 seconds
    Run Keyword If    '${library}' == 'SeleniumLibrary'    SeleniumLibrary.Click Element    ${locator}
*** Test Cases ***
Zrušení smlouvy
    Open Chrome With Disable Search Engine Choice Screen    https://dev1-caas.kb.cz/
    Maximize Browser Window
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    7 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    7 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:userNameInput    7 seconds
    SeleniumLibrary.Input Text    id:userNameInput    ${username}
    SeleniumLibrary.Click Element    id:nextButton
    SeleniumLibrary.Input Text    id:passwordInput    ${password}
    SeleniumLibrary.Click Element    id:submitButton

    Element Click    xpath=(//div[contains(@class, 'form-select__container')])[2]    SeleniumLibrary
    Element Click    xpath: //*[contains(text(), "Datum narození")]    SeleniumLibrary
    Element Click    id:query    SeleniumLibrary
    SeleniumLibrary.Wait Until Element Is Visible    id:query    5 seconds
    SeleniumLibrary.Press Keys    id:query    8.6.2000
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon

    FOR    ${j}    IN RANGE    1    30
        FOR    ${i}    IN RANGE    1    11
        Element Click    xpath=/html/body/app-root/app-caas-admin/div/app-client-search/div[2]/div/app-grid/table/tbody/tr[${i}]    SeleniumLibrary
        Sleep    1 second
        ${Nesjednana_smlouva}=    Run Keyword And Return Status    SeleniumLibrary.Element Text Should Be    xpath=//*[contains(text(), "Nesjednaná smlouva")]    Nesjednaná smlouva Sjednat
        ${Nemá_Upozornění}=    Run Keyword And Return Status    SeleniumLibrary.Page Should Contain Element   class:flex-fill.d-flex.flex-column.justify-content-center
        IF    ${Nesjednana_smlouva}
            IF    not ${Nemá_Upozornění}
            SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Sjednat")]    7 seconds
            SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Sjednat")]
            SeleniumLibrary.Wait Until Element Is Visible    id:phone    7 seconds
            ${telcislo}=    Generate Random String   6    0123456789
            Set Global Variable    ${telcislo}
            SeleniumLibrary.Input Text    id:phone    608${telcislo}
            SeleniumLibrary.Input Text    id:email    robotframework@gmail.com
            Sleep    1 second
            SeleniumLibrary.Click Element    class:btn.btn-primary
            SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    7 seconds
            SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
            SeleniumLibrary.Click Element    name:bu10453
            
            SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zrušit")]    7 seconds
            SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Zrušit")]
            SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    7 seconds
            SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
            SeleniumLibrary.Click Element    name:bu10453
            Element Click    class:kb-jumbotron__arrow    SeleniumLibrary
            Continue For Loop
            END
            Element Click    class:kb-jumbotron__arrow    SeleniumLibrary
            Continue For Loop
        END
        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zrušit")]    7 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Zrušit")]
        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    7 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
        SeleniumLibrary.Click Element    name:bu10453
        Element Click    class:kb-jumbotron__arrow    SeleniumLibrary
        END
        Element Click    xpath=(//div[contains(@class, 'kb-outdent--inline-bigger')])[4]    SeleniumLibrary
        Sleep    2 seconds
    END