Feature: Inicio de sesión de usuario
	Como cliente registrado de una tienda virtual de zapatos
	Quiero iniciar sesión con mi correo electrónico y contraseña
	Para acceder a mi cuenta y consultar mis pedidos

	@CA01
	Scenario: Acceder con credenciales válidas
		Given que el usuario está registrado y se encuentra en la página de inicio de sesión
		When ingresa su correo electrónico válido
		And ingresa su contraseña válida
		Then el sistema permite el acceso a su cuenta

	@CA02
	Scenario: Rechazar el inicio de sesión con contraseña incorrecta
		Given que el usuario se encuentra en la página de inicio de sesión
		When ingresa su correo electrónico registrado
		And ingresa una contraseña incorrecta
		Then el sistema muestra un mensaje de error
		And no permite el acceso a la cuenta

	@CA02
	Scenario: Rechazar el inicio de sesión con correo no registrado
		Given que el usuario se encuentra en la página de inicio de sesión
		When ingresa un correo electrónico no registrado
		And ingresa una contraseña
		Then el sistema muestra un mensaje de error
		And no permite el acceso a la cuenta

	@CA03
	Scenario: Validar el correo electrónico vacío
		Given que el usuario se encuentra en la página de inicio de sesión
		When deja vacío el campo de correo electrónico
		And completa el campo de contraseña
		Then el sistema muestra una validación de los campos obligatorios

	@CA03
	Scenario: Validar la contraseña vacía
		Given que el usuario se encuentra en la página de inicio de sesión
		When completa el campo de correo electrónico
		And deja vacío el campo de contraseña
		Then el sistema muestra una validación de los campos obligatorios

	@CA03
	Scenario: Validar ambos campos vacíos
		Given que el usuario se encuentra en la página de inicio de sesión
		When deja vacío el campo de correo electrónico
		And deja vacío el campo de contraseña
		Then el sistema muestra una validación de los campos obligatorios
