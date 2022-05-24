Feature: Criar Usuário
Como uma pessoa qualquer
Desejo me registrar no sistema
Para ter acesso as funcionalidades de lista de compras

Background: Realizar Registro
    Given acessei a tela de registro


Scenario: Registro de um usuário no sistema com sucesso
    When informo os dados do usuario com nome, email, senha válidos.
    | nome  | Ludmilla                |
    | email | ludraroacademy@gmail.com|
    | senha | r@ro2                   |
    And confirmo a verificação de senha
    | senha | r@ro2                   |
    And clico em 'registrar'
    Then visualizo a mensagem 'Usuário criado com sucesso!'.

Scenario: Registro de usuário no sistema sem confirmar senha.
    When informo os dados do usuario com nome, email e senha.
    | nome  | Ludmilla                |
    | email | ludraroacademy@gmail.com|
    | senha | r@ro2                   |
    And clico em 'registrar'
    Then visualizo a mensagem no campo de confirmar senha 'Informe sua senha'

Scenario: Não deve ser possível realizar um cadastro com formato inválido de e-mail.
    When informo os dados do usuario com nome, e-mail, senha.
    | email | grilla@luds!.com.br |
    | nome  | Grilla              |
    Then visualizo uma mensagem de erro no campo de "e-mail": 'Formato de e-mail inválido.'

Scenario: Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário.
    When informo os dados de um usuario com email já cadastrado
    | nome  | Raro Excelencia          |
    | email | raroex@raroacademy.com.br|
    | senha | r@ro2                    |
    Then visualizo uma mensagem de erro no campo de "e-mail":'Este e-mail já é utilizado por outro usuário.'

Scenario: Não deve ser possível cadastrar um nome com mais de 100 caracteres.
    When informo os dados do usuario com o nome com mais de 100 caracteres
    | nome  | LudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLd |
    | email | raroex@raroacademy.com.br|
    | senha | r@ro2                    |
    Then visualizo uma mensagem de erro no campo "nome": 'Informe no máximo 100 letras no seu nome'


Scenario: Não deve ser possível cadastrar um email com mais de 60 caracteres.
    When informo os dados do usuario com o email com mais de 60 caracteres
    | nome  | Ludmilla                                                              |
    | email | LudLudLudLudLudLudLudLudLudLudLudLudLudLudLudLudludludmaria@gmail.com |
    | senha | ludsa                                                                 |
    Then visualizo uma mensagem no campo "email":'Usuário criado com sucesso!'