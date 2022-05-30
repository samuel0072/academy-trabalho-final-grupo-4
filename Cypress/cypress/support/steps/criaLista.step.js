import { criaLista } from "../pages/lista"


Given("acessei a tela de login", () => {
    criaLista.visitar();
});

When("informei os dados necessarios para criar uma lista", () => {
    cy.wait(100);
    criaLista.informaNomeLista("lista testeeee");
    criaLista.informmaNomeItem("Item 1");
    criaLista.clicaBtnAddItem();
    criaLista.clicarBtnSalvar();
    criaLista.clicaFinalizarLista();
    criaLista.clicaEmConfirmar();
    cy.wait(500);

});

Then("visualizo a confirmacao de lista criada", () => {
    cy.url()
    .should('be.equal', 'https://academy-lembra-compras.herokuapp.com/lista')

});