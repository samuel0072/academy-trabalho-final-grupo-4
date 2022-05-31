import { criarUsuario } from "../pages/CriarUsuario.po"

Given("acessei a tela de registro", () => {
    criarUsuario.visitar()
    criarUsuario.visitarTelaCadastroUsuario()
})

// Scenario 1 - Registro de um usuário no sistema com sucesso
When("informo os dados do usuário com nome, email, senha", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroCorreto(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo uma mensagem de sucesso", () => {
    criarUsuario.verificaUsuarioSalvoComSucesso()
})

//Scenario 2 - Registro de um usuário no sistema sem confirmar senha
When("informo os dados do usuário com nome, email e confirma senha em branco", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.preencherCadastroSemConfirmaSenha(dado.nome, dado.email, dado.senha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo a mensagem de erro da senha", () => {
    criarUsuario.verificaErroConfirmaSenha()
})

//Scenario 3 - Não deve ser possível cadastrar uma senha com mais de 30 caracteres

When("informo os dados do usuário com nome, email e senha maior de 30 caracteres", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroErrado()
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo a mensagem de erro senha grande", () => {
    criarUsuario.verificaErroSenhaGrande()
})

//Scenario 4 - Não deve ser possível realizar um cadastro com formato inválido de e-mail

When("informo os dados do usuário com nome, senha e formato de email inválido", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroErrado()
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo uma mensagem de erro formato do email", () => {
    criarUsuario.verificaErroEmailInvalido()
})

//Scenario 5 - Não deve ser possível cadastrar um usuário com e-mail já utilizado no cadastro de outro usuário
When("informo os dados de um usuário com email já cadastrado", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroExistente()
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo uma mensagem de erro usuário já existente", () => {
    criarUsuario.verificaUsuarioExistente()
})

//Scenario 6 - Não deve ser possível cadastrar um nome com mais de 100 caracteres

When("informo os dados de um usuário com email, senha e nome maior de 100 caracteres", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroErrado()
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo uma mensagem de erro nome muito grande", () => {
    criarUsuario.verificaErroNomeGrande()
})

//Scenario 7 - Não deve ser possível cadastrar um email com mais de 60 caracteres

When("informo os dados de um usuário com nome, senha e email maior de 60 caracteres", (dados) => {
    let dado = dados.rowsHash()
    criarUsuario.interceptarCadastroErrado()
    criarUsuario.preencherCadastro(dado.nome, dado.email, dado.senha, dado.confirmaSenha)
    criarUsuario.clickRegistrarUsuario()
})

Then("visualizo uma mensagem de erro email muito grande", () => {
    criarUsuario.verificaErroEmailGrande()
})
