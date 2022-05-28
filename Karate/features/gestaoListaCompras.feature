Feature: Gestão de Lista de Compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Entrar no sistema
        # cria o usuário e faz login com o mesmo

        * def usuarioAleatorio = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginUsuario = call read("../utils/loginUsuarioAleatorio.feature") usuarioAleatorio
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth

    Scenario Outline: Criar Lista de compras
        And path "list"
        # cria uma lista sem itens 
        # por que a inserção de itens vai ser testada depois
        And request { description : desc, items: [] }
        When method post
        # valida se foi criada
        Then match responseStatus == 201

        Examples:
            | desc             |
            | Lista de compras |
            #lista sem descrição abaixo
            |                  |

    Scenario Outline: Adicionar um item novo com sucesso à lista | item: <nome>
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginUsuario
        And path "list"
        And path "item"

        * def item = {name:"#(nome)" , amount: <quantidade>}
        # configura os dados do item no request body
        And request item
        When method post 
        # A api só retorna código de sucesso
        Then match responseStatus == 201

        # agora obtem a lista e verifica se o item está na lista
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
        And path "list"
        When method get 

        #formato da resposta 
        * def responseFormat = { description: "#string", items: "#array"}
        * def itemsFormat = {id: "#string", listId: "#string", name: "#string", amount: "#number", createdAt: "#string", updatedAt: "#string"}
        * set item.id = "#string"
        * set item.listId = "#string"
        * set item.createdAt =  "#string"
        * set item.updatedAt = "#string"

        Then match response == responseFormat
        And match each response.items == itemsFormat
        And match response.items contains item

        # desativa a lista criada para não atrapalhar o próximo teste
        * call read("../utils/desativarListaCompras.feature") loginUsuario

        Examples:
            | nome            | quantidade |
            | Queijo          | 100        |
            #quantidade máxima
            | Batata          | 1000       |
            | Pacote de leite | 2          |
            | Café            | 6          |
            | Óleo            | 1          |
