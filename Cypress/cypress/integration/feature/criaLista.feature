Feature: Criar lista


Background: Acessar a tela de login
    Given acessei a tela de login

Scenario: Deve ser possivel criar uma ou várias listas
    When informei os dados necessarios para criar uma lista
    Then visualizo a confirmacao de lista criada