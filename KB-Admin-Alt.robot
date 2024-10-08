*** Settings ***
Library    String
Library    AppiumLibrary
Library    SeleniumLibrary

*** Variables ***
${client-ID}

${username}    DSLAB\\e_mvysko
${password}    Pr0ject_NemlaZ_0002
${browser}    chrome

*** Keywords ***
Otevři KB Admin
    [Arguments]    ${prohlížeč}
    Open Browser    https://dev1-caas.kb.cz/    ${prohlížeč}
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
Vyhledej Účet
    [Arguments]    ${identifikační-číslo}
    SeleniumLibrary.Wait Until Element Is Visible    id:query    7 seconds
    SeleniumLibrary.Input Text    id:query   ${identifikační-číslo}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${identifikační-číslo}")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${identifikační-číslo}")]
Sjednej Smlouvu
    Otevři KB Admin    ${browser}
    Vyhledej Účet    ${client-ID}
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
    Close All Browsers
Aktivuj KB Klíč
    Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Page Contains Element    id=cz.kb.paat.kbdev1:id/button_manually
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_manually
    Open Browser    https://dev1-caas.kb.cz/    chrome
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
    SeleniumLibrary.Input Text    id:userNameInput    DSLAB\\e_mvysko
    SeleniumLibrary.Click Element    id:nextButton
    SeleniumLibrary.Input Text    id:passwordInput    Pr0ject_NemlaZ_0002
    SeleniumLibrary.Click Element    id:submitButton
    SeleniumLibrary.Wait Until Element Is Visible    id:query    7 seconds
    SeleniumLibrary.Input Text    id:query   ${client-ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "KB Klíč")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "KB Klíč")]
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary    7 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]    7 seconds
    ${OTP1}=      SeleniumLibrary.Get Text    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_username
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_username    ${client-ID}
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_activation_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_activation_code    ${OTP1}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    10 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    7 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_verification_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    ${client-username}    Generate random string    7    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
    Run Keyword And Ignore Error    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_nickname
    Run Keyword And Ignore Error    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_nickname    ${client-username}
    Hide Keyboard
    Run Keyword And Ignore Error    AppiumLibrary.Click Element    cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password    7 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    147321
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password2
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    147321
    Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Close Application
    Close All Browsers
Deaktivuj KB Klíč
    Otevři KB Admin    ${browser}
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Deaktivovat metodu
Otestuj Akci
    [Arguments]    ${název-akce}
    SeleniumLibrary.Wait Until Element Is Visible    class:kb-linkbox__inner    7 seconds
    SeleniumLibrary.Click Element    class:kb-linkbox__inner
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${název-akce}")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${název-akce}")]
    Run keyword and Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary.mt-2    7 seconds
    Run keyword and Ignore Error    SeleniumLibrary.Click Element    class:btn.btn-primary.mt-2
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    7 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    name:bu10453
    Close All Browsers
*** Test Cases ***
#TO DO: ZJISTIT, JESTLI JE VYGENEROVANÝ STRING SKUTEČNĚ ORIGINÁLNÍ - done
Založení nového klienta (KB ADMIN)
        Otevři KB Admin    ${browser}
        SeleniumLibrary.Wait Until Element Is Visible    id:query    7 seconds
        SeleniumLibrary.Input Text    id:query    .
        SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
        SeleniumLibrary.Wait Until Element Is Visible    name:bu9680    7 seconds
        SeleniumLibrary.Click Element    name:bu9680

        #NASTAVENÍ SUBJEKTU
        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zvolte")]    7 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Zvolte")]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "ČR (0100)")]
        
        #GENERACE IDENTIFIKAČNÍHO ČÍSLA
        ${client-ID}    Generate random string    10    123456789
        Set Global Variable    ${client-ID}
        SeleniumLibrary.Input Text    id:bu10372    ${client-ID}
        
        #GENERACE JMÉNA A PŘÍJMENÍ
        ${client-name}    Generate random string    7    ABCDEFGHIJKLMNOPQRŘSŠTŤUVWXYZabcdefghijklmnopqrřsštťuvwxyz
        SeleniumLibrary.Input Text    id:bu0306    ${client-name}
        SeleniumLibrary.Input Text    id:bu9698    ${client-name}
        
        #NASTAVENÍ DATA NAROZENÍ
        SeleniumLibrary.Input Text    id:bu0985    8.6.2000
        
        #NASTAVENÍ POHLAVÍ
        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[4]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Muž")]
        
        #NASTAVENÍ DRUHU PRŮKAZU TOTOŽNOSTI
        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[5]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Občanský průkaz")]
        
        #GENERACE ČÍSLA DOKLADU
        ${ID-number}    Generate random string    24    0123456789
        SeleniumLibrary.Input Text    id:bu3344    ${ID-number}
        
        #NASTAVENÍ VYDAVATELE DOKLADU
        SeleniumLibrary.Input Text    id:bu10881    ${client-name}
        
        #NASTAVENÍ PLATNOSTI DOKLADU (OD DO)
        SeleniumLibrary.Input Text    id:bu0314    5.5.2008
        SeleniumLibrary.Input Text    id:bu10844    6.9.2069
        
        #NASTAVENÍ ORGÁNU/STÁTU
        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[6]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Česká republika")]
        
        #NASTAVENÍ ULICE A MĚSTA
        SeleniumLibrary.Input Text    id:bu0032    ${client-name}
        SeleniumLibrary.Input Text    id:bu0033    ${client-name}
        
        #GENERACE PSČ
        ${PSČ}    Generate random string    5    0123456789
        SeleniumLibrary.Input Text    id:bu9701    ${PSČ}
        
        #NASTAVENÍ STÁTU
        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[7]
        SeleniumLibrary.Click Element    xpath=(//*[contains(@class, 'js-select-value')])[426]

        SeleniumLibrary.Click Element    name:bu9702
        Close All Browsers
Aktivace BH(KB ADMIN)
        Aktivuj KB Klíč
        Otevři KB Admin    ${browser}
        Vyhledej Účet    ${client-ID}
        Otestuj Akci     Bezpečnostní heslo  

Sjednání Smlouvy
    Sjednej Smlouvu
    #TO DO: ZJISTIT, JESTLI JE VYGENEROVANÝ STRING SKUTEČNĚ ORIGINÁLNÍ - done
Aktivace KB Klíče (KB ADMIN)
    Aktivuj KB Klíč
    #BUG: PŘI DEAKTIVACI A BLOKACI KB KLÍČE TRVÁ DLOUHO, NEŽ SE ZAŠKRTNE POLÍČKO "Dokument byl podepsán klientem."
    #BUG: ValueError: Element locator 'id=cz.kb.paat.kbdev1:id/edt_verification_code' did not match any elements.
Deaktivace KB Klíče (KB ADMIN)
    Deaktivuj KB Klíč
Blokace KB Klíče (KB ADMIN)
    Aktivuj KB Klíč
    Otevři KB Admin    ${browser}
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Blokovat metodu
    #BUG: [FAIL INSIDE] Multiple keywords with name 'Capture Page Screenshot' found.
    #BUG: [FAIL INSIDE] ValueError: Element locator 'id=cz.kb.paat.kbdev1:id/edt_username' did not match any elements.
Blokace zařízení (KB ADMIN)
    Deaktivuj KB Klíč
    Aktivuj KB Klíč
    Otevři KB Admin    ${browser}
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Blokovat
Odebrání zařízení (KB ADMIN)
    Otevři KB Admin    ${browser}
    Vyhledej Účet    ${client-ID}
       