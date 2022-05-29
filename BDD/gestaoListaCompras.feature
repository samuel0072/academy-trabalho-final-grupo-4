Feature: Gestão de Lista de Compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar.

    Background: Entrar no sistema
        Given visitei o sistema Lembra Compras
        And fiz login com minha conta

    Scenario Outline: Criar Lista de compras sem itens
        When crio uma nova lista de compras com descrição
        | descricao | <desc> |
        Then a lista é adicionada ao sistema com a descrição <desc>

        Examples:
            | desc             |
            | Lista de compras |
            #lista sem descrição abaixo
            |                  |
    
    Scenario Outline: Criar Lista de compras com itens
        When crio uma nova lista de compras com descrição e alguns itens
        | quantidade de itens | <quantItens> |
        | descricao           | <desc>       |
        Then a lista é adicionada com sucesso ao sistema

        Examples:
           | quantItens | desc  |
           | 1          | Lista |
           | 100        |       | 
           | 50         |  kajs |


    Scenario Outline: Adicionar um item novo com sucesso à lista
        And acessei a lista de compras ativa
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

    Scenario Outline: Adicionar o mesmo item de novo
        And acessei a lista de compras ativa
        And adicionei o item na lista
        | nome | <nome> |
        | quantidade | <quantidade> |
        When informo os dados do item
        | nome | <nome> |
        | quantidade | <novaQuant> |
        And o adiciono na lista
        Then a lista possui aquele item com aquele <nome> e <quantAtualizada>

        Examples:
            | nome   | quantidade | novaQuant | quantAtualizada | 
            | Batata | 1          | 1         | 2               |
            | Arroz  | 100        | 800       | 900             |
            | Arroz  | 900        | 100       | 1000            | 
            | Arroz  | 1000       | 1         | 1000            |

    Scenario Outline: Adiciona quantidade inválidas de itens
        And acessei a lista de compras ativa
        When informo os dados do item
        | nome | <nome> |
        | quantidade | <quantidade> |
        And o adiciono na lista
        Then a lista não é atualizada com o item

        Examples:
        | nome     | quantidade |
        | Arroz    | 0          |
        | Batata   | -1         |
        | Café     | 1001       |
        | Leite    | 99,99      | 
        | Maracujá | aaaa       |

    Scenario: Adicionar item sem nome
        And acessei a lista de compras ativa
        When informo somente a quantidade de um item
        And o adiciono na lista
        Then a lista não é atualizada com o item

    Scenario: Marcar item como concluído
        And salvei uma lista
        When concluo um item 
        Then o item aparece como concluído

    Scenario: Finalizar lista de compras
        And salvei uma lista
        When finalizo a lista de compras
        Then a lista vai para o histórico
        And fica inativa
