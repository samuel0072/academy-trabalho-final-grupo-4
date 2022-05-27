Feature: login
Como um usuário com conta no sistema
Desejo realizar meu acesso na aplicação
Para conseguir utilizar os serviços do Lembra Compras.

Scenario: Realizando login no Sistema Lembra Compras com dados cadastrados
Given url "https://lista-compras-api.herokuapp.com/api/v1"
And path "auth", "login"
And form field email = "vinicius.pacificoba@gmail.com"
And form field password = "123456789"
When method post
Then status 200