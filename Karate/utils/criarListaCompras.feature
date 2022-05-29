@ignore
Feature: Criar Lista de Compras Vazia
    Scenario: Criar lista vazia
        * def lista = { description : "Descrição", items: [] }
        Given url baseUrl
        And header X-JWT-Token = tokenAuth
        And path "list"
        # cria uma lista sem itens 
        # por que a inserção de itens vai ser testada depois
        And request lista
        When method post
