Feature: Criar Usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Realizar Registro no sistema Lembra Compras
        Given acessei a tela de registro

    Scenario: Registro de um usuário no sistema com sucesso
        When informo os dados do usuário com nome, email, senha
            | nome          | Ludmilla                 |
            | email         | ludraroacademy@gmail.com |
            | senha         | r@ro2                    |
            | confirmaSenha | r@ro2                    |
        Then visualizo uma mensagem de sucesso

    Scenario: Registro de um usuário no sistema sem confirmar senha
        When informo os dados do usuário com nome, email e confirma senha em branco
            | nome  | Ludmilla                 |
            | email | ludraroacademy@gmail.com |
            | senha | r@ro2                    |
        Then visualizo a mensagem de erro da senha

    Scenario: Não deve ser possível cadastrar uma senha com mais de 30 caracteres
        When informo os dados do usuário com nome, email e senha maior de 30 caracteres
            | nome          | Ludmilla                        |
            | email         | ludraroacademy@gmail.com        |
            | senha         | r@ro2r@ro2r@ro2r@ro2r@ro2r@ro2r |
            | confirmaSenha | r@ro2r@ro2r@ro2r@ro2r@ro2r@ro2r |
        Then visualizo a mensagem de erro senha grande

    Scenario: Não deve ser possível realizar um cadastro com formato inválido de e-mail
        When informo os dados do usuário com nome, senha e formato de email inválido
            | nome          | Raro Excelencia            |
            | email         | raroex@raro!academy.com.br |
            | senha         | r@ro2                      |
            | confirmaSenha | r@ro2                      |
        Then visualizo uma mensagem de erro formato do email

    Scenario: Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário
        When informo os dados de um usuário com email já cadastrado
            | nome          | Raro Excelencia           |
            | email         | raroex@raroacademy.com.br |
            | senha         | r@ro2                     |
            | confirmaSenha | r@ro2                     |
        Then visualizo uma mensagem de erro usuário já existente

    Scenario: Não deve ser possível cadastrar um nome com mais de 100 caracteres
        When informo os dados de um usuário com email, senha e nome maior de 100 caracteres
            | nome          | RaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroLabsRaroL |
            | email         | raroex@raroacademy.com.br                                                                             |
            | senha         | r@ro2                                                                                                 |
            | confirmaSenha | r@ro2                                                                                                 |
        Then visualizo uma mensagem de erro nome muito grande

    Scenario: Não deve ser possível cadastrar um email com mais de 60 caracteres
        When informo os dados de um usuário com nome, senha e email maior de 60 caracteres
            | nome          | RaroLabs                                                      |
            | email         | raroacademyraroacademyraroacademyraroaacademyraroa@raro.com.br |
            | senha         | r@ro2                                                         |
            | confirmaSenha | r@ro2                                                         |
        Then visualizo uma mensagem de erro email muito grande
