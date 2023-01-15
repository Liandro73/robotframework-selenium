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

Acessar a home page do site Amazon.com.br
    Go To                            ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element                    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${TEXTO_PAGINA}"
    Wait Until Element Is Visible    //h1[text()='${TEXTO_PAGINA}']

Verificar se o título da página fica "${TITULO_PAGINA}"
    Title Should Be                  ${TITULO_PAGINA}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible        //a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo pesquisa
    Input Text                       twotabsearchtextbox    ${PRODUTO}

Clicar no botão pesquisa
    Click Element                    nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    //span[contains(., '${PRODUTO}')]

Adicionar o produto "Playstation 5" no carrinho
    Click Element                    //div[@data-index='2']
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_CARRINHO}  
    Click Element                    ${BOTAO_ADICIONAR_CARRINHO}

Verificar se o produto "Playstation 5" foi adicionado com sucesso
    Wait Until Element Is Visible    //span[contains(., 'Adicionado ao carrinho')]

Remover o produto "Playstation 5" do carrinho
    Wait Until Element Is Visible    ${BOTAO_IR_CARRINHO}
    Click Element                    ${BOTAO_IR_CARRINHO}
    Wait Until Element Is Visible    ${BOTAO_EXCLUIR_CARRINHO}        
    Click Element                    ${BOTAO_EXCLUIR_CARRINHO}

Verificar se o carrinho fica vazio
    Element Should Be Visible        //h1[contains(., 'Seu carrinho de compras da Amazon está vazio.')]