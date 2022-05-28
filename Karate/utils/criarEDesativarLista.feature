@ignore
Feature: Criar e Desativar Lista
        * def infoAuth = {"tokenAuth": tokenAuth}
        * def listaCriada = call read ("../utils/criarListaCompras.feature") infoAuth
        Given url baseUrl 
        Given header X-JWT-Token = tokenAuth
        Given path "list"
        When method patch
