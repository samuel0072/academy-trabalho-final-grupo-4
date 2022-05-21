Feature: Gestão de Lista de Compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Entrar no sistema
        Given visitei o sistema Lembra Compras
        And fiz login com minha conta

    Scenario Outline: Adicionar um item novo com sucesso à lista
        And acessei a lista de compras
        When informo os dados do item 
        | nome       | <nome>       |
        | quantidade | <quantidade> |
        And o adiciono na lista
        Then a lista possui aquele item com aquele <nome> e <quantidade>

        Examples:
        | nome            | quantidade |
        | Queijo          | 100        |
        #quantidade máxima
        | Batata          | 1000       | 
        | Pacote de leite | 2          |
        | Café            | 6          |
        | Óleo            | 1          |
