*** Settings ***
Documentation          Essa suíte testa o site da Amazon.com.br
Resource               resource_bdd.robot
Test Setup             Abrir o navegador
Test Teardown          Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]    Este cenário valida o menu eletrônicos do site Amazon.com.br
    [Tags]             regressivo    menus
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de Produto
    [Documentation]    Este cenário valida o busca de um produto
    [Tags]             regressivo    busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Playstation 5"
    Então um produto da linha "Console PlayStation®5" deve ser mostrado na página