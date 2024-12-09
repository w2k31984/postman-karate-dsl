Feature: Products

  Background: Preconditions
    Given url mainUrl
    * headers auth

   Scenario: Get all Products
     Given path 'products'
     When method GET
     Then status 200
     * assert responseTime < 2500


  Scenario: Get Product
    Given path 'products', 2
    When method GET
    Then status 200
    * assert responseTime < 2500
    * assert response.id == 2
    * assert response.category == "beauty"
    * assert response.weight == 3
    * assert response.dimensions.width == 12.42
    * assert response.minimumOrderQuantity == 32

  Scenario: Delete Product
    Given path 'products', 2
    When method DELETE
    Then status 200
    * assert responseTime < 2500

  Scenario: Sort Products
    Given path 'products'
    * params {"sortBy": "price", "order": "asc"}
    #* param  sortBy = 'price'
    #* param  order = 'asc'
    When method GET
    Then status 200
    * assert responseTime < 2500

  Scenario: Search Product
    Given path 'products', 'search'
    * param  q = 'kitchen'
    When method GET
    Then status 200
    * assert responseTime < 2500

  Scenario: Create Product
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def productPayload = read("./productsFilesJson/createProduct.json")
    * print 'Request payload antes de enviar:', productPayload
    Given path 'products', 'add'
    * request productPayload
    When method POST
    Then status 201
    * assert responseTime < 2500
    * def schema = read("./schemasProductsJson/createProductSchema.json")
    * match response == schema

  Scenario: Update Product
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def updateProductPayload = read("./productsFilesJson/updateProduct.json")
    * print 'Request payload antes de enviar:', updateProductPayload
    Given path 'products', 2
    * request updateProductPayload
    When method PUT
    Then status 200
    * assert responseTime < 2500

  Scenario: Partial Update Product
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * def partialUpdateProductPayload = read("./productsFilesJson/partialUpdateProduct.json")
    * print 'Request payload antes de enviar:', partialUpdateProductPayload
    Given path 'products', 2
    * request partialUpdateProductPayload
    When method PATCH
    Then status 200
    * assert responseTime < 2500
