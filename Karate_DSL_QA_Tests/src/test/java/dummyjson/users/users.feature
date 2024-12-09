Feature: Users

  Background: Preconditions
    Given url mainUrl
    * headers auth

  Scenario: Get all Users
    * path 'users'
    When method GET
    Then status 200
    * assert responseTime < 2500

    * def first = response[0]

  Scenario: Get User
    Given path 'users',5
    When method GET
    Then status 200
    * assert responseTime < 2500
    * assert response.id == 5
    * assert response.firstName == "Emma"
    * assert response.age == 30
    * assert response.bank.cardType == "American Express"
    * assert response.company.address.state == "Idaho"

  Scenario: Delete User
    Given path 'users',5
    When method DELETE
    Then status 200
    * assert responseTime < 2500

  Scenario: Sort Users
    Given path 'users'
    * params {"sortBy": "age", "order": "desc"}
    #* param  sortBy = 'age'
    #* param  order = 'desc'
    When method GET
    Then status 200
    * assert responseTime < 2500


  Scenario: Search User
    Given path 'users', 'search'
    * param  q = 'Jhon'
    When method GET
    Then status 200
    * assert responseTime < 2500

  Scenario: Filter user
    Given path 'users', 'filter'
    * params {"key": "address.city", "value": "Phoenix"}
    #* param  key = 'address.city'
    #* param value = 'Phoenix'
    When method GET
    Then status 200
    * assert responseTime < 2500


  Scenario: Create User
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def createUserPayload = read("./usersFilesJson/createUser.json")
    * print 'Request payload antes de enviar:', createUserPayload
    Given path 'users', 'add'
    When method POST
    Then status 201
    * assert responseTime < 2500


  Scenario: Update User
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def updateUserPayload = read("./usersFilesJson/updateUser.json")
    * print 'Request payload antes de enviar:', updateUserPayload
    Given path 'users', 5
    When method PUT
    Then status 200
    * assert responseTime < 2500


  Scenario: Partial Update User
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def partialUpdateUserPayload = read("./usersFilesJson/partialUpdateUser.json")
    * print 'Request payload antes de enviar:', partialUpdateUserPayload
    Given path 'users', 5
    When method PATCH
    Then status 200
    * assert responseTime < 2500

