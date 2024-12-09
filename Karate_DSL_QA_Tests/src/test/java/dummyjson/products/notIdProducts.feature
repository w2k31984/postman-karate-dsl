Feature: No ID Products

  Background: Preconditions
    Given url mainUrl
    * headers auth

   Scenario: Get all Products
     Given path 'products', 2500
     When method GET
     Then status 404
     * assert responseTime < 2500


  Scenario: Get Product
    Given path 'products', 2500
    When method GET
    Then status 404
    * assert responseTime < 2500


  Scenario: Delete Product
    Given path 'products', 2250
    When method DELETE
    Then status 404
    * assert responseTime < 2500


