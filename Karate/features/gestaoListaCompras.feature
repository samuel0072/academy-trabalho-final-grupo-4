Feature: Gestão de Lista de Compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Entrar no sistema
        # cria o usuário e faz login com o mesmo

        * def usuarioAleatorio = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginUsuario = call read("../utils/loginUsuarioAleatorio.feature") usuarioAleatorio

        * def listaFormato = { description: "##string", items: "#array"}
        * def itemFormato = {id: "#string", listId: "#string", name: "#string", amount: "#number", createdAt: "#string", updatedAt: "#string"}

        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
    
    
    Scenario Outline: Criar Lista de compras | lista: <desc>
        And path "list"
        # cria uma lista sem itens 
        # por que a inserção de itens vai ser testada depois
        And request { description : "#(desc)", items: [] }
        When method post
        # valida se foi criada
        Then match responseStatus == 201

        #agora válida se a lista é retornada corretamente pela API
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
        And path "list"
        When method get 
        #verifica o formato da lista
        Then match responseStatus == 200
        And match response == listaFormato
        And match response.description == desc

        # desativa a lista criada para não atrapalhar os próximos teste
        * call read("../utils/desativarListaCompras.feature") loginUsuario

        Examples:
            | desc             |
            | Lista de compras |
            #lista sem descrição abaixo
            | |
    
    
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
        * set item.id = "#string"
        * set item.listId = "#string"
        * set item.createdAt =  "#string"
        * set item.updatedAt = "#string"

        Then match response == listaFormato
        And match each response.items == itemFormato
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

    Scenario Outline: Adicionar o mesmo item de novo | item: <nome>
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginUsuario
        And path "list"
        And path "item"
        * def item = {name:"#(nome)" , amount: <quantidade>}
        # configura os dados do item no request body
        And request item
        When method post 

        # agora adiciono o item novamente
        # coma nova quantidade
        * set item.amount = novaQuant
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
        And path "list"
        And path "item"
        And request item
        When method post 
        # A api só retorna código de sucesso
        Then match responseStatus == 201

         # agora obtem a lista e verifica se o item está na lista
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
        And path "list"
        When method get 

        #verifica se realmente o item foi atualizado
        * set item.amount = quantAtualizada
         #formato da resposta 
        * set item.id = "#string"
        * set item.listId = "#string"
        * set item.createdAt =  "#string"
        * set item.updatedAt = "#string"
        And match response.items contains item

        # desativa a lista criada para não atrapalhar o próximo teste
        * call read("../utils/desativarListaCompras.feature") loginUsuario

        Examples:
                | nome   | quantidade! | novaQuant! | quantAtualizada! | 
                | Batata | 1          | 1         | 2               |
                | Arroz  | 100        | 800       | 900             |
                | Arroz  | 900        | 100       | 1000            | 
                #esse teste falha pois a especificação não cita nenhuma mensagem de erro ou de sucesso sobre isso
                | Arroz  | 1000       | 1         | 1000            |

    Scenario: Adicionar item sem nome
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginUsuario
        * def item = {name:"" , amount: 1}
        # configura os dados do item no request body
        And path "list"
        And path "item"
        And request item
        When method post 
        Then match responseStatus == 400
        Then match response == {"error" : "Bad request."}

    Scenario Outline: Adiciona quantidade inválidas de itens | quantidade: <quantidade>
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginUsuario
        * def item = {name:"#(nome)" , amount: <quantidade>}
        
        And path "list"
        And path "item"
        And request item
        When method post 

        Then match responseStatus == 400
        Then match response == {error : "Bad request."}

        # desativa a lista criada para não atrapalhar o próximo teste
        * call read("../utils/desativarListaCompras.feature") loginUsuario

        Examples:
        | nome     | quantidade! | 
        | Arroz    | 0          | 
        | Batata   | -1         | 
        | Café     | 1001       | 
        | Leite    | 99.99      | 
        | Maracujá | aaaa       |
        | Leite    | true       |

    Scenario: Finalizar lista de compras
        * def listaCriada = call read("../utils/criarListaCompras.feature") loginUsuario
        And path "list"
        And method patch
        Then match responseStatus == 204

        #verifico se a lista aparece no histórico como inativa
        * def lista = listaCriada.lista

        * def historico = {id: "#string", userId: "#(usuarioAleatorio.idUser)",  description: "#(lista.description)", active: false, createdAt: "#string", updatedAt: "#string"}
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth
        And path "list"
        And path "history"
        When method get
        Then match responseStatus == 200
        And match response contains historico
        
