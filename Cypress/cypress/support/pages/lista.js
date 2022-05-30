class lista {
    inputNomeLista = ".sc-bBrHrO > .sc-hAZoDl > .sc-ksZaOG";
    inputNomeItem = ":nth-child(1) > .sc-ksZaOG";
    qtdItem = ".sc-bZkfAO > :nth-child(2) > .sc-ksZaOG";
    btnAdicionarItem = ".sc-kLLXSd";
    btnSalvar = ".sc-ftvSup";
    
    visitar() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
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


}

export var criaLista = new lista();