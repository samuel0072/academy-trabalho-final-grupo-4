class lista {
    inputNomeLista = ".sc-bBrHrO > .sc-hAZoDl > .sc-ksZaOG";
    inputNomeItem = ":nth-child(1) > .sc-ksZaOG";
    qtdItem = ".sc-bZkfAO > :nth-child(2) > .sc-ksZaOG";
    btnAdicionarItem = ".sc-kLLXSd";
    btnSalvar = ".sc-ftvSup";
    btnConfirmar = '.sc-jdAMXn';
    
    visitar() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
    }

    aguardar(mili){
        cy.wait(mili);
    }

    informaNomeLista(NomeLista) {
        cy.get(this.inputNomeLista).type(NomeLista);
    }

    informmaNomeItem(NomeItem) {
        cy.get(this.inputNomeItem).type(NomeItem);
    }

    clicaBtnAddItem() {
        cy.contains("button", "+").click();
    }
    clicarBtnSalvar() {
        cy.contains("button", "Salvar").click();
    }

    clicaFinalizarLista (){
        cy.contains("button", "Finalizar a lista").click();
        
    }
    clicaEmConfirmar (){
       // cy.get('.sc-jdAMXn').click({ force: true });
        cy.get('.sc-jdAMXn > button').click({ force: true });
        
    }

    criaVariasListas(QtdLista, qtdItensNaLista){
        for (var i = 0; i < QtdLista; i++) {
          
         }

    }

}

export var criaLista = new lista();