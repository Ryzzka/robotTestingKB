*** Settings ***
Library    AppiumLibrary
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    Process
Library    String

*** Variables ***
${username}    DSLAB\\e_mvysko
${password}    Pr0ject_NemlaZ_0003

${FILE_PATH}      C:/Users/adam/Documents/Robot-Framework/robotTestingKB/qr_code.png
${DESTINATION_PATH}    /sdcard/Download/qr_code.png

${client-ID}
${client-username}
${client-phone-number}

*** Keywords ***
Open Chrome With Disable Search Engine Choice Screen
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-search-engine-choice-screen
    SeleniumLibrary.Create WebDriver    Chrome    options=${options}
    SeleniumLibrary.Go To    ${url}
Otevři KB Admin
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
Vyhledej Účet
    [Arguments]    ${identifikační-číslo}
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Input Text    id:query   ${identifikační-číslo}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${identifikační-číslo}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${identifikační-číslo}")]
Založ Nového Klienta
    Otevři KB Admin
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Input Text    id:query    .
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    name:bu9680    20 seconds
    SeleniumLibrary.Click Element    name:bu9680

    #NASTAVENÍ SUBJEKTU
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zvolte")]    20 seconds
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
    ${ID-card-number}    Generate random string    24    0123456789
    SeleniumLibrary.Input Text    id:bu3344    ${ID-card-number}
    
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
    ${postal-code}    Generate random string    5    0123456789
    SeleniumLibrary.Input Text    id:bu9701    ${postal-code}
    
    #NASTAVENÍ STÁTU
    SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[7]
    SeleniumLibrary.Click Element    xpath=(//*[contains(@class, 'js-select-value')])[426]
    SeleniumLibrary.Click Element    name:bu9702
    SeleniumLibrary.Close All Browsers
Sjednej Smlouvu
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Sjednat")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Sjednat")]
    SeleniumLibrary.Wait Until Element Is Visible    id:phone    20 seconds
    ${client-phone-number}=    Generate Random String   6    0123456789
    Set Global Variable    ${client-phone-number}
    SeleniumLibrary.Input Text    id:phone    608${client-phone-number}
    SeleniumLibrary.Input Text    id:email    robotframework@gmail.com
    Sleep    2 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    name:bu10453
    SeleniumLibrary.Close All Browsers
Aktivuj KB Klíč
    AppiumLibrary.Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Page Contains Element    id=cz.kb.paat.kbdev1:id/button_manually
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_manually
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
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Input Text    id:query   ${client-ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "KB Klíč")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "KB Klíč")]
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]    20 seconds
    ${OTP1}=      SeleniumLibrary.Get Text    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_username
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_username    ${client-ID}
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_activation_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_activation_code    ${OTP1}
    Hide Keyboard
    Sleep    1 second
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    5 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_verification_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    AppiumLibrary.Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    ${client-username}    Generate random string    7    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
    Set Global Variable    ${client-username}
    Run Keyword And Ignore Error    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_nickname
    Run Keyword And Ignore Error    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_nickname    ${client-username}
    AppiumLibrary.Hide Keyboard
    Run Keyword And Ignore Error    AppiumLibrary.Click Element    cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password    20 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    147321
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password2
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    147321
    AppiumLibrary.Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    5 seconds
    AppiumLibrary.Close Application
    SeleniumLibrary.Close All Browsers
Aktivuj KB Klíč a Sjednej Smlouvu
    AppiumLibrary.Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Page Contains Element    id=cz.kb.paat.kbdev1:id/button_manually
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_manually
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
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Input Text    id:query   ${client-ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "KB Klíč")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "KB Klíč")]
    
    SeleniumLibrary.Wait Until Element Is Visible    id:phone    20 seconds
    ${telcislo}=    Generate Random String   6    0123456789
    Set Global Variable    ${telcislo}
    SeleniumLibrary.Input Text    id:phone    608${telcislo}
    SeleniumLibrary.Input Text    id:email    robotframework@gmail.com
    Sleep    2 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary

    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]    20 seconds
    ${OTP1}=      SeleniumLibrary.Get Text    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_username
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_username    ${client-ID}
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_activation_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_activation_code    ${OTP1}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    5 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_verification_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    AppiumLibrary.Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    ${client-username}    Generate random string    7    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
    Run Keyword And Ignore Error    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_nickname
    Run Keyword And Ignore Error    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_nickname    ${client-username}
    AppiumLibrary.Hide Keyboard
    Run Keyword And Ignore Error    AppiumLibrary.Click Element    cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password    20 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    147321
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_new_password2
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    147321
    AppiumLibrary.Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    5 seconds
    AppiumLibrary.Close Application
    SeleniumLibrary.Close All Browsers
