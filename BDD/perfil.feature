Feature: Perfil de usuario 
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar a aplicação de perfil
        Given acessei aplicação Lembra compras 
        And realizei login
    
        Scenario: Atualizar nome e email do perfil
            When acesso a pagina perfil
            And visualizo a barra de nome e email
            And Altero o nome e email do usuario por um novo 
            | nome  | Estrela                       |
            | email | vinicius.pacificoba@gmail.com |
            And visualizo mensagem uma mensagem de confirmacao
            And confirmo
            Then visualizo mensagem de sucesso 

        Scenario: Atualizar dados do usuario excedendo o numero de caracteres
            When acesso a pagina perfil
            And visualizo a barra de nome e email
            And altero o nome e o email do usuário excedendo o numero de caracteres permitidos 
            | nome | EstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrela                                                                      |
            | email| vinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificoba@gmail.com |
            Then visualizo um erro sobre o nome
            And visualizo um erro sobre o email

        Scenario: Atualizar dados do usuario para um email já existente
            When acesso a pagina Perfil
            And visualizo a barra de nome e email
            And altero o email do usuario para um já existente 
            | email | perigomann@hotmail.com |
            And confirmo as alterações
            Then a pagina depois de atualizada volta com o email que estava antes 

        Scenario: Atualizar dados do usario deixando a barra em branco
            When acesso a pagina Perfil
            And atualizo o nome e email
            | nome  | |
            | email | |
            Then os dados não são atualizados

        Scenario: Atualizar dados do usuario com email inválido 
            When acesso a pagina Perfil
            And altero o email do usuario para um inválido
            | email | perigomannhmail.com |
            Then o email não é atualizado