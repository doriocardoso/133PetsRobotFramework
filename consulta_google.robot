*** Settings ***
Documentation    Testes de consulta no buscador do Google
...   abre o navegador Chrome
...   e realiza a consulta

Library     SeleniumLibrary

*** Test Cases ***
Consulta Google
    [Tags]    rapido
    Acessar o Chrome na pagina <http://www.google.com.br>
    Digitar na pesquisa "Ovos de Páscoa"
    Validar que "Ovos de Páscoa" aparece no titulo da guia
    Fechar o browser

*** Keywords ***
Acessar o ${browser} na pagina <${url}>
    open browser       ${url} ${browser}

Digitar "${palavra_chave}" na pesquisa
    Set Test Variable  ${palavra_chave}
    input text      name = q        ${palavra_chave}
    press key       name = q        ENTER

Validar se aparece no titulo da guia o resultado esperado
    ${titulo} = get title
    Should contain  ${titulo}       ${palavra_chave}

Fechar o browser
    close browser
