class historicoDeLista {
    labelNomeLista1 = ":nth-child(1) > p"; 
    labelDataCriacao = ":nth-child(1) > span"; 
    acessarHistorico() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/historico");
    }
    acessarPaginaInicialLista() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/lista");
    }  


}

export var historicoLista = new historicoDeLista();