Feature: login
Como um usuário com conta no sistema
Desejo realizar meu acesso na aplicação
Para conseguir utilizar os serviços do Lembra Compras.

    Background: Acessar aplicação 
        * def usuarioAleatorio = call read("../utils/criarUsuarioAleatorio.feature")
        Given url baseUrl
        #* def loginAleatorio = call read("../utils/loginUsuarioAleatorio.feature") usuarioAleatorio 

        Scenario: Realizando login no Sistema Lembra Compras com dados cadastrados
            And path "auth", "login"
            And form field email = usuarioAleatorio.createdUser.email
            And form field password = usuarioAleatorio.createdUser.password
            When method post
            Then status 200

        Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes
            And path "auth", "login"
            And form field email = "fazol@gmail.com"
            And form field password = "1902"
            When method post
            Then status 403

        Scenario: Realizando login no Sistema Lembra Compras com formato inválido
            And path "auth", "login"
            And form field email = "fazolgmail.com"
            And form field password = "1902"
            When method post
            Then status 403

        Scenario: Realizando login apenas com email
            And path "auth", "login"
            And form field email = usuarioAleatorio.createdUser.email
            When method post
            Then status 400

        Scenario: Realizando login apenas senha 
            And path "auth", "login"
            And form field password = usuarioAleatorio.createdUser.password
            When method post
            Then status 400

