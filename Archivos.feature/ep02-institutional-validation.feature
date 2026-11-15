Feature: Validación institucional de solicitudes
  Como personal autorizado de un centro de salud
  Quiero revisar y validar las solicitudes
  Para asegurar que solo los casos legítimos lleguen a los donantes

  @US09
  Scenario: Ver las solicitudes pendientes de mi centro de salud
    Given que una solicitud está vinculada a mi centro de salud
    When ingreso a la bandeja de solicitudes pendientes
    Then veo la solicitud lista para ser revisada

  @US10
  Scenario: Verificar los datos de una solicitud
    Given que una solicitud está pendiente de validación
    When abro su información
    Then puedo revisar los datos clínicos y administrativos antes de aprobarla o rechazarla

  @US11
  Scenario: Solicitar al usuario que corrija los datos
    Given que detecto información incompleta o incorrecta
    When marco la solicitud para su corrección e ingreso el motivo
    Then el solicitante recibe la observación
    And puede actualizar los datos

  @US11
  Scenario: Solicitar una corrección sin indicar el motivo
    Given que detecto información incompleta
    When marco la solicitud para su corrección sin indicar un motivo
    Then el sistema me solicita escribir el motivo

  @US12 @android-comparative
  Scenario: Aprobar una solicitud de sangre
    Given que la información de una solicitud es válida
    When confirmo la aprobación con la opción "Aprobar y enviar alerta"
    Then el estado de la solicitud cambia a "Validada"
    And la solicitud queda habilitada para buscar donantes compatibles

  @US13
  Scenario: Rechazar una solicitud no válida
    Given que una solicitud no cumple con las condiciones de validación
    When selecciono "Rechazar" e ingreso un motivo
    Then la solicitud queda marcada como rechazada
    And no se envían alertas a los donantes

  @US13
  Scenario: Rechazar una solicitud sin indicar el motivo
    Given que una solicitud no cumple con las condiciones de validación
    When selecciono "Rechazar" sin indicar un motivo
    Then la solicitud permanece pendiente
    And el sistema me solicita escribir el motivo

  @US14 @android-comparative
  Scenario: Mostrar la validación institucional al donante
    Given que una solicitud fue aprobada por un centro de salud
    When un donante consulta el detalle de la solicitud
    Then ve el estado "Validada" y el centro de salud responsable

  @US15
  Scenario: Advertir sobre una posible solicitud duplicada
    Given que existe una solicitud activa para el mismo paciente y centro de salud
    When se registra una nueva solicitud con datos similares
    Then el sistema muestra una advertencia de posible duplicado al personal antes de aprobarla

