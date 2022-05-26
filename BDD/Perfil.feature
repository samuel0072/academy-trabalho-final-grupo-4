Feature: Perfil de usuario 
  Como um usuário com conta no sistema
  Desejo atualizar minhas informações básicas
  Para manter meus dados atualizados no sistema.

Background: Acessar a aplicação de perfil
  Given acessei aplicação Lembra compras 
  And realizei login
  
Scenario: Atualizar nome e email do perfil
  When acesso a pagina perfil
  And visualizo a barra de nome e email
  And Altero o nome e email do usuario por um novo 
  | nome  | Estrela                       |
  | email | vinicius.pacificoba@gmail.com |
  And visualizo mensagem "Tem certeza que deseja alterar suas informações ?"
  And confirmo
  Then visualizo mensagem "Informações atualizadas com sucesso!"

  Scenario: Atualizar dados do usuario excedendo o numero de caracteres
  When acesso a pagina perfil
  And visualizo a barra de nome e email
  And altero o nome e o email do usuário excedendo o numero de caracteres permitidos 
  | nome | EstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrelaEstrela                                                                      |
  | email| vinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificobavinicius.pacificoba@gmail.com |
  Then visualizo a mensagem abaixo do campo nome "Informe no máximo 100 letras no seu nome"
  And visualizo a mensagem abaixo do campo email "Informe no máximo 100 caracteres."

Scenario: Atualizar dados do usuario para um email já existente
  When acesso a pagina Perfil
  And visualizo a barra de nome e email
  And altero o email do usuario para um já existente 
  | email | perigomann@hotmail.com |
  And visualizo mensagem "Tem certeza que deseja alterar suas informações ?"
  And confirmo
  Then a pagina depois de atualizada volta com o email que estava antes 

Scenario: Atualizar dados do usario deixando a barra em branco
  When acesso a pagina Perfil
  And visualizo a barra de nome e email
  And apago o nome e email 
  Then visualizo a mensagem abaixo do campo de nome "Informe seu nome"
  And visualizo a mensagem abaixo do campo de email "Informe seu e-mail"

Scenario: Atualizar dados do usuario com email inválido 
  When acesso a pagina Perfil
  And visualizo a barra de nome e email
  And altero o email do usuario para um inválido
  | email | perigomannhmail.com |
  Then visualizo a mensagem abiaxo do campo email "Formato de e-mail inválido."





