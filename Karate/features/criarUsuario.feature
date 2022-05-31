Feature: Criar Usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Realizar Registro no sistema Lembra Compras
        Given url baseUrl
        And path "/users"

    Scenario: Registro de um usuário no sistema com sucesso
        * def user = read("../utils/usuario.json")
        And request user
        When method post
        Then status 201
        * def resp = response
        And match response == { id: "#(resp.id)", name: "#(resp.name)", email: "#(resp.email)", is_admin: "#(resp.is_admin)" }

    Scenario: Registro de um usuário com caracteres especiais no nome
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "@%%@#", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Registro de um usuário com senha de 1 caractere
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "a"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Registro de um usuário no sistema sem senha
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: ""}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Registro de um usuário no sistema sem nome
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Registro de um usuário no sistema sem email
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível cadastrar uma senha com mais de 30 caracteres
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(user.email)", password: "minhasenha123minhasenha123minhasenha123"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível realizar um cadastro com formato inválido de e-mail
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "email.email.com", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário
        * def user = call read("../utils/criarUsuarioAleatorio.feature")
        * def createUser = { name: "#(user.createdUser.name)", email: "#(user.createdUser.email)", password: "#(user.createdUser.password)"}
        And request createUser
        When method post
        Then status 422
        And match response == { "error": "User already exists."}

    Scenario: Não deve ser possível cadastrar um nome com mais de 100 caracteres
        * def userName = "Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco Nome Gigantesco"
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(userName)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Deve ser possível cadastrar nomes de usuários com menos ou até 100 caracteres
        * def userName = "RaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaro"
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(userName)", email: "#(user.email)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 201
        * def resp = response
        And match response == { id: "#(resp.id)", name: "#(resp.name)", email: "#(resp.email)", is_admin: "#(resp.is_admin)" }

    Scenario: Não deve ser possível cadastrar um email com mais de 60 caracteres
        * def userEmail = java.util.UUID.randomUUID() + "@email.commmmmmmmmmmmmmmmmmmmmmmmmm"
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(userEmail)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 400
        And match response == { "error": "Bad request."}

    Scenario: Deve ser possível cadastrar emails com menos ou até 60 caracteres
        * def userEmail = java.util.UUID.randomUUID() + "@email.commmmmmmmmmmmmmm"
        * def user = read("../utils/usuario.json")
        * def createUser = { name: "#(user.name)", email: "#(userEmail)", password: "#(user.password)"}
        And request createUser
        When method post
        Then status 201
        * def res = response
        And match response == { id: "#(res.id)", name: "#(res.name)", email: "#(res.email)", is_admin: "#(res.is_admin)" }
