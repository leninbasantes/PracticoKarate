Feature: Gestión de mascotas en la tienda de mascotas

  Background:
    * def urlBase = 'https://petstore.swagger.io'
    * def petsPath = '/v2/pet'
    * def petId = ''
    * def name = 'nttdata'
    * def nameupdate = 'nttdataUpdateEC'

  Scenario: Añadir y gestionar una mascota en la tienda
    # Añadir una mascota
    * def pet =
      """
      {
        "id": 0,
        "category": {
          "id": 0,
          "name": "categoryName"
        },
        "name": #(name),
        "photoUrls": [
          "http://example.com/photo.png"
        ],
        "tags": [
          {
            "id": 0,
            "name": "tagName"
          }
        ],
        "status": "available"
      }
      """
    Given url urlBase + petsPath
    And request pet
    When method post
    Then status 200
    And def petId = response.id

    # Consultar la mascota por ID
    Given path petId
    When method get
    Then status 200
    And match response.id == petId

    # Actualizar la mascota a "sold"
    * def petUpdated =
      """
      {
        "id": #(petId),
        "category": {
          "id": 0,
          "name": "categoryName"
        },
        "name": #(nameupdate),
        "photoUrls": [
          "http://example.com/photo_updated.png"
        ],
        "tags": [
          {
            "id": 0,
            "name": "tagNameUpdated"
          }
        ],
        "status": "sold"
      }
      """
    Given url urlBase + petsPath
    And request petUpdated
    When method put
    Then status 200

  # Consultar mascotas por estatus "sold"
    Given url urlBase + petsPath + '/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    And def petsSold = response

 # Verificar si nuestro ID de mascota esta sold
    * def isPetFound = function(pets){ for (var i = 0; i < pets.length; i++) { if (pets[i].id == petId) return true; } return false; }
    * def petFound = isPetFound(petsSold)
    And assert petFound == true


