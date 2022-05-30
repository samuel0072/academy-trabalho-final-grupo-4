class login {
    inputEmail = ":nth-child(2) > .sc-kDDrLX";
    inputSenha = ":nth-child(3) > .sc-kDDrLX";
    btnEntrar = ".sc-ftvSup";
    
    visitar() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
    }
    informaSenha(senha) {
        cy.get(this.inputSenha).type(senha);
    }

    preencherEmail(email) {
        cy.get(this.inputEmail).type(email);
    }
    clicarBtnEntrar() {
        cy.contains("button", "Entrar").click();
    }


}

export var realizaLogin = new login();