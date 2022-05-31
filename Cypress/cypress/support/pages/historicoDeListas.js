class historicoDeLista {
    labelNomeLista1 = ":nth-child(1) > p"; 
    labelDataCriacao = ":nth-child(1) > span"; 
    cardLista = '.sc-ehmTmK > :nth-child(1)';
    acessarHistorico() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/historico");
    }
    acessarPaginaInicialLista() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/lista");
        cy.wait(500);
    }  
    clicarEmListaNoHistorico (){
        cy.get('.sc-ehmTmK > :nth-child(1)').click({ force: true });
    }

}

export var historicoLista = new historicoDeLista();