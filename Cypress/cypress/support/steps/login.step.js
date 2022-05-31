import { realizaLogin } from "../pages/login"


Given("acessei a tela de login", () => {
    realizaLogin.visitar();
});

When("informei dados validos para login", () => {
    realizaLogin.preencherEmail("lud3@gmail.com");
    realizaLogin.informaSenha("123");
    cy.wait(500);
    realizaLogin.clicarBtnEntrar();
});

Then("visualizo a tela inicial do sistema", () => {

    cy.url()
        .should('be.equal', 'https://academy-lembra-compras.herokuapp.com/lista')

});