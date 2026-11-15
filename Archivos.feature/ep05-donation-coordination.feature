Feature: Coordinación de respuestas y donaciones
  Como donante, solicitante o personal de un centro de salud
  Quiero coordinar cada etapa de la donación
  Para que el avance real de una solicitud esté siempre claro

  @US30 @android-comparative
  Scenario: Confirmar disponibilidad con un solo toque
    Given que soy un donante y estoy viendo una solicitud validada y compatible
    When presiono la opción "Puedo donar"
    Then el sistema registra mi respuesta
    And mi confirmación se agrega al seguimiento de la solicitud

  @US31
  Scenario: Rechazar una solicitud
    Given que soy un donante que recibió una solicitud compatible
    When selecciono que no puedo participar
    Then mi respuesta queda registrada como "No disponible" para ese caso

  @US32 @android-comparative
  Scenario: Ver los donantes que confirmaron su disponibilidad
    Given que soy un solicitante y tengo una solicitud activa
    When uno o más donantes confirman su disponibilidad
    Then el contador de confirmaciones se actualiza en el detalle de la solicitud

  @US33
  Scenario: Consultar las indicaciones antes de acudir a donar
    Given que soy un donante que confirmó su disponibilidad
    When abro las indicaciones de la solicitud
    Then veo el centro de salud, su ubicación y las recomendaciones registradas

  @US34
  Scenario: Indicar que estoy en camino
    Given que soy un donante que confirmó su disponibilidad
    When presiono la opción "Estoy en camino"
    Then mi estado de asistencia se actualiza para ese caso

  @US35 @android-comparative
  Scenario: Confirmar la llegada de un donante
    Given que un donante se presenta para atender una solicitud
    When el personal del centro de salud confirma su llegada
    Then el sistema registra su asistencia vinculada al caso

  @US36
  Scenario: Notificar que la necesidad de sangre ya fue cubierta
    Given que la solicitud alcanza la cantidad de donantes definida por el centro de salud
    When el personal marca el caso como cubierto
    Then el solicitante recibe una notificación
    And la solicitud deja de buscar nuevos donantes
