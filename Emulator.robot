*** Settings ***
Library    AppiumLibrary
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    Collections
Library    Process

*** Variables ***
${PIN} =    147321
${login} =    DSLAB\\e_mvysko
${heslo} =    Pr0ject_NemlaZ_0002
${FILE_PATH}      C:/Users/vasek/Documents/Robot/qr_code.png
${DESTINATION_PATH}    /sdcard/Download/qr_code.png
${ID}=    9851826433
${username}    ZitbBVV
${telcislo}    608 399 948
*** Keywords ***

Element Click
    [Arguments]    ${locator}    ${library}
    Run Keyword If    '${library}' == 'SeleniumLibrary'    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10 seconds
    ...    ELSE IF    '${library}' == 'AppiumLibrary'    AppiumLibrary.Wait Until Element Is Visible    ${locator}    10 seconds
    Run Keyword If    '${library}' == 'SeleniumLibrary'    SeleniumLibrary.Click Element    ${locator}
    ...    ELSE IF    '${library}' == 'AppiumLibrary'    AppiumLibrary.Click Element    ${locator}
Generator ID a tel. cisla a jmena
        ${ID}=    Generate Random String   10    123456789
        Set Global Variable    ${ID}
        ${telcislo}=    Generate Random String   6    123456789
        Set Global Variable    ${telcislo}
        ${Name}    Generate random string    7    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
        Set Global Variable    ${Name}

Generator username
    ${username}    Generate random string    7    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
    Set Global Variable    ${username}

Open Chrome With Disabled Search Engine Choice Screen
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-search-engine-choice-screen
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}
Otevři KB Admin
    [Arguments]    ${login}    ${heslo}
    Open Chrome With Disabled Search Engine Choice Screen    https://dev1-caas.kb.cz/
    Maximize Browser Window
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    10 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:details-button    5 seconds
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id:userNameInput    5 seconds
    SeleniumLibrary.Input Text    id:userNameInput    ${login}
    SeleniumLibrary.Click Element    id:nextButton
    SeleniumLibrary.Input Text    id:passwordInput    ${heslo}
    SeleniumLibrary.Click Element    id:submitButton

Vyhledej Účet
    [Arguments]    ${ID}
    SeleniumLibrary.Wait Until Element Is Visible    id:query    5 seconds
    SeleniumLibrary.Input Text    id:query   ${ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${ID}")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${ID}")]

Otestuj Akci
    [Arguments]    ${název-akce}
    SeleniumLibrary.Wait Until Element Is Visible    class:kb-linkbox__inner    5 seconds
    SeleniumLibrary.Click Element    class:kb-linkbox__inner
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${název-akce}")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${název-akce}")]
    Run keyword and Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary.mt-2    5 seconds
    Run keyword and Ignore Error    SeleniumLibrary.Click Element    class:btn.btn-primary.mt-2
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Podpis dokumentu")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
    SeleniumLibrary.Click Element    name:bu10453

*** Test Cases ***

