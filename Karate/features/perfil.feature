Feature: Perfil de usuario
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Entrar no sistema
        #cria o usuário e faz login com o mesmo

        * def usuarioAleatorio = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginUsuario = call read("../utils/loginUsuarioAleatorio.feature") usuarioAleatorio
        Given url baseUrl
        And header X-JWT-Token = loginUsuario.tokenAuth

    Scenario: Validar se encontra o usuario pelo id
        Given path "users"
        And path usuarioAleatorio.idUser
        When method get
        Then status 200
        And match response contains { email : "#(usuarioAleatorio.email)" }
    
    Scenario: Atualizar nome e email do perfil
        * def novoUsuarioAleatorio = call read("../utils/retornarUsuarioAleatorio.feature")
        Given path "users"
        Given request { name: "#(novoUsuarioAleatorio.name)" , email: "#(novoUsuarioAleatorio.email)"}
        Given method put
        Then status 200
        And match response.name != usuarioAleatorio.name
    
    Scenario: Atualizar nome do usuario excedendo o numero de caracteres
        Given path "users"
        Given request { name: "EstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrela" , email: "#(usuarioAleatorio.email)"}
        Given method put
        Then status 400
        And match response contains { error : "Nome maior que 60 caracteres" }
    
    Scenario: Atualizar email do usuario excedendo o numero de caracteres
        Given path "users"
        Given request { name: "#(usuarioAleatorio.name)" , email: "vinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificoba@gmail.com"}
        Given method put
        Then status 400
        And match response contains { error : "E-mail maior que 100 caracteres" }
    
    Scenario: Atualizar dados do usuario excedendo o numero de caracteres
        Given path "users"
        Given request { name: "EstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrela" , email: "vinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificoba@gmail.com"}
        Given method put
        Then status 400
    
    Scenario: Atualizar dados do usuario com um email já existente
        Given path "users"
        Given request { name: "#(usuarioAleatorio.name)" , email: "elaine@email.com"}
        Given method put
        Then status 422 
        And match response contains { error: "E-mail already in use." }

    Scenario: Atualizar dados do usario deixando a barra em branco
        Given path "users"
        Given request { name: "" , email: ""}
        Given method put
        Then status 500
        And match response contains { error: "An error ocurred." }

    Scenario: Atualizar dados do usuario com email inválido
        Given path "users"
        Given request { name: "#(usuarioAleatorio.name)" , email: "email.invalido.com"}
        Given method put
        Given status 400
        And match response contains { error: "Bad request." }




    