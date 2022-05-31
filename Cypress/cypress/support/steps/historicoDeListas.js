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



//Scenario: Deve ser possível consultar o nome e itens de uma lista após interagir com a lista no Histórico

Given("dado que consultei o histórico de lista", () => {
    realizaLogin.visitar();
    cy.log("acessei o given correto");
    cy.wait(500);
    realizaLogin.preencherEmail("lud3@gmail.com");
    realizaLogin.informaSenha("123");
    realizaLogin.clicarBtnEntrar();
   
}); 

When("possuo listas de compras cadastradas", () => {
    historicoLista.acessarPaginaInicialLista();
    criaLista.criaVariasListas(1,2);
    
});

When("seleciono uma lista especifica", () => {
    cy.log("chamei2");
    historicoLista.acessarHistorico();
    historicoLista.clicarEmListaNoHistorico();

});



Then("deve ser possivel consultar o nome e item de uma lista", () => {
        cy.contains('h2', 'ListaNova').should('be.visible');
        cy.contains('p', 'ItemNovo').should('be.visible');
        
        

});


