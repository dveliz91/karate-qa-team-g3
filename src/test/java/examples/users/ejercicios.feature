Feature: Certificar ens point resques in


  Scenario: CONSULTAR USUARIO POR ID
    Given url 'https://reqres.in'
    And path '/api/users/2'
    When method get
    Then status 201

  Scenario:Caso 3 - CONSULTAR USUARIO POR ID
    * def id = 2
    Given url 'https://reqres.in'
    And path '/api/users/'+id
    When method get
    * print response
    And match response.data.id == 2
    And match response.data.first_name == "Janet"
    And match response.data.last_name == "Weaver"
    Then status 200

  Scenario: REGISTRO SATISFACTORIO USUARIO POR ID CASO 1
    Given url 'https://reqres.in'
    And path '/api/register'
    When request {"email": "eve.holt@reqres.in","password": "pistol"}
    And method POST
    Then status 200
    And match response.id != null

  Scenario Outline: REGISTRO SATISFACTORIO USUARIO POR ID CASO 2
    * def body = {"email": "<EMAIL>","password": "<PASSWORD>"}
    Given url 'https://reqres.in'
    And path '/api/register'
    When request body
    And method POST
    And match response.id != null
    Then status 200
    Examples:
      |EMAIL|PASSWORD|
      |eve.holt@reqres.in|pistol|

  Scenario Outline: REGISTRO SATISFACTORIO USUARIO POR ID CASO 3
    * def body =
       """
          {
          "email": "<EMAIL>",
          "password": "<PASSWORD>"}
       """
    Given url 'https://reqres.in'
    And path '/api/register'
    When request body
    And method POST
    And match response.id != null
    Then status 200
    Examples:
      |EMAIL|PASSWORD|
      |eve.holt@reqres.in|pistol|