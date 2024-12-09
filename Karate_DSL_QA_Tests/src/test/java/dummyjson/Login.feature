Feature: Login with token

  Background: Precondition
    Given url "https://dummyjson.com/"

  Scenario: Login
   #llamado de la data harcodeado
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def loginPayload =
    """
    {
    "username": "emilys",
    "password": "emilyspass",
    "expiresInMins": 30
    }
    """
    * print 'Request payload antes de enviar:', loginPayload
    Given path 'auth', 'login'
    * request loginPayload
    When method POST
    Then status 200
    * def token = response.accessToken

