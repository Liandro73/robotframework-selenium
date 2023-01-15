*** Settings ***
Documentation          Essa suíte testa o site da Amazon.com.br
Resource               resource.robot
Test Setup             Abrir o navegador
Test Teardown          Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]    Este cenário valida o menu eletrônicos do site Amazon.com.br
    [Tags]             regressivo    menus
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de Teste 02 - Pesquisa de Produto
    [Documentation]    Este cenário valida o busca de um produto
    [Tags]             regressivo    busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo pesquisa
    Clicar no botão pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation®5"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             regressivo    adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo pesquisa
    Clicar no botão pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation®5"
    Adicionar o produto "Playstation 5" no carrinho
    Verificar se o produto "Playstation 5" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             regressivo    remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo pesquisa
    Clicar no botão pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation®5"
    Adicionar o produto "Playstation 5" no carrinho
    Verificar se o produto "Playstation 5" foi adicionado com sucesso
    Remover o produto "Playstation 5" do carrinho
    Verificar se o carrinho fica vazio