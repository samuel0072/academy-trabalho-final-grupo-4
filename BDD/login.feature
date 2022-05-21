Feature: login

Como um usuário com conta no sistema
Desejo realizar meu acesso na aplicação
Para conseguir utilizar os serviços do Lembra Compras.


Scenario: Realizando login no Sistema Lembra Compras com dados cadastrados

        Dado que acessei o sistema na tela de login
        Quando informo minhas credenciais de usuário
        E clico em “Entrar”
        Então ocorre a autenticação para meu acesso a página inicial
        E tenho acesso ao menu de opções do sistema

Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes

        Dado que acessei o sistema na tela de login
        Quando informo e-mail não cadastrado
        E clico em “Entrar”
        Então meu acesso a página é recusado
        E a seguinte mensagem é exibida: “E-mail ou senhas incorretas.”

Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes

        Dado que acessei o sistema na tela de loginsz
        Quando informo e-mail com formato inválido
        E clico em “Entrar”
        Então meu acesso a página é recusado
        E a seguinte mensagem é exibida: “Formato de e-mail inválido.”

Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes

        Dado que acessei o sistema na tela de login
        Quando informo apenas o e-mail cadastrado
        E clico em “Entrar”
        Então meu acesso a página é recusado
        E a seguinte mensagem é exibida: “Informe sua senha”

Scenario: Realizando login no Sistema Lembra Compras com dados incorretos ou inexistentes

        Dado que acessei o sistema na tela de login
        Quando informo apenas a senha cadastrada
        E clico em “Entrar”
        Então meu acesso a página é recusado
        E a seguinte mensagem é exibida: “Informe seu e-mail”

