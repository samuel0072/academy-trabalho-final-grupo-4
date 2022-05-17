![Logo Raro Academy](./images/logo.jpeg)

# Trabalho Final

Para realizar este trabalho, você deve considerar a especificação do sistema [Lembra Compras](./especificacao-lembra-compras.md).

## 1. Objetivo do trabalho

O Objetivo do trabalho final é avaliar os conhecimentos acumulados durante todo o curso. Você irá praticar o que aprendeu sobre:

1. Métodos de teste;
2. Documentação viva com BDD e Gherkin;
3. Testes de API;
4. Testes ponto à ponto;
5. Trabalho e interação em equipe

## 2. Grupos

Os alunos serão dividos em grupos. Os membros de cada grupo devem trabalhar em conjunto entre si para realizarem a entrega do trabalho.

## 3. Enunciado

### 2.1. BDD
Considerando a especificação do sistema [Lembra Compras](./especificacao-lembra-compras.md), analise as *users storires* e critérios de aceite documentados e documente cenários no formato de Gherkin que poderiam ser utilizados para testar estes critérios no sistema.

Obs: Considere que estes arquivos Gherkin serão utilizados para automação Web.

### 2.2. Testes funcionais e exploratórios
Considerando o roteiro de testes definido em seu BDD, realize testes funcionais no sistema web do [Lembra Compras](https://academy-lembra-compras.herokuapp.com/).

Realize também testes exploratórios no sistema, de forma a encontrar problemas não inteiramente ligados à especificação, mas que possam impactar o usuário por perda de usabilidade, navegação inconsistente, mensagens incorretas, validações de formulário, etc.

Documente os erros e/ou insonsistências encontrados em um board no Trello.

### 2.3. Testes automatizados de API com Karate Framework
Crie um projeto de testes de API com o Karate Framework, que valide os critérios de aceite implementados na API do Lembra Compras. [Link do Swagger](https://lista-compras-api.herokuapp.com/api-docs)

### 2.4. Testes automatizados de Frontend com Cypress
Crie um projeto de testes de Frontend utilizando o framework Cypress.

O projeto Cypress deve ser configurado para integrar com os arquivos de Feature criados na questão ``2.1. BDD``.

Implemente testes que validem estas funcionalidades no sistema web do [Lembra Compras](https://academy-lembra-compras.herokuapp.com/).

## 4. Avaliação
- Os grupos serão pontuados coletivamente: será avaliado se as questões foram respondidas conforme solicitado;
- Os integrantes serão avaliados individualmente, de acordo com a contribuição, para o resultado alcançado. Ou seja, as notas do trabalho final serão individuais, ponderando a pontuação do grupo de acordo com a contribuição individual de cada integrante.
A única exceção é a nota da Apresentação, que será a mesma para todos os integrantes.

## 5. Entrega

O trabalho possui 4 artefatos principais:

1. BDD;
2. Board do trello com os registros de teste funcional e exploratório;
3. Projeto de testes de API com Karate Framework;
4. Projeto de testes de Frontend Web com Cypress.

O grupo deve criar um repositorio no Github, com visualização ``Pública``, para que seja possível acompanhar a entrega dos artefatos.

O nome do repositório deve seguir o padrão ``academy-trabalho-final-grupo-NUMERO_DO_SEU_GRUPO``.

Neste repositório, obrigatoriamente, os artefatos ``1``, ``3`` e ``4`` devem ser disponibilizados.

O artefato ``2`` pode ser disponibilizado através de link de convite de acesso ao board do Trello, que pode ser enviado junto do link do repositório durante a entrega da atividade no Classroom.

Para uma boa entrega esperamos que os integrantes do grupo se comuniquem, ajudando uns aos outros, e revisando as entregas, garantindo a melhor qualidade possível


## 6. Apresentação - Banca Final (dia 31/05 - 3ª feira às 19h)

- 10 minutos de apresentação por grupo;
- 10 minutos para comentários e perguntas da banca;
- Banca composta pelos instrutores + Alguma(s) pessoa(s) de referência técnica da Raro Labs;
- A nota final para este critério será a média das notas de cada membro da banca;
- A nota da Apresentação será a mesma para todos os integrantes do grupo;
- Dicas: 
	- Eleger um porta-voz ou distribuir bem o tempo para que todos possam falar
	- Produzir slides e materiais visuais