Deaktivuj KB Klíč
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Deaktivovat metodu
Otestuj Akci
    [Arguments]    ${název-akce}
    SeleniumLibrary.Wait Until Element Is Visible    class:kb-linkbox__inner    20 seconds
    SeleniumLibrary.Click Element    class:kb-linkbox__inner
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${název-akce}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${název-akce}")]
    Run keyword and Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary.mt-2    20 seconds
    Run keyword and Ignore Error    SeleniumLibrary.Click Element    class:btn.btn-primary.mt-2
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    name:bu10453
    SeleniumLibrary.Close All Browsers
Zruš Smlouvu
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zrušit")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Zrušit")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    name:bu10453
*** Test Cases ***
Založení nového klienta (KB ADMIN)
    Založ Nového Klienta
Sjednání Smlouvy (KB ADMIN)
    Sjednej Smlouvu
Aktivace KB Klíče (KB ADMIN)
    Aktivuj KB Klíč
Deaktivace KB Klíče (KB ADMIN)
    Deaktivuj KB Klíč
    #BUG: TRVÁ DLOUHO, NEŽ SE ZAŠKRTNE POLÍČKO "Dokument byl podepsán klientem. TAKTÉŽ SE VYTVOŘÍ SCREENSHOT."
Blokace KB Klíče (KB ADMIN)
    Aktivuj KB Klíč
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Blokovat metodu
Blokace zařízení (KB ADMIN)
    Deaktivuj KB Klíč
    Aktivuj KB Klíč
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Blokovat
Odebrání zařízení (KB ADMIN)
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    Otestuj Akci    Odebrat  
Zruš smlouvu (KB ADMIN)
    Otevři KB Admin
    Vyhledej Účet    ${client-ID}
    Zruš Smlouvu
Aktivace KB Klíče a sjednání smlouvy (KB ADMIN)
    Založ Nového Klienta
    Aktivuj KB Klíč a Sjednej Smlouvu
Aktivace KB klíče pomocí QR kódu (KB ADMIN)
    Deaktivuj KB Klíč
    AppiumLibrary.Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Page Contains Element    id=cz.kb.paat.kbdev1:id/button_manually
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_manually
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
    SeleniumLibrary.Wait Until Element Is Visible    id:query    20 seconds
    SeleniumLibrary.Input Text    id:query   ${client-ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "KB Klíč")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "KB Klíč")]
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    class:btn.btn-primary
    
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //img[@title='Jednorázový kód']    20 seconds
    SeleniumLibrary.Scroll Element Into View    xpath: //*[contains(text(), "Po úspěšném načtení aktivačních údajů")]
    SeleniumLibrary.Capture Element Screenshot    xpath: //img[@title='Jednorázový kód']    qr_code.png
    Run Process    adb push ${FILE_PATH} ${DESTINATION_PATH}    shell=True
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_scan_qr_code
    AppiumLibrary.Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_one_time_button    20 seconds
    AppiumLibrary.Click Element    id=com.android.permissioncontroller:id/permission_allow_one_time_button
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/toolbar_button_load_qr_code    20 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/toolbar_button_load_qr_code
    AppiumLibrary.Wait Until Element Is Visible    id=android:id/title    20 seconds
    AppiumLibrary.Click Element    id=android:id/title
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next    20 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    10 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password    20 seconds
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    147321
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    147321
    Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next    20 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Remove File    ${FILE_PATH}
    Run Process    adb shell rm ${DESTINATION_PATH}    shell=True
    Sleep    5 seconds
    AppiumLibrary.Close Application
Přihlášení do Můj Profil (MŮJ PROFIL)
    Open Chrome With Disable Search Engine Choice Screen    https://dev1-login.kb.cz/
    Maximize Browser Window
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    20 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id=login    20 seconds
    Select Frame    id=login
    Sleep    2 seconds
    SeleniumLibrary.Wait Until Element Is Visible   id=name    20 seconds
    SeleniumLibrary.Press Keys    id=name    ${client-username}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Pokračovat")]
    Run keyword and Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    id:phoneNumber   20 seconds
    Run keyword and Ignore Error    SeleniumLibrary.Input Text    id:phoneNumber    608${client-phone-number}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Pokračovat")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Přihlásit se jiným způsobem")]    20 seconds   20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Přihlásit se jiným způsobem")]    20 seconds
    Unselect Frame
    Execute JavaScript    window.open('https://dev1-caas.kb.cz/otptestaccess', '_blank');
    Switch Window    url=https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    20 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${client-ID}")]    20 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${client-ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=/html/body/caas-test-otp-access-app/div/sa-otp-detail/div[2]/div[6]/div/p
    ${OTP2}=    Set Variable    ${OTP2}[0:6]
    Switch Window    url=https://dev1-mujprofil.kb.cz/self-service/login
    Select Frame    id=login
    Sleep    1 second
    SeleniumLibrary.Input Text    id:otp    ${OTP2}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Potvrdit")]
    Unselect Frame
    Sleep    4 seconds