*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
@{MONTHS}                            
...                                  Janeiro    Fevereiro    Março    Abril    Maio    Junho
...                                  Julho    Agosto    Setembro    Outubro    Novembro    Dezembro
&{MONTHS_NUMBER_OF_DAYS}             
...                                  mes_1=Janeiro      dias_mes_1=31
...                                  mes_2=Fevereiro    dias_mes_2=28
...                                  mes_3=Março        dias_mes_3=31
...                                  mes_4=Abril        dias_mes_4=30
...                                  mes_5=Maio         dias_mes_5=31
...                                  mes_6=Junho        dias_mes_6=30
...                                  mes_7=Julho        dias_mes_7=31
...                                  mes_8=Agosto       dias_mes_8=31
...                                  mes_9=Setembro     dias_mes_9=30
...                                  mes_10=Outubro     dias_mes_10=31
...                                  mes_11=Novembro    dias_mes_11=30
...                                  mes_12=Dezembro    dias_mes_12=31

*** Test Cases ***
Caso de Teste 01 - Imprimindo meses do ano
    [Documentation]    Este cenário imprime os meses do ano no Console
    [Tags]             imprimindo_meses
    Log To Console     ${MONTHS[0]}
    Log To Console     ${MONTHS[1]}
    Log To Console     ${MONTHS[2]}
    Log To Console     ${MONTHS[3]}
    Log To Console     ${MONTHS[4]}
    Log To Console     ${MONTHS[5]}
    Log To Console     ${MONTHS[6]}
    Log To Console     ${MONTHS[7]}
    Log To Console     ${MONTHS[8]}
    Log To Console     ${MONTHS[9]}
    Log To Console     ${MONTHS[10]}
    Log To Console     ${MONTHS[11]}

Caso de Teste 02 - Imprimindo meses do ano
    [Documentation]    Este cenário imprime os meses do ano com a quantidade de dias no Console
    [Tags]             imprimindo_meses_dias
    Log To Console     O mês 1 é: ${MONTHS_NUMBER_OF_DAYS.mes_1} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_1} dias
    Log To Console     O mês 2 é: ${MONTHS_NUMBER_OF_DAYS.mes_2} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_2} dias
    Log To Console     O mês 3 é: ${MONTHS_NUMBER_OF_DAYS.mes_3} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_3} dias
    Log To Console     O mês 4 é: ${MONTHS_NUMBER_OF_DAYS.mes_4} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_4} dias
    Log To Console     O mês 5 é: ${MONTHS_NUMBER_OF_DAYS.mes_5} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_5} dias
    Log To Console     O mês 6 é: ${MONTHS_NUMBER_OF_DAYS.mes_6} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_6} dias
    Log To Console     O mês 7 é: ${MONTHS_NUMBER_OF_DAYS.mes_7} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_7} dias
    Log To Console     O mês 8 é: ${MONTHS_NUMBER_OF_DAYS.mes_8} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_8} dias
    Log To Console     O mês 9 é: ${MONTHS_NUMBER_OF_DAYS.mes_9} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_9} dias
    Log To Console     O mês 10 é: ${MONTHS_NUMBER_OF_DAYS.mes_10} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_10} dias
    Log To Console     O mês 11 é: ${MONTHS_NUMBER_OF_DAYS.mes_11} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_11} dias
    Log To Console     O mês 12 é: ${MONTHS_NUMBER_OF_DAYS.mes_12} que contém: ${MONTHS_NUMBER_OF_DAYS.dias_mes_12} dias