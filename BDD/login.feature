Feature: login

    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras.

    Background: Acessar o sistema
        Given acessei o sistema

        Scenario: Realizando login no Sistema Lembra Compras com dados cadastrados
            When informo minhas credenciais de usuário para login
            And faço o login
            Then ocorre a autenticação com sucesso
            And tenho acesso ao sistema

        Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes
            When informo e-mail não cadastrado
            And faço login
            Then o login é recusado
            And uma mensagem de erro sobre o email é retornada pelo sistema

        Scenario: Realizando login no Sistema Lembra Compras com formato inválido
            When informo e-mail com formato inválido
            And faço login
            Então o login é recusado
            And uma mensagem de erro sobre o formato do email é retornada pelo sistema

        Scenario: Realizando login apenas com email
            When informo apenas o e-mail cadastrado
            And faço login
            Então o login é recusado
            And o sistema me pede para informar a senha

        Scenario: Realizando login apenas senha 
            When informo apenas a senha cadastrada
            And faço login
            Então o login é recusado
            And o sistema me pede para informar o email


