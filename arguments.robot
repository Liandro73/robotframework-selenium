*** Settings ***
Documentation              Exemplo de uso de variáveis como argumentos em Keywords
Library                    FakerLibrary    locale=pt_BR

*** Variables ***
&{USUARIO}                 nome=Dernival Liandro
...                        email=dernival.liandro@teste.com
...                        idade=31
...                        sexo=masculino
&{USUARIO_MENOR}           nome=Alicia Liandro
...                        email=alicia.liandro@teste.com
...                        idade=10
...                        sexo=feminino
&{USUARIO_NOVO_EMAIL}      nome=Elainy    sobrenome=Rodrigues


*** Test Cases ***
Caso de Teste 01 - Imprimindo meses do ano
    [Documentation]        Este cenário imprime no Console Keywords com argumentos
    [Tags]                 keywords_argumentos
    Keyword Teste 01

Caso de Teste 02 - Criando email
    [Documentation]        Este cenário cria um email com os parâmetros recebidos e imprime no Console
    [Tags]                 novo_email
    Criando email          ${USUARIO_NOVO_EMAIL.nome}    ${USUARIO_NOVO_EMAIL.sobrenome}  

*** Keywords ***
Keyword Teste 01
    Subkeyword             ${USUARIO.nome}    ${USUARIO.email}
    ${MENSAGEM_ALERTA}     Subkeyword com retorno    ${USUARIO_MENOR.nome}    ${USUARIO_MENOR.idade}
    Log To Console         ${MENSAGEM_ALERTA}  

Subkeyword
    [Arguments]            ${NOME_USUARIO}    ${EMAIL_USUARIO}
    Log To Console         Nome Usuário: ${NOME_USUARIO}
    Log To Console         Email Usuário: ${EMAIL_USUARIO}

Subkeyword com retorno
    [Arguments]            ${NOME_USUARIO}    ${IDADE_USUARIO}
    ${MENSAGEM}            Set Variable If    ${IDADE_USUARIO}<18    Não Autorizado! O usuário ${NOME_USUARIO} é menor de idade!    Autorizado! O usuário ${NOME_USUARIO} é maior de idade!
    [Return]               ${MENSAGEM}

Criando email
    ${EMAIL_SUFIXO}        FakerLibrary.Last Name Female
    [Arguments]            ${STRING_EMAIL_1}    ${STRING_EMAIL_2}
    Log To Console         ${STRING_EMAIL_1}${STRING_EMAIL_2}${EMAIL_SUFIXO}@testerobot.com