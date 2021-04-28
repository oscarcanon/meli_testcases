# language: es

Característica: Validar servicio topsecret_split
  Validar servicio topsecret_split ahora recibe la información por separado de cada nave

  Esquema del escenario: Comprobar respuesta por post para cada nave
    Dado que se consume el servicio "topsecret_split"
    Y se hace una petición "POST" para la nave "<Nave>"
    Cuando se envía la petición con distancia "<distancia>" y mensaje "<mensaje>"
    Entonces se debe obtener un código de respuesta 200
    Ejemplos:
      | Nave      | distancia | mensaje                         |
      | Kenobi    | 100.0     ||
      | Skywalker | 115.5     | ["", "es", "", "", "secreto"]   |
      | Sato      | 142.7     | ["este", "", "un", "", ""]      |

  Escenario: Comprobar mensaje de respuesta fallido para POST
    Dado que se consume el servicio "topsecret_split"
    Y se hace una petición "POST" con el payload "payloads/payload_fallido.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 404

  Escenario: Comprobar respuesta de GET para topsecret_split
    Dado que se hace una petición "GET" con el payload "payloads/payload_sencillo_get.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 200
    Y la respuesta debe coincidir con "responses/respuesta_exitosa.json"

  Escenario: Comprobar respuesta para GET con información incompleta de mensaje
    Dado que se hace una petición "GET" con el payload "payloads/payload_msg_fallido.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 404
    Y debe tener un mensaje de error "No hay suficiente información"

  Escenario: Comprobar respuesta para GET con información incompleta de posición
    Dado que se hace una petición "GET" con el payload "payloads/payload_pos_fallido.json"
    Cuando se recibe la respuesta al servicio
    Entonces se debe obtener un código de respuesta 404
    Y debe tener un mensaje de error "No hay suficiente información"

  Escenario: Comprobar respuesta servicio no disponible con POST
    Dado que se hace una petición "POST" con el payload "payloads/payload_exitoso.json"
    Cuando no está disponible el servicio
    Entonces se debe obtener un código de respuesta 503

  Escenario: Comprobar respuesta servicio no disponible con GET
    Dado que se hace una petición "GET" con el payload "payloads/payload_exitoso.json"
    Cuando no está disponible el servicio
    Entonces se debe obtener un código de respuesta 503










