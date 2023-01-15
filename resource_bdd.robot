*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${TIMEOUT}                           10
${URL}                               https://www.amazon.com.br
${MENU_ELETRONICOS}                  //a[text()='Eletrônicos']
${BOTAO_ADICIONAR_CARRINHO}          add-to-cart-button
${BOTAO_EXCLUIR_CARRINHO}            //input[@value='Excluir']
${BOTAO_IR_CARRINHO}                 //a[@data-csa-c-type='button'][contains(., 'Ir para o carrinho')]

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

Quando adicionar o produto "Playstation 5" no carrinho
    Input Text                       twotabsearchtextbox    Playstation 5
    Click Element                    nav-search-submit-button
    Wait Until Element Is Visible    //span[contains(., 'Console PlayStation®5')]
    Click Element                    //div[@data-index='2']
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_CARRINHO}  
    Click Element                    ${BOTAO_ADICIONAR_CARRINHO}

Então o produto "Playstation 5" deve ser mostrado no carrinho
    Wait Until Element Is Visible    //span[contains(., 'Adicionado ao carrinho')]

E remover o produto "Playstation 5" do carrinho
    Wait Until Element Is Visible    ${BOTAO_IR_CARRINHO}
    Click Element                    ${BOTAO_IR_CARRINHO}
    Wait Until Element Is Visible    ${BOTAO_EXCLUIR_CARRINHO}        
    Click Element                    ${BOTAO_EXCLUIR_CARRINHO}

Então o carrinho deve ficar vazio
    Element Should Be Visible        //h1[contains(., 'Seu carrinho de compras da Amazon está vazio.')]
