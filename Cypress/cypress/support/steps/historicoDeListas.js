import { historicoLista } from "../pages/historicoDeListas"
import { realizaLogin } from "../pages/login"
import { criaLista } from "../pages/lista"


Given("acessei a tela de historico de compras", () => {
    realizaLogin.visitar();
    realizaLogin.preencherEmail("lud3@gmail.com");
    realizaLogin.informaSenha("123");
    realizaLogin.clicarBtnEntrar();
   
});

When("crio uma lista qualquer", () => {
    historicoLista.acessarPaginaInicialLista();
    
    cy.log("chamei");
    criaLista.criaVariasListas(2,2);
    historicoLista.acessarHistorico();
});

Then("visualizo as minhas listas criadas", () => {
    cy.url()
        .should('be.equal', 'https://academy-lembra-compras.herokuapp.com/historico')
        cy.contains(':nth-child(2) > p', 'ListaNova - 1').should('be.visible');
        cy.contains(':nth-child(1) > p', 'ListaNova - 2').should('be.visible');
        
        

});




Given("dado que consultei o histórico", () => {
    criaLista.visitar();
   
});

When("possuo listas de compras cadastradas", () => {
    
    criaLista.criaVariasListas(1,1);
    historicoLista.acessarHistorico();
});

Then("deve ser exibido o nome das listas", () => {
    cy.url()
        .should('be.equal', 'https://academy-lembra-compras.herokuapp.com/historico')
        cy.contains(':nth-child(1) > p', 'ListaNova - 1').should('be.visible');
        cy.get(':nth-child(1) > span').should('be.visible');
        
       
        
        

});










When("possuo mais de 10 listas cadastradas no sistema", () => {
   
    criaLista.visitar();
    criaLista.criaVariasListas(10,1);
    historicoLista.acessarHistorico();
});

Then("deve ser exibido apenas as 10 listas mais recentes", () => {
        cy.contains(':nth-child(2) > p', 'ListaNova - 9').should('be.visible');
        cy.contains(':nth-child(1) > p', 'ListaNova - 10').should('be.visible');
        
        

});