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
       
        cy.get('.sc-jdAMXn > button').click({ force: true });
        
    }

    criaVariasListas(QtdLista, qtdItensNaLista){
        cy.wait(500);
        for (var x = 0; x < QtdLista; x++) {
            var NomeLista = "ListaNova - " + (x + 1);
            cy.wait(500);
            this.informaNomeLista(NomeLista);

            for (var i = 0; i < qtdItensNaLista; i++) {
                var NomeItem = "ItemNovo " + (i + 1);
                cy.wait(500);
                this.informmaNomeItem(NomeItem);
                cy.wait(200);
                this.clicaBtnAddItem();

            }

            this.clicarBtnSalvar();
            this.clicaFinalizarLista();
            this.clicaEmConfirmar();




        }

    }

}

export var criaLista = new lista();