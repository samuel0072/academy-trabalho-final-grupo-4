Feature: Criar Usuário

Como uma pessoa qualquer
Desejo me registrar no sistema
Para ter acesso as funcionalidades de lista de compras

Background: Realizar Registro no sistema Lembra Compras
    Given acessei a tela de registro


Scenario: Registro de um usuário no sistema com sucesso
    When informo os dados do usuário com nome, email, senha
    | nome            | Ludmilla                |
    | email           | ludraroacademy@gmail.com|
    | senha           | r@ro2                   |
    And confirmo a verificação de senha
    | Confirmar senha | r@ro2                   |
    Then visualizo uma mensagem de sucesso

Scenario: Registro de um usuário no sistema sem confirmar senha
    When informo os dados do usuário com nome, email e senha
    | nome            | Ludmilla                |
    | email           | ludraroacademy@gmail.com|
    | senha           | r@ro2                   |
    | Confirmar senha |                         |
    Then visualizo a mensagem de erro

Scenario: Não deve ser possível cadastrar uma senha com mais de 30 caracteres
    When informo os dados do usuário com nome, email
    | nome            | Ludmilla                         |
    | email           | ludraroacademy@gmail.com         |
    And informo uma senha com 31 caracteres
    | senha           | r@ro2r@ro2r@ro2r@ro2r@ro2r@ro2r  |
    Then visualizo a mensagem de erro

Scenario Outline: Deve ser possível cadastrar senhas com menos ou até 30 caracteres
    When informo os dados do usuário com nome, email
    | nome  | <nome>  |
    | email | <email> |
    And informo senhas com menos ou até 30 caracteres
    | senha | <senha> |
    Then visualizo uma mensagem de sucesso 

    Examples: 
        | nome         | email                     | senha                         |
        | Ludmilla     | ludraroacademy@gmail.com  | r@ro2r@ro2r@ro2r@ro2r@ro2r@ro2|
        | Ludmilla     | ludraroacademy@gmail.com  | r@ro2r@ro2r@ro2r@ro2r@ro2r@ro |


Scenario: Não deve ser possível realizar um cadastro com formato inválido de e-mail
    When informo os dados do usuário com nome, senha.
    | nome  | Raro Excelencia            |
    | senha | r@ro2                      |
    And informo um endereço de e-mail inválido
    | email | raroex@raro!academy.com.br |
    Then visualizo uma mensagem de erro

Scenario: Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário
    When informo os dados de um usuário com email já cadastrado
    | nome  | Raro Excelencia          |
    | email | raroex@raroacademy.com.br|
    | senha | r@ro2                    |
    Then visualizo uma mensagem de erro

Scenario: Não deve ser possível cadastrar um nome com mais de 100 caracteres
    When informo os dados de um usuário com email, senha
    | email | raroex@raroacademy.com.br|
    | senha | r@ro2                    |
    And informo um nome com 101 caracteres
    | nome  | RaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroL |
    Then visualizo uma mensagem de erro

Scenario Outline: Deve ser possível cadastrar nomes de usuários com menos ou até 100 caracteres
    When informo os dados de um usuário com email, senha válidos
    | email | <email> |
    | senha | <senha> |
    And informo nomes com menos ou até 100 caracteres
    | nome  | <nome>  |
    Then visualizo uma mensagem de sucesso

    Examples:
        | email                       | senha  | nome                                                                                                |
        | raroexc@raroacademy.com.br  | r@ro2  | RaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaro|
        | raroexc@raroacademy.com.br  | r@ro2  | RaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRar |


Scenario: Não deve ser possível cadastrar um email com mais de 60 caracteres
    When informo os dados de um usuário com nome, senha
    | nome  | RaroLabs                                                     |     
    | senha | r@ro2                                                        |  
    And informo um endereço de email com 61 caracteres                                                 
    | email | raroacademyraroacademyraroacademyraroacademyraroa@raro.com.br|
    Then visualizo uma mensagem de erro

Scenario Outline: Deve ser possível cadastrar emails com menos ou até 60 caracteres
    When informo os dados de um usuário com nome, senha
    | nome  | <nome>  |
    | senha | <senha> |
    And informo endereços de emails com menos ou até 60 caracteres
    | email | <email> |
    Then visualizo uma mensagem de sucesso

    Examples:
        | nome      | senha | email                                                        |
        | RaroLabs  | r@ro2 | raroacademyraroacademyraroacademyraroacademyraro@raro.com.br |
        | RaroLabs  | r@ro2 | raroacademyraroacademyraroacademyraroacademyrar@raro.com.br  |
