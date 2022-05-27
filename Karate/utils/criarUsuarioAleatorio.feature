@ignore
Feature: Criar Usuário Aleatório
    Scenario:
        * def randomString = 
        """
        function(prefix){ 
            var data = java.lang.System.currentTimeMillis() + '';
            var uuid = java.util.UUID.randomUUID() + '';
            return  data + uuid + prefix;
            }
        """
        * def email = randomString("@email.com");
        * def name = randomString("");
        * def password = randomString("");
        * def createdUser = {name: "#(name)", email:"#(email)", password: "#(password)"}
        Given url baseUrl
        Given path "users"
        Given request createdUser
        When method post
        * def idUser = response.id
