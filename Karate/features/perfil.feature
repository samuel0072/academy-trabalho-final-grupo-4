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
