import { criaLista } from "../pages/lista"


Given("acessei a tela de login", () => {
    criaLista.visitar();
});

When("informei os dados necessarios para criar uma lista", () => {
    criaLista.informaNomeLista("lista testeeee");
    criaLista.informmaNomeItem("Item 1");
    criaLista.clicaBtnAddItem();
    criaLista.clicarBtnSalvar();
});

Then("visualizo a confirmacao de lista criada", () => {

    cy.url()
    .should('be.equal', 'https://academy-lembra-compras.herokuapp.com/lista')

});