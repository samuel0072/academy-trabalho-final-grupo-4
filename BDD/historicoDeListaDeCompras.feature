Feature: Histórico de lista de compras
  Como um usuário com conta no sistema
  Desejo consultar minhas últimas listas de compra
  Para visualizar minhas últimas compras

  Background: Logar no sistema
    Given estou logado no sistema

  Scenario: O usuário só deve visualizar as suas próprias listas
    Given acessei a tela de histórico
    When possuo lista de compras castradas
    Then deve ser exibido apenas as listas do usuário logado

  Scenario: Apenas as últimas 10 listas mais recentes devem ser listadas no histórico
    Given estou na tela de histórico
    When possuo mais de 10 listas cadastradas no sistema
    Then deve ser exibido apenas as 10 listas mais recentes

  Scenario: O nome da lista e data de criação da mesma devem ser listados para o usuário
    Given estou na tela de histórico
    When possuo listas de compras cadastradas
    Then deve ser exibido o nome das listas
    And deve ser exibido a data de criação das listas

  Scenario: Deve ser possível consultar o nome e itens de uma lista após interagir com a lista no Histórico
    Given estou na tela de histórico
    When possuo listas de compras cadastradas
    And seleciono uma lista especifica
    Then deve ser possivel consultar o nome e item de uma lista
 