Feature: Operaciones de mascotas en Swagger Petstore

	Background:
		* url 'https://petstore.swagger.io/v2'
		* def petId = Math.floor(Math.random() * 1000000000) + 1000000000
		* def missingPetId = petId + 1
		* def pet = { id: '#(petId)', name: 'Mascota QA Karate', photoUrls: [], status: 'available' }

	# Objetivo: crear una mascota y verificar su persistencia con la consulta documentada.
	Scenario: Crear una mascota mediante POST
		Given path 'pet'
		And request pet
		When method post
		# La especificación no declara un código de éxito para POST /pet.
		And path 'pet', petId
		And method get
		Then status 200
		And match response.id == petId
		And match response.name == pet.name
		And match response.status == pet.status

	# Objetivo: consultar una mascota existente y comprobar sus datos principales.
	Scenario: Consultar una mascota existente mediante GET
		Given path 'pet'
		And request pet
		When method post
		And path 'pet', petId
		And method get
		Then status 200
		And match response.id == petId
		And match response.name == pet.name
		And match response.status == pet.status

	# Objetivo: comprobar la respuesta documentada para un identificador inexistente.
	Scenario: Consultar una mascota inexistente mediante GET
		Given path 'pet', missingPetId
		When method get
		Then status 404

	# Objetivo: validar la estructura Pet devuelta por la consulta.
	Scenario: Validar la estructura JSON de una mascota
		Given path 'pet'
		And request pet
		When method post
		And path 'pet', petId
		And method get
		Then status 200
		And match response contains { id: '#number', name: '#string', photoUrls: '#[]', status: '#? _ == "available" || _ == "pending" || _ == "sold"' }
		And match response.id == petId
		And match response.name == pet.name
		And match response.status == pet.status

	# Objetivo: eliminar una mascota y confirmar que la consulta posterior devuelve 404.
	Scenario: Eliminar una mascota mediante DELETE
		Given path 'pet'
		And request pet
		When method post
		# La especificación no declara un código de éxito para DELETE /pet/{petId}.
		And path 'pet', petId
		And method delete
		And path 'pet', petId
		And method get
		Then status 404
