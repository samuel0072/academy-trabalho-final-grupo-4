Feature: Histórico de lista de compras
Como um usuário com conta no sistema
Desejo consultar minhas últimas listas de compra
Para visualizar minhas últimas compras

Background: Acessar a tela de login
    Given acessei a tela de login

Scenario: Deve ser possível realizar login com dados válidos
    When informei dados validos para login
    Then visualizo a tela inicial do sistema

