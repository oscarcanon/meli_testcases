# language: es

Característica: Validar status de la aplicacion
  El endpoint de la aplicación esta activo y respondiendo peticiones

  Escenario: Validar status de la aplicación
    Dado la aplicación está corriendo
    Cuando se haga una petición de estado
    Entonces la API debe retornar "Aplicación arriba y respondiendo"