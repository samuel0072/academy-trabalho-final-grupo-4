# Como executar os testes

Para executar todos os testes, coloque o arquivo .jar do Karate nessa pasta(academy-trabalho-final-grupo-4/Karate/). Então, execute o comando abaixo na sua linha de comando:

```shell
java -jar nomeDoSeuArquivoKarate.jar features/*
```

Onde `nomeDoSeuArquivoKarate.jar` você deve substituir pelo seu arquivo karate no formato .jar.

Para executar testes individuais, execute o comando abaixo na sua linha de comando:

```shell
java -jar nomeDoSeuArquivoKarate.jar features/nomeDoArquivo.feature
```

Onde `nomeDoSeuArquivoKarate.jar` você deve substituir pelo seu arquivo karate no formato .jar.

Onde `nomeDoArquivo.feature` você deve substituir pelo arquivo que deseja executar.

Obs.: Nossos testes foram executados com a versão 1.2 do Karate.

# Organização dos testes

Nós dividimos os arquivos utilizados em duas pastas:
 - features: Testes de funcionalidade da API segundo especificado no BDD
 - utils: Estão arquivos que vão auxiliar em alguma tarefa nos arquivos de teste de funcionalidade
