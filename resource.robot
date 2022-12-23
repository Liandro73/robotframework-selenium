*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${TIMEOUT}                           10

*** Keywords ***
Setup Selenium
    Set Selenium Timeout             ${TIMEOUT}
    Set Screenshot Directory         ./screenshots

Open Browser Chrome Parametrized
    ${CHROME_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()     sys, selenium.webdriver
    Call Method           ${CHROME_OPTIONS}     add_argument    --disable-extensions
    Call Method           ${CHROME_OPTIONS}     add_argument    --headless
    Call Method           ${CHROME_OPTIONS}     add_argument    --disable-gpu
    Call Method           ${CHROME_OPTIONS}     add_argument    --no-sandbox
    Create Webdriver      Chrome                chrome_options=${CHROME_OPTIONS}
    Set Window Size       1920                  1080

Open Browser Firefox Parametrized
    ${FIREFOX_OPTIONS}=   Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method           ${FIREFOX_OPTIONS}    add_argument    --disable-extensions
    Call Method           ${FIREFOX_OPTIONS}    add_argument    --headless
    Call Method           ${FIREFOX_OPTIONS}    add_argument    --disable-gpu
    Call Method           ${FIREFOX_OPTIONS}    add_argument    --no-sandbox
    Create Webdriver      Firefox               options=${FIREFOX_OPTIONS}
    Set Window Size       1920                  1080

Abrir o navegador
    Setup Selenium
    Open Browser Chrome Parametrized

Fechar o navegador
    Capture Page Screenshot
    Close Browser