# Reporte de incidencia funcional

## Datos principales

| Campo | Detalle |
|---|---|
| ID del defecto | DEF-HU001-001 |
| Título | El inicio de sesión permite el acceso con contraseña incorrecta |
| Módulo afectado | Autenticación / Inicio de sesión |
| Historia relacionada | HU-001: Login de usuario |
| Criterio incumplido | CA02: Credenciales incorrectas |
| Severidad propuesta | Alta |
| Prioridad propuesta | P1 - Alta |
| Estado | Nuevo; pendiente de análisis y validación por desarrollo |
| Naturaleza del reporte | Simulación académica; no corresponde a un defecto verificado en un sistema real |

## Descripción del problema

En el escenario simulado, un usuario registrado proporciona un correo electrónico válido junto con una contraseña incorrecta. Al enviar el formulario de inicio de sesión, el sistema permite el acceso a la cuenta en lugar de mostrar un mensaje de error y denegar el acceso, como establece CA02.

## Precondiciones

- El usuario ficticio está registrado en el entorno de prueba.
- El usuario se encuentra en la página de inicio de sesión.
- Se dispone del correo asociado a la cuenta de prueba; no se necesita revelar ni consignar la contraseña correcta.

## Datos de prueba

| Campo | Valor |
|---|---|
| Correo | `usuario.qa@example.com` (ficticio, asociado a una cuenta de prueba) |
| Contraseña | `Clave-incorrecta-qa-01` (ficticia; distinta de la contraseña registrada) |

## Pasos para reproducir

1. Abrir la página de inicio de sesión.
2. Ingresar `usuario.qa@example.com` en el campo de correo electrónico.
3. Ingresar `Clave-incorrecta-qa-01` en el campo de contraseña.
4. Presionar el botón de inicio de sesión.
5. Observar el resultado de la operación.

## Resultado esperado

El sistema muestra un mensaje de error y no permite el acceso a la cuenta, conforme a CA02.

## Resultado obtenido en la simulación

El sistema permite el acceso a la cuenta pese a que la contraseña ingresada es incorrecta. Este resultado forma parte del defecto planteado para la práctica y no afirma que el comportamiento haya sido observado en una aplicación real.

## Severidad y prioridad propuestas

- **Severidad: Alta.** Si ocurriera en el producto, aceptar una contraseña incorrecta comprometería el control de acceso a cuentas y podría exponer información de usuarios. La severidad se propone por el impacto funcional y de seguridad descrito, no por una causa técnica confirmada.
- **Prioridad: P1 - Alta.** Se recomienda atenderlo con urgencia porque afecta directamente el inicio de sesión y la protección de cuentas. La asignación definitiva corresponde al proceso de priorización del equipo.

## Impacto funcional

El comportamiento contradice CA02 y hace que el sistema no distinga correctamente las credenciales válidas de las incorrectas. Esto puede permitir accesos no autorizados y reduce la confianza en la autenticación de la tienda.

## Recomendaciones para desarrollo

- Revisar el flujo de autenticación para asegurar que el acceso solo se conceda cuando el correo y la contraseña sean válidos.
- Confirmar que las credenciales incorrectas produzcan un mensaje de error y que la cuenta no quede accesible.
- Añadir o actualizar pruebas para cubrir el rechazo de una contraseña incorrecta y verificar que no se concede acceso.
- No asumir una causa técnica hasta analizar y reproducir el comportamiento en el entorno correspondiente.

## Pruebas de regresión relacionadas

- **CA01:** ingresar con correo y contraseña válidos y comprobar que se permite el acceso.
- **CA02:** ingresar con correo registrado y contraseña incorrecta; comprobar el mensaje de error y la denegación del acceso.
- **CA02:** ingresar credenciales incorrectas usando un correo no registrado; comprobar el mensaje de error y la denegación del acceso.
- **CA03:** omitir el correo, omitir la contraseña y omitir ambos campos; comprobar la validación de los campos obligatorios.
- Tras un intento rechazado, comprobar que el usuario no haya accedido a la cuenta.
