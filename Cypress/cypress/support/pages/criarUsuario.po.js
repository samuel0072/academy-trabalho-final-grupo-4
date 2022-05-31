class CriarUsuario {

    id = "1b0b06e5-6c35-48c5-851a-7ec51969241b"
    btnRegistro = ".sc-crXcEl"
    btnCadastrar = ".sc-ftvSup"
    mensagemCadastroExistente = "User already exists."
    mensagemCadastroErrado = "Bad request."

    visitar() {
        cy.visit("")
    }

    visitarTelaCadastroUsuario() {
        cy.get(this.btnRegistro).click()
    }

    clickRegistrarUsuario() {
        cy.contains("button", "Registrar").click()
    }

    preencherNome(nome) {
        cy.get("input[name='name'").type(nome)
    }

    preencherEmail(email) {
        cy.get("input[name='email'").type(email)
    }

    preencherSenha(senha) {
        cy.get("input[name='password'").type(senha)
    }

    preencherConfirmaSenha(confirmaSenha) {
        cy.get("input[name='confirmPassword'").type(confirmaSenha)
    }

    preencherCadastro(nome, email, senha, confirmaSenha) {
        this.preencherNome(nome)
        this.preencherEmail(email)
        this.preencherSenha(senha)
        this.preencherConfirmaSenha(confirmaSenha)
    }

    preencherCadastroSemConfirmaSenha(nome, email, senha) {
        this.preencherNome(nome)
        this.preencherEmail(email)
        this.preencherSenha(senha)
    }

    verificaUsuarioSalvoComSucesso() {
        cy.contains("Usuário criado com sucesso!").should("be.visible")
    }

    verificaErroConfirmaSenha() {
        cy.contains("Informe sua senha").should("be.visible")
    }

    verificaErroSenhaGrande() {
        cy.contains("Informe no máximo 30 caracteres.").should("be.visible")
    }

    verificaErroNomeGrande() {
        cy.contains("Informe no máximo 100 letras no seu nome").should("be.visible")
    }

    verificaErroEmailGrande() {
        cy.contains("Informe no máximo 60 letras no seu e-mail").should("be.visible")
    }

    verificaErroEmailInvalido() {
        cy.contains("Formato de e-mail inválido.").should("be.visible")
    }

    verificaUsuarioExistente() {
        cy.contains("Este e-mail já é utilizado por outro usuário.").should("be.visible")
    }

    interceptarCadastroCorreto(nome, email) {
        cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
            statusCode: 201,
            body: [{
                "id": this.id,
                "name": nome,
                "email": email,
                "is_admin": false
            }]
        })
    }

    interceptarCadastroExistente() {
        cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
            statusCode: 422,
            body: { "error": this.mensagemCadastroExistente }
        })
    }

    interceptarCadastroErrado() {
        cy.intercept("https://lista-compras-api.herokuapp.com/api/v1/users", {
            statusCode: 422,
            body: { "error": this.mensagemCadastroErrado }
        })
    }

}

export var criarUsuario = new CriarUsuario()
