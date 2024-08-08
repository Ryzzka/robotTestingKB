# INSTALACE

## PYTHON
1)	Stáhneme si **[Python](https://www.python.org/downloads/)** a stažený soubor spustíme jako admin
2)	Po otevření souboru zaškrtneme **Add Python to PATH** a klikneme na **Install Now**
3)	Po nainstalování Pythonu otevřeme příkazový řádek a zadáme do něj následující příkazy:
```
python --version
pip --version
```

Pokud se Python nainstaloval správně, zobrazí se vám po zadání těchto příkazů jeho verze.
```
Python 3.12.4
pip 24.2 from C:\Users\vasek\AppData\Local\Programs\Python\Python312\Lib\site-packages\pip (python 3.12)
```
 Může se stát, že se v příkazovém řádku objeví výzva ke stažení aktualizaci. V tomto případě použijeme příkaz
```
 pip install --upgrade pip
```

## VISUAL STUDIO CODE
1)	Stáhneme a nainstalujeme si **[Visual Studio Code](https://code.visualstudio.com/)**
2)	Do něj si stáhneme následující rozšíření: **Pylance, Python, Python Debugger, Robocorp Code, Robot Framework**
3)	U rozšíření **Robocorp Code** klikneme na ozubené kolečko a následně klikneme na **Extension settings**
4)	Zde hledáme kolonku **Language-server: Python**, do které vložíme naši cestu k Pythonu:
```
C:\Users\VAŠEJMÉNO\AppData\Local\Programs\Python\Python312\python.exe
```
5) 	Kroky 3 a 4 zopakujeme u rozšíření Robot Framework Language Server


## ROBOT FRAMEWORK, SELENIUM LIBRARY A APPIUM LIBRARY
1)	Nejprve je zapotřebí si stáhnout a nainstalovat **[Java 8](https://www.java.com/en/download/) a [Node.js](https://nodejs.org/en)**
2)	Do příkazového řádku následně zadáme příkazy:
```
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-appiumlibrary
npm install appium-doctor -g
npm install -g appium
pip install selenium
```

3)	Pomocí Windows Search vyhledáme **Upravit proměnné prostředí systému** a klikneme na první výsledek
4)	Dole klikneme na **Proměnné prostředí…** a pod sekcí **Uživatelské proměnné** klikneme na **Nová…**
5)	Do této sekce přidáme dvě nové položky:

Název: **ANDROID_HOME** <br />
Hodnota: **C:\Users\VAŠEJMÉNO\AppData\Local\Android\Sdk**

Název: **JAVA_HOME** <br />
Hodnota: **C:\Program Files\Java\jre1.8.0_421** <br />
*Poznámka: Verze Javy se může lišit*

6)	Otevřeme si složku **Path** a klikneme na **Nový**
7)	Sem přidáme následujících pět položek:
```
%ANDROID_HOME%\emulator
%ANDROID_HOME%\tools
%ANDROID_HOME%\tools\bin
%ANDROID_HOME%\platform-tools
C:\Program Files\nodejs\
```
8)	Založíme si složku na projekty. Na jménu či umístění nezáleží.
9)	Otevřeme Visual Studio Code, klikneme na **File > Open File > JMÉNOSLOŽKY**
10)	Klikneme na **File > New File > NÁZEV.robot** <br />
	*Poznámka: Na názvu opět nezáleží. Důležitá je přípona .robot*

## WEB DRIVERS
### Chrome
1)	Přejdeme na **[tuto stránku](https://googlechromelabs.github.io/chrome-for-testing/#stable)**
2)	Vlevo hledáme **chromedriver pro win64**
3)	Zkopírujeme si link napravo a vložíme ho do kolonky hledání
4)	Stažený soubor extrahujeme a soubor **chromedriver.exe** vložíme do naší složky na projekty

## ANDROID STUDIO
1)	Stáhneme a nainstalujeme si **[Android Studio](https://developer.android.com/studio)**
2)	Založíme si nový prázdný projekt
3)	Vpravo klikneme na **Device Manager** a zde klikneme na ikonu + **(Add a new device)**. Zde si vybereme libovolný model telefonu	
4)	Spustíme emulátor a přihlásíme se do něj Google účtem
5)	Otevřeme obchod play a z něj si stáhneme aplikaci s názvem **APK Info**
6)	Taktéž si do emulátoru přesuneme aplikaci **KB Klíč (DEV1)**. Poté můžeme emulátor vypnout
7)	Nakonec restartujeme počítač pro aplikování všech změn

## ČASTÉ PROBLÉMY
### Android Studio
1)	Při pokusu o přihlášení do aplikace KB Klíč se zobrazí hláška **Nemáte povolený tester**
-	V emulátoru otevřeme **[následující stránku](https://www.mobilnibanka.cz/tester/)**, kam se přihlásíme
- Následně restartujeme emulátor: **Device Manager > Tři tečky vedle modelu telefonu > Cold Boot**

2)	Capture Screenshot Error


