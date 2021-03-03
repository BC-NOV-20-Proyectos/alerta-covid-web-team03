![BrightCoders Logo](img/logo-bc.png)

# Alerta Covid Web

![cover](img/cover.jpg)

El propósito de esta aplicación es llevar un registro de los lugares o espacios que ha visitado una persona y en caso de identificarse a una persona contagiada o posiblemente contagiada por COVID, alertar a quienes estuvieron en ese lugar para que de manera oportuna adopten medidas preventivas. La aplicación puede ser utilizada por instituciones educativas o empresas para alertar a sus empleados, alumnos y/o maestros sobre posibles contagios en su entorno.

La aplicación esta compuesta por:

- Una aplicación móvil, que utilizando códigos QR registra la presencia de una persona en un lugar. También, sirve para registrar el estado de salud de los usuarios y alerta sobre posibles contagios en los lugares que visitó.

- Una aplicación web, que permite administrar la información que se requiere o se envía desde la aplicación móvil

Ambas aplicaciones comparten información de una misma base de datos y es la aplicación web la que proporciona los servicios de acceso a la aplicación móvil.

## Requerimientos

La aplicación web tendrá dos tipos de usuarios

- `Administrador`.
  - Puede iniciar sesión, administrar usuarios, administrar lugares y ver reportes de todos los lugares

- `Usuario con acceso a reportes`. Son usuarios a los cuales el administrador les ha dado acceso para que puedan ver los reportes de su institución.

La aplicación web deberá cumplir con la siguientes funciones:

- `Inicio de sesión`. Permite al `administrador` y a `usuarios con acceso a reportes` ingresar a la aplicación web. También deberá contar con algún mecanismo para re-establecer la clave en caso de que el usuario la hubiera olvidado.

- `Usuarios`. Permite al `administrador` administrar (CRUD) a los usuarios del sistema.  Al momento de registrar a un nuevo usuario, la aplicación enviará un correo notificando su registro y la clave de acceso que puede utilizar para ingresar. Los datos para cada usuario son:
  - Número de control
  - Nombre
  - Correo electrónico (servirá como identificador de usuario al momento de iniciar sesión)
  - Clave de acceso
  - Institución (seleccionar del catálogo o agregar uno nuevo)
  - Departamento (seleccionar del catálogo o agregar uno nuevo)
  - Acceso a reportes

- `Lugares`. Permite al usuario `administrador` administrar (CRUD) los lugares registrados en el sistema. La información que se debe registrar para cada lugar son:
  - Código QR
  - Nombre del lugar
  - Institución
  - Area

- `Reportes` Permite al usuario `administrador` y `usuarios con acceso a reportes` ver reporte sobre la o las instituciones a las que tienen acceso. Los tipos de reportes son:
  - `Reporte de personas con incidencias` Muestra un resumen de las personas que han reportado alguna incidencia en el intervalo de tiempo especificado por una fecha de inicio y una fecha final. Por defecto, muestra el resumen de los últimos 10 días ordenado por los de mayor incidencia a los de menor. La mayor incidencia la determina en primer lugar los casos confirmados de COVID y en segundo los casos con síntomas. Permite filtrar la información por institución y/o departamento.

| Institución  | Departamento | Nombre         |  Sintomático | COVID Positivo | COVID Negativo |
|-------------:|-------------:|-------------:|-----:|-----:|-----:|
| BrightCoders Academy | Ruby on Rails| Juan Pérez González |  X |  |X |
| BrightCoders Academy |  React Native | María García Ramírez | X | X |  |
  
- `Reporte de lugares con incidencias` Muestra un resumen de lugares en los que se han reportado incidencias en el intervalo de tiempo especificado por una fecha de inicio y una fecha final, Por defecto, muestra el resumen de los últimos 10 días ordenado por los de mayor incidencia a los de menor. La mayor incidencia la determina en primer lugar los casos confirmados de COVID y en segundo los casos con síntomas. Permite filtrar la información por institución, área y/o lugar. Por ejemplo:

| Institución  | Area  | Lugar         |  Sintomático | COVID Positivo | COVID Negativo |
| -------------  | ------------- |:-------------:| -----:|  -----:|-----:|
| BrightCoders Academy | | Sala de Juntas|  1 | 3 |0 |
| BrightCoders Academy |  México | Aula 01 | 2 | 1 | 1|

### API
Se deberá desarrollar una API para atender las solucitudes de la aplicación móvil. Las funciones de la aplicación móvil son:

- `Inicio de sesión` Permite a los usuarios iniciar su sesión indicando su correo electrónico y clave de acceso. También deberá contar con algún mecanismo para re-establecer la clave en caso de que el usuario la hubiera olvidado.

- `Lugares` Mostrar un historial de los lugares que el usuario ha visitado en los últimos 10 días, así como el resúmen de incidencias reportados en ese intervalo de tiempo. Por ejemplo:

| Institución  | Area  | Lugar         |  Sintomático | COVID Positivo | COVID Negativo |
| -------------  | ------------- |:-------------:| -----:|  -----:|-----:|
| BrightCoders Academy | | Sala de Juntas|  1 | 3 |0 |
| BrightCoders Academy |  México | Aula 01 | 2 | 1 | 1|

- `Reporte de salud o incidencia` Permite al usuario registrar si es que manifiesta algunos síntomas o si es que ha recibido el resultado de alguna prueba. Puede haber más de un registro o reporte por día. Para respetar la privacidad, cuando se registra un reporte, se envía también al servidor los lugares en los que la persona estuvo en los últimos 10 días, pero la información solo sirve para incrementar el número de casos registrados en esos lugares y no para registrar los lugares en los que ha estado esa persona.
  - `Síntomas` En caso de querer registrar síntomas deberá señalar cuales de los siguiente síntomas manifiesta
    - Fiebre o escalofríos
    - Tos
    - Dolor en el pecho al respirar de manera profunda
    - Dificultad para respirar
    - Pérdida del olfato
    - Pérdida del gusto
    - Dolor de cabeza
    - Fatiga o cansancio
    - Dolores musculares y corporales
    - Irritación en la garganta
    - Diarrea
    - Conjuntivitis
    - Congestión o moqueo
    - Erupciones cutáneas
    - Pérdida del color en los dedos de las manos o de los pies
    - Náuseas o vómitos
  - `Prueba` En caso de querer reportar el resultado de una prueba deberá registrar
    - Fecha en que se realizó la prueba
    - Fecha en que le entregaron el resultado
    - Tipo de prueba
    - Resultado de la prueba
    - Si tenía o no síntomas el día de la prueba.

- `Registro de ingreso a un lugar` Mediante el uso de la cámara de su teléfono para la captura de un código QR, el usuario registra su presencia en un lugar.

