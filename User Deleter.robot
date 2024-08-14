*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${username}    DSLAB\\e_mvysko
${password}    Pr0ject_NemlaZ_0002

*** Keywords ***
Open Chrome With Disable Search Engine Choice Screen
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-search-engine-choice-screen
    SeleniumLibrary.Create WebDriver    Chrome    options=${options}
    Go To    ${url}
*** Test Cases ***
Smazat uživatele
    Open Chrome With Disable Search Engine Choice Screen    https://dev1-caas.kb.cz/
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    20 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    20 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:userNameInput    20 seconds
    SeleniumLibrary.Input Text    id:userNameInput    ${username}
    SeleniumLibrary.Click Element    id:nextButton
    SeleniumLibrary.Input Text    id:passwordInput    ${password}
    SeleniumLibrary.Click Element    id:submitButton
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//div[contains(@class, 'form-select__container')])[2]    20 seconds
    SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[2]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Datum narození")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Datum narození")]
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Click Element    id:query
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Press Keys    id:query    8.6.2000
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon

    FOR    ${j}    IN RANGE    1    30
        FOR    ${i}    IN RANGE    1    11
            SeleniumLibrary.Wait Until Element Is Visible    xpath=/html/body/app-root/app-caas-admin/div/app-client-search/div[2]/div/app-grid/table/tbody/tr[${i}]    20 seconds
            SeleniumLibrary.Click Element    xpath=/html/body/app-root/app-caas-admin/div/app-client-search/div[2]/div/app-grid/table/tbody/tr[${i}]
            Sleep    1 second
            ${Nesjednana_smlouva}=    Run Keyword And Return Status    SeleniumLibrary.Element Text Should Be    xpath=//*[contains(text(), "Nesjednaná smlouva")]    Nesjednaná smlouva Sjednat
            ${Nemá_Upozornění}=    Run Keyword And Return Status    SeleniumLibrary.Page Should Contain Element   class:flex-fill.d-flex.flex-column.justify-content-center
            IF    ${Nesjednana_smlouva}
                IF    not ${Nemá_Upozornění}
                    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Sjednat")]    20 seconds
                    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Sjednat")]
                    SeleniumLibrary.Wait Until Element Is Visible    id:phone    20 seconds
                    ${telcislo}=    Generate Random String   6    0123456789
                    Set Global Variable    ${telcislo}
                    SeleniumLibrary.Input Text    id:phone    608${telcislo}
                    SeleniumLibrary.Input Text    id:email    robotframework@gmail.com
                    Sleep    1 second
                    SeleniumLibrary.Click Element    class:btn.btn-primary
                    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
                    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
                    SeleniumLibrary.Click Element    name:bu10453
                    SeleniumLibrary.Wait Until Element Is Visible    class:kb-h-color-copy--white    20 seconds
                    SeleniumLibrary.Click Element    class:kb-h-color-copy--white
                    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
                    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
                    SeleniumLibrary.Click Element    name:bu10453
                    SeleniumLibrary.Wait Until Element Is Visible    class:kb-jumbotron__arrow    20 seconds
                    SeleniumLibrary.Click Element    class:kb-jumbotron__arrow
                    Continue For Loop
                END
                SeleniumLibrary.Wait Until Element Is Visible    class:kb-jumbotron__arrow    20 seconds
                SeleniumLibrary.Click Element    class:kb-jumbotron__arrow
                Continue For Loop
            END
            SeleniumLibrary.Wait Until Element Is Visible    class:kb-h-color-copy--white    20 seconds
            SeleniumLibrary.Click Element    class:kb-h-color-copy--white
            SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
            SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
            SeleniumLibrary.Click Element    name:bu10453
            SeleniumLibrary.Wait Until Element Is Visible    class:kb-jumbotron__arrow    20 seconds
            SeleniumLibrary.Click Element    class:kb-jumbotron__arrow
        END
        SeleniumLibrary.Wait Until Element Is Visible    xpath=(//div[contains(@class, 'kb-outdent--inline-bigger')])[4]    20 seconds
        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'kb-outdent--inline-bigger')])[4]
        Sleep    2 seconds
    END