založení nového klienta (KB ADMIN)
        Generator ID a tel. cisla a jmena
        Otevři KB Admin    ${login}    ${heslo}
        SeleniumLibrary.Wait Until Element Is Visible    id:query    5 seconds
        SeleniumLibrary.Input Text    id:query    .
        SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
        SeleniumLibrary.Wait Until Element Is Visible    name:bu9680    5 seconds
        SeleniumLibrary.Click Element    name:bu9680
        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Zvolte")]    5 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Zvolte")]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "ČR (0100)")]
        
        SeleniumLibrary.Input Text    id:bu10372    ${ID}
        
        SeleniumLibrary.Input Text    id:bu0306    ${Name}

        SeleniumLibrary.Input Text    id:bu9698    ${Name}

        SeleniumLibrary.Input Text    id:bu0985    8.6.2000

        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[4]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Muž")]

        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[5]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Občanský průkaz")]

        ${číslo-dokladu}    Generate random string    24    0123456789
        SeleniumLibrary.Input Text    id:bu3344    ${číslo-dokladu}

        SeleniumLibrary.Input Text    id:bu10881    .

        SeleniumLibrary.Input Text    id:bu0314    5.5.2008

        SeleniumLibrary.Input Text    id:bu10844    6.9.2069

        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[6]
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Česká republika")]

        SeleniumLibrary.Input Text    id:bu0032    ${Name}
        SeleniumLibrary.Input Text    id:bu0033    ${Name}

        ${PSČ}    Generate random string    5    0123456789
        SeleniumLibrary.Input Text    id:bu9701    ${PSČ}

        SeleniumLibrary.Click Element    xpath=(//div[contains(@class, 'form-select__container')])[7]
        SeleniumLibrary.Click Element    xpath=(//*[contains(@class, 'js-select-value')])[426]

        SeleniumLibrary.Click Element    name:bu9702

        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Sjednat")]    5 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Sjednat")]

        SeleniumLibrary.Wait Until Element Is Visible    id:phone    5 seconds
        SeleniumLibrary.Input Text    id:phone    608${telcislo}
        SeleniumLibrary.Input Text    id:email    vasa.sulc@gmail.com
        Sleep    1 second
        SeleniumLibrary.Click Element    class:btn.btn-primary
        SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "Podpis dokumentu")]    5 seconds
        SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]
        SeleniumLibrary.Click Element    name:bu10453
        Log  ${ID}  console=True

Aktivace KB klíče
    Generator username
    AppiumLibrary.Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run keyword and Ignore Error    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Page Contains Element    id=cz.kb.paat.kbdev1:id/button_manually
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_manually
    Otevři KB Admin    ${login}    ${heslo}
    SeleniumLibrary.Wait Until Element Is Visible    id:query    5 seconds
    SeleniumLibrary.Input Text    id:query   ${ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${ID}")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "KB Klíč")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "KB Klíč")]
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-primary    5 seconds
    SeleniumLibrary.Click Element    class:btn.btn-primary
    Execute JavaScript    document.getElementById('signed').click();
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]
    ${OTP1}=      SeleniumLibrary.Get Text    xpath=(//strong[contains(@class, 'kb-h-semibold') and contains(@class, 'kb-h-font--bigger')])[2]
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_username
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_username    ${ID}
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/edt_activation_code
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_activation_code    ${OTP1}
    Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next    5 seconds
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    10 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary    5 seconds
    SeleniumLibrary.Click Element    class:btn.btn-secondary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //*[contains(text(), "${ID}")]    5 seconds
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "${ID}")]
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Run Keyword And Ignore Error    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_nickname    5 seconds
    Run Keyword And Ignore Error    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_nickname    ${username}
    Hide Keyboard
    Run Keyword And Ignore Error    AppiumLibrary.Click Element    cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    ${PIN}
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    ${PIN}
    Hide Keyboard
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Sleep    5 seconds
    AppiumLibrary.Close Application
Deativace KB Klíče (KB ADMIN)
    Otevři KB Admin    ${login}    ${heslo}
    Vyhledej Účet    ${ID}
    Otestuj Akci    Deaktivovat metodu
