# language: es

Característica: Validar servicio topsecret
  Validar servicio topsecret que retorna ubicación de la nave y mensaje que retorna

  Escenario: Comprobar respuesta exitosa
    Dado que se hace una petición "POST" con el payload "payloads/payload_exitoso.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 200
    Y la respuesta debe coincidir con "responses/respuesta_exitosa.json"

  Escenario: Comprobar respuesta con posición fallida
    Dado que se hace una petición "POST" con el payload "payloads/payload_pos_fallido.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 404

  Escenario: Comprobar respuesta con mensaje fallido
    Dado que se hace una petición "POST" con el payload "payloads/payload_msg_fallido.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 404

  Escenario: Comprobar respuesta servicio no disponible
    Dado que se hace una petición "POST" con el payload "payloads/payload_exitoso.json"
    Cuando no está disponible el servicio
    Entonces se debe obtener un código de respuesta 503

  Esquema del escenario: Comprobar respuesta de calculo de distancias
    Dado que se hace una petición "POST" con el payload "<payload>"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 200
    Y la distancia debe ser de "<distancia_recibida>"
    Ejemplos:
      | payload | distancia_recibida |
      | payloads/caso01.json | 100  |
      | payloads/caso02.json | 105  |
      | payloads/caso03.json | -75  |
      | payloads/caso04.json | 405  |
      | payloads/caso02.json | -177 |







