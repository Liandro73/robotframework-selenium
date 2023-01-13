*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${TIMEOUT}                           10
${URL}                               https://www.amazon.com.br
${MENU_ELETRONICOS}                  //a[text()='Eletrônicos']

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

Dado que estou na home page da Amazon.com.br
    Go To                            ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}
    Title Should Be                  Amazon.com.br | Tudo pra você, de A a Z.

Quando acessar o menu "${TEXTO_PAGINA}"
    Click Element                    ${MENU_ELETRONICOS}
    Wait Until Element Is Visible    //h1[text()='Eletrônicos e Tecnologia']

Então o título da página deve ficar "${TITULO_PAGINA}"
    Title Should Be                  ${TITULO_PAGINA}

E o texto "${TEXTO_PAGINA}" deve ser exibido na página
    Wait Until Element Is Visible    //h1[text()='${TEXTO_PAGINA}']

E a categoria "${NOME_CATEGORIA}" deve ser exibida na página    
    Element Should Be Visible        //a[@aria-label='${NOME_CATEGORIA}']

Quando pesquisar pelo produto "${PRODUTO}"
    Input Text                       twotabsearchtextbox    ${PRODUTO}
    Click Element                    nav-search-submit-button

Então um produto da linha "${PRODUTO}" deve ser mostrado na página
    Wait Until Element Is Visible    //span[contains(., '${PRODUTO}')]