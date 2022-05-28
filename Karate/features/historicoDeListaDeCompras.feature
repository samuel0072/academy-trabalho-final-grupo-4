    Feature: Histórico de lista de compras
        Como um usuário com conta no sistema
        Desejo consultar minhas últimas listas de compra
        Para visualizar minhas últimas compras

    Background: Logar no sistema
        #cria o usuário e faz login com o mesmo
    
        * def usuarioCriado = call read("../utils/criarUsuarioAleatorio.feature")
        * def loginCriado = call read("../utils/loginUsuarioAleatorio.feature") usuarioCriado
        Given url baseUrl 
        Given header X-JWT-Token = loginCriado.tokenAuth
    
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





