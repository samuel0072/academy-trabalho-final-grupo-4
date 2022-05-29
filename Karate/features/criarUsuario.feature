Feature: Criar Usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Realizar Registro no sistema Lembra Compras
        Given url baseUrl

    Scenario: Registro de um usuário no sistema com sucesso
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + "@email.com"
        * def password = java.util.UUID.randomUUID() + ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 201
        * def resp = response
        And match response == { id: "#(resp.id)", name: "#(resp.name)", email: "#(resp.email)", is_admin: "#(resp.is_admin)" }

    Scenario: Registro de um usuário no sistema sem senha
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + "@email.com"
        * def password = ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível cadastrar uma senha com mais de 30 caracteres
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + "@email.com"
        * def password = "minhasenha123minhasenha123minhasenha123"
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível realizar um cadastro com formato inválido de e-mail
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + ".email.com"
        * def password = java.util.UUID.randomUUID() + ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + "@email.com"
        * def password = java.util.UUID.randomUUID() + ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        * def createUser2 = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 201
        And request createUser2
        And path "/users"
        When method post
        Then status 422
        And match response == { "error": "User already exists."}

    Scenario: Não deve ser possível cadastrar um nome com mais de 100 caracteres
        * def name = "Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco"
        * def email = java.util.UUID.randomUUID() + "@email.com"
        * def password = java.util.UUID.randomUUID() + ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível cadastrar um email com mais de 60 caracteres
        * def name = java.util.UUID.randomUUID() + ""
        * def email = java.util.UUID.randomUUID() + "@email.commmmmmmmmmmmmmmmmmmmmmmmmm"
        * def password = java.util.UUID.randomUUID() + ""
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        And path "/users"
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