Aktivace KB klíče pomocí QR
    AppiumLibrary.Open Application    http://localhost:4723   platformName=Android    deviceName=emulator-5554    appPackage=cz.kb.paat.kbdev1    appActivity=cz.kb.paat.ui.MainActivity    automationName=UiAutomator2
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    Element Click    id=cz.kb.paat.kbdev1:id/button_manually    AppiumLibrary
    Otevři KB Admin    ${login}    ${heslo}
    SeleniumLibrary.Wait Until Element Is Visible    id:query    5 seconds
    SeleniumLibrary.Input Text    id:query   ${ID}
    SeleniumLibrary.Click Button     class:btn.btn-primary.btn-icon
    Element Click    xpath: //*[contains(text(), "${ID}")]    SeleniumLibrary
    Element Click    xpath: //*[contains(text(), "KB Klíč")]    SeleniumLibrary
    Element Click    class:btn.btn-primary    SeleniumLibrary
    Element Click    xpath: //*[contains(text(), "Dokument byl podepsán klientem.")]    SeleniumLibrary
    SeleniumLibrary.Click Element    class:btn.btn-primary
    SeleniumLibrary.Wait Until Element Is Visible    xpath: //img[@title='Jednorázový kód']    5 seconds
    SeleniumLibrary.Scroll Element Into View    xpath: //*[contains(text(), "Po úspěšném načtení aktivačních údajů")]
    SeleniumLibrary.Capture Element Screenshot    xpath: //img[@title='Jednorázový kód']    qr_code.png
    Run Process    adb push ${FILE_PATH} ${DESTINATION_PATH}    shell=True
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_scan_qr_code
    Element Click    id=com.android.permissioncontroller:id/permission_allow_one_time_button    AppiumLibrary
    Element Click    id=cz.kb.paat.kbdev1:id/toolbar_button_load_qr_code    AppiumLibrary
    Element Click    id=android:id/title    AppiumLibrary
    Element Click    id=cz.kb.paat.kbdev1:id/button_next    AppiumLibrary
    Sleep    10 seconds
    Go To   https://dev1-caas.kb.cz/otptestaccess
    Element Click    class:btn.btn-secondary    SeleniumLibrary
    Element Click    xpath: //*[contains(text(), "${ID}")]    SeleniumLibrary
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=(//p[contains(@class, 'form-control-static')])[6]
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_verification_code    ${OTP2}
    Hide Keyboard
    AppiumLibrary.Click Element    id=cz.kb.paat.kbdev1:id/button_next
    AppiumLibrary.Wait Until Element Is Visible    id=cz.kb.paat.kbdev1:id/edt_new_password
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password    ${PIN}
    AppiumLibrary.Input Text    id=cz.kb.paat.kbdev1:id/edt_new_password2    ${PIN}
    Hide Keyboard
    Element Click    id=cz.kb.paat.kbdev1:id/button_next    AppiumLibrary
    Remove File    ${FILE_PATH}
    Run Process    adb shell rm ${DESTINATION_PATH}    shell=True
    Sleep    5 seconds
    AppiumLibrary.Close Application
Přihlášení do Můj Profil
    Open Chrome With Disabled Search Engine Choice Screen    https://dev1-login.kb.cz/
    Maximize Browser Window
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    Element Click    id:details-button    SeleniumLibrary
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    id=login    5 seconds
    Select Frame    id=login
    Sleep    1 second
    SeleniumLibrary.Wait Until Element Is Visible   id=name    5 seconds
    SeleniumLibrary.Press Keys    id=name    ${username}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Pokračovat")]
    SeleniumLibrary.Wait Until Element Is Visible    id:phoneNumber   5 seconds
    SeleniumLibrary.Input Text    id:phoneNumber    ${telcislo}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Pokračovat")]
    Run keyword and Ignore Error    Element Click    xpath: //*[contains(text(), "Přihlásit se jiným způsobem")]    SeleniumLibrary
    Unselect Frame
    Execute JavaScript    window.open('https://dev1-caas.kb.cz/otptestaccess', '_blank');
    Switch Window    url=https://dev1-caas.kb.cz/otptestaccess
    SeleniumLibrary.Click Element    id:details-button
    SeleniumLibrary.Click Element    id:proceed-link
    SeleniumLibrary.Wait Until Element Is Visible    class:btn.btn-secondary
    Element Click    class:btn.btn-secondary    SeleniumLibrary
    Element Click    xpath: //*[contains(text(), "${ID}")]    SeleniumLibrary
    SeleniumLibrary.Wait Until Element Is Visible    class:form-control-static
    ${OTP2}=      SeleniumLibrary.Get Text    xpath=/html/body/caas-test-otp-access-app/div/sa-otp-detail/div[2]/div[6]/div/p
    ${OTP2}=    Set Variable    ${OTP2}[0:6]
    Switch Window    url=https://dev1-mujprofil.kb.cz/self-service/login
    Select Frame    id=login
    Sleep    500 milliseconds
    SeleniumLibrary.Input Text    id:otp    ${OTP2}
    SeleniumLibrary.Click Element    xpath: //*[contains(text(), "Potvrdit")]
    Unselect Frame
    Sleep    5 seconds
