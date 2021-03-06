Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Logar no sistema
        #cria o usuário e faz login com o mesmo

        * def usuarioCriado = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginCriado = call read("../utils/loginUsuarioAleatorio.feature") usuarioCriado
        * def usuarioAleatorio = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginUsuario = call read("../utils/loginUsuarioAleatorio.feature") usuarioAleatorio

        Given url baseUrl
        Given header X-JWT-Token = loginCriado.tokenAuth
        * def mostra = loginCriado.tokenAuth
        * print mostra


    Scenario: O usuário só deve visualizar as suas próprias listas
        Given path "list/history"
        When method get
        Then match responseStatus == 200

    Scenario: Apenas as últimas 10 listas mais recentes devem ser listadas no histórico
        #Criando 10 listas
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado
        * call read("../utils/criarEDesativarLista.feature") loginCriado

        #verifica se as 10 listas estão no histórico
        Given path "list/history"
        When method get
        Then match responseStatus == 200
        And match response == '#[10]'


    Scenario: O nome da lista e data de criação da mesma devem ser listados para o usuário
        #Cria uma lista
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginCriado
        And path "list"
        And method patch
        Then match responseStatus == 204

        #valida o nome da lista e data de criação do histório de listas de compras
        * def lista = listaCriada.lista
        * def listaHistorico = {id: "#string", userId: "#string",  description: "#(lista.description)", active: false, createdAt: "#string", updatedAt: "#string"}
        Given url baseUrl
        And header X-JWT-Token = loginCriado.tokenAuth
        And path "list"
        And path "history"
        When method get
        Then match responseStatus == 200
        And match response == "#array"
        And match response contains listaHistorico


    Scenario: Deve ser possível consultar o nome e itens de uma lista após interagir com a lista no Histórico
        
        * def gerarItens =
            """
            function(qtd) {
                var itens = [];
                    for(var i = 0; i < qtd ; i++) {
                        var itemNome = "item "+i;
                        var itemQtd = Math.floor(Math.random() * 10) + 1;
                        itens.push({
                        "name" : itemNome,
                        "amount": itemQtd
                    });
                }
                return itens;
            }
            """
        * def qtdItemGerados = 2
        * def itens = gerarItens(qtdItemGerados);
        * def lista = { description : "Gerado randomicamente", items: "#(itens)" }
        And path "list"
        And request lista
        When method post
        Then match responseStatus == 201


        Given url baseUrl
        And header X-JWT-Token = loginCriado.tokenAuth
        And path "list"
        When method get
        Then match responseStatus == 200


        * def idList  = response.items[0].listId

        Given url baseUrl
        And header X-JWT-Token = loginCriado.tokenAuth
        And path "list/history/"+idList
        When method get
        Then match responseStatus == 200
        And match response.items == '#[qtdItemGerados]'
        
        And match response.items[0].name == "item 0"
        And match response.items[0].amount != 0
        And match response.items[1].name == "item 1"
        And match response.items[1].amount != 0










