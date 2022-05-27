Feature: Gestão de Lista de Compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Entrar no sistema
        #cria o usuário e faz login com o mesmo

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
