@ignore
Feature: Desativar lista de compras ativa
    Scenario:
        Given url baseUrl
        And header X-JWT-Token = tokenAuth
        And path "list"
        When method patch
