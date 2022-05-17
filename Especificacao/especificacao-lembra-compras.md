![Logo Raro Academy](./images/logo.jpeg)

# Especificação Lembra Compras

## 1. Definições

O propósito do sistema ***Lembra Compras*** é ser uma aplicação que auxiliará seus usuários a lembrarem de produtos a serem comprados durante a ida à a comércios do dia à dia, como supermercados, padarias, mercearias, etc.

Os usuários podem se cadastrar para ter acesso a aplicação, o que permitirá que possam cadastrar suas listas de compras e, posteriormente, consultar as compras que já foram feitas anteriormente, permitindo controle e reutilização destas informaçõs para a elaboração de listas futuras.

A aplicação conta com funcionalidades para atender a estas expectativas:

1. Criar usuário;
2. Login com usuário cadastrado;
3. Edição de perfil;
4. Gestão de lista de compras;
5. Histórico de lista de compras;

[Link para o site](https://academy-lembra-compras.herokuapp.com/)

[Link para o Swagger](https://lista-compras-api.herokuapp.com/api-docs)

## 2. *Users stories* e critérios de aceite utilizados

### 2.1. Criar usuário

| *User story* | Critérios de aceite |
| -----------  | ------------------- |
| **Como** uma pessoa qualquer<br>**Desejo** me registrar no sistema<br>**Para** ter acesso as funcionalidades de lista de compras | 1. As informações necessárias para cadastrar um usuário são: ``nome``, `email` e ``senha``; |
| - | 2. No processo de cadastro, o usuário deve ser solicitado para realizar a confirmação da senha. Se a senha não for confirmada, não deve ser possível concluir o cadastro; |
| - | 3. O formato aceito de e-mail segue o padrão `nomeUtilizador@dominio`.<br>Exemplo: ``nome@email.com``.<br>Se o e-mail informado possuir um formato inválido, a operação de registro deverá ser cancelada; |
| - | 4. Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário; |
| - | 5. Se houver a tentativa de cadastrar um usuário com e-mail já existente, o processo deverá ser bloqueado com a mensagem: ``User already exists.``; | 
| - | 6. Não deve ser possível cadastrar um nome com mais de 100 caracteres; |
| - | 7. Não deve ser possível cadastrar um e-mail com mais de 60 caracteres. |

### 2.2. Login

| *User story* | Critérios de aceite |
| -----------  | ------------------- |
| **Como** um usuário com conta no sistema<br>**Desejo** realizar meu acesso na aplicação<br>**Para** conseguir utilizar os serviços do Lembra Compras. | 1. O login deve ser feito utilizando informações de ``email`` e ``senha`` do cadastro de usuário. |
| - | 2. Caso o ``email`` e ``senha`` utilizado no login coincidam com o cadastrado na base de dados, o usuário deve ser autenticado e deve ter acesso às demais funcionalidades. |
| - | 3. Caso o ``email`` ou ``senha`` utilizado no login não coincidam com o cadastrado na base de dados, a operação de login deve ser recusada. |


### 2.3. Perfil

| *User story* | Critérios de aceite |
| -----------  | ------------------- |
| **Como** um usuário com conta no sistema<br>**Desejo** atualizar minhas informações básicas<br>**Para** manter meus dados atualizados no sistema. | 1. O cliente precisa estar logado para realizar a atualização de suas informações. |
| - | 2. O cliente deve ser capaz de atualizar apenas seu próprio ``nome`` e ``email``.
| - | 3. O novo ``email`` do cliente não deve coincidir com um ``email`` já utilizado por outro usuário. |
| - | 4. Não deve ser possível atualizar o nome para que tenha mais de 100 caracteres. |
| - | 5. Não deve ser possível atualizar o e-mail para que tenha mais de 60 caracteres. | 

### 2.4. Gestão de lista de compras

| *User story* | Critérios de aceite |
| -----------  | ------------------- |
| **Como** um usuário com conta no sistema<br>**Desejo** gerenciar uma lista de compras<br>**Para** registrar os produtos que desejo comprar. | 1. Apenas usuários logados podem criar uma lista; |
| - | 2. Só deve ser possível possuir uma lista ativa por vez; |
| - | 3. As listas devem ser compostas por uma ``descrição`` e por uma lista de ``itens`` que identificam os produtos a serem comprados; |
| - | 4. Os itens da lista possuem apenas ``nome`` e ``quantidade``; |
| - | 5. Deve ser possível criar uma lista sem ``descrição``, dado que pelo menos um item tenha sido adicionado; |
| - | 6. A quantidade mínima de um item na lista deve ser de ``1 unidade``; |
| - | 7. A quantidade máxima de um item na lista deve ser de ``1000 unidades``. |
| - | 8. Se um item que já existe na lista sofrer uma nova tentativa de ser adicionado utilizando o mesmo ``nome``, a quantidade do item deve ser acrescentada; |
| - | 9. Ao atualizar a quantidade do item, a nova quantidade total atualizada deste item não deve ultrapassar de ``1000 unidades``; |
| - | 10. O usuário deve poder marcar um item como concluído; |
| - | 11. O usuário pode finalizar a lista de compras. O status da lista não pode ser alterado após ter sido finalizada; |

### 2.5. Histórico de lista de compras

| *User story* | Critérios de aceite |
| -----------  | ------------------- |
| **Como** um usuário com conta no sistema<br>**Desejo** consultar minhas últimas listas de compra<br>**Para** visualizar minhas últimas compras | 1. O usuário só deve visualizar as suas próprias listas; |
| - | 2. O usuário precisa estar logado para visualizar seu histórico; |
| - | 3. Apenas as últimas 10 listas mais recentes devem ser listadas no histórico; |
| - | 4. O nome da lista e data de criação da mesma devem ser listados para o usuário; |
| - | 5. Deve ser possível consultar o ``nome`` e ``itens`` de uma lista após interagir com a lista no Histórico. |