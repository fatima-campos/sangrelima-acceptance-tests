Feature: Alertas y notificaciones segmentadas
  Como donante
  Quiero recibir únicamente alertas relevantes
  Para poder responder rápidamente sin recibir demasiadas notificaciones innecesarias

  @US24 @android-comparative
  Scenario: Recibir una alerta de una solicitud compatible
    Given que existe una solicitud validada compatible con mi perfil
    When se generan las alertas segmentadas
    Then recibo una notificación sobre ese caso

  @US24
  Scenario: No recibir alertas de solicitudes incompatibles
    Given que existe una solicitud validada que requiere un tipo de sangre que no puedo donar
    When se generan las alertas segmentadas
    Then no recibo ninguna notificación

  @US25
  Scenario: Visualizar los datos principales en la alerta
    Given que recibo una alerta de donación
    When reviso la notificación
    Then puedo ver el tipo de sangre, el centro de salud y el nivel de urgencia sin tener que buscar más información

  @US26
  Scenario: Conocer la distancia hasta el centro de salud
    Given que una solicitud tiene una ubicación válida
    When abro su información
    Then veo la distancia aproximada desde mi ubicación autorizada

  @US27
  Scenario: Abrir el detalle de una solicitud desde una notificación
    Given que recibí una notificación sobre una solicitud compatible
    When presiono la notificación
    Then la aplicación abre el detalle de esa solicitud

  @US28
  Scenario: Recibir notificaciones sobre cambios importantes en una solicitud
    Given que confirmé mi disponibilidad para una solicitud
    When el centro de salud actualiza información importante
    Then recibo una notificación con los cambios realizados

  @US29
  Scenario: Dejar de recibir alertas de una solicitud que ya fue atendida
    Given que una solicitud cambia al estado "Cubierta" o "Cancelada"
    When el sistema actualiza su estado
    Then no se generan nuevas alertas para ese caso
