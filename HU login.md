
# Historia de Usuario: Inicio de sesión

## HU-001: Login de usuario

**Como** cliente registrado de una tienda virtual de zapatos,
**quiero** iniciar sesión utilizando mi correo electrónico y contraseña,
**para** acceder a mi cuenta y consultar mis pedidos.

## Criterios de aceptación

**CA01: Inicio de sesión exitoso**
- Dado que el usuario está registrado en el sistema.
- Cuando ingresa un correo y contraseña válidos.
- Entonces el sistema permite el acceso a su cuenta.

**CA02: Credenciales incorrectas**
- Dado que el usuario se encuentra en la página de inicio de sesión.
- Cuando ingresa credenciales incorrectas.
- Entonces el sistema muestra un mensaje de error y no permite el acceso.

**CA03: Campos obligatorios**
- Dado que el usuario se encuentra en la página de inicio de sesión.
- Cuando intenta ingresar sin completar el correo o la contraseña.
- Entonces el sistema muestra una validación de los campos obligatorios.
  