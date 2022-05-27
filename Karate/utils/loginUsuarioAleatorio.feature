@ignore

Feature: Login Usuário Aleatório

    Scenario:
        Given url baseUrl
        And path "auth"
        And path "login"
        And form field email = createdUser.email
        And form field password = createdUser.password
        When method post
        * def tokenAuth = response.session.token
