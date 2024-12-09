Feature: Authorization login

 Background: Precondition
  Given url "https://dummyjson.com/"

  Scenario: Login
   #llamado la data del archivo login.json
   * configure logPrettyRequest = true
   * configure logPrettyResponse = true
   * def loginPayload = read("./authFilesJson/login.json")
   * print 'Request payload antes de enviar:', loginPayload
    Given path 'auth', 'login'
    * request loginPayload
    When method POST
    Then status 200
   * def token = response.accessToken
   * assert responseTime < 2500
   * assert response.id == 1
   * assert response.username == "emilys"
   * assert response.firstName == "Emily"
   * assert response.lastName == "Johnson"
   * assert response.accessToken.length == 360
   * assert response.refreshToken.length == 360
   * def schema = read("./schemaAuthJson/schema.json")
   * match response == schema