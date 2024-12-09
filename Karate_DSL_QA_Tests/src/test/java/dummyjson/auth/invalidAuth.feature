Feature: Invalid authorization login

 Background: Precondition
  Given url mainUrl

  Scenario: Invalid Login
   #llamado la data del archivo login.json
   * configure logPrettyRequest = true
   * configure logPrettyResponse = true
   * def errorLoginPayload =
   """
      {
         "username": "hola",
         "password": "adios",
         "expiresInMins": 666
       }
   """
   * print 'Request payload antes de enviar:', errorLoginPayload
    Given path "login"
    * request errorLoginPayload
    When method POST
    Then status 400
   * assert response.message == "Invalid credentials"

