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
        Given path usuarioAleatorio.idUser
        When method get
        Then status 200
    
