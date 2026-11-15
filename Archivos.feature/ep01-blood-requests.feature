Feature: Gestión de solicitudes de sangre
  Como familiar de un paciente
  Quiero registrar y hacer seguimiento a una solicitud de sangre
  Para encontrar donantes compatibles sin depender de cadenas de mensajes

  @US01 @android-comparative
  Scenario: Registrar una solicitud urgente de sangre
    Given que necesito sangre para un paciente
    When completo los campos obligatorios y envío la solicitud
    Then la solicitud se guarda con el estado "Pendiente de validación"

  @US01
  Scenario: Enviar una solicitud con campos obligatorios vacíos
    Given que estoy creando una solicitud
    When dejo un campo obligatorio vacío y envío la solicitud
    Then la solicitud no se guarda
    And veo un mensaje de error junto al campo vacío

  @US02
  Scenario: Seleccionar el tipo de sangre requerido
    Given que estoy creando una solicitud
    When selecciono el grupo sanguíneo "O" y el factor Rh "positivo"
    Then el sistema guarda "O+" como criterio de compatibilidad

  @US03
  Scenario: Ingresar la cantidad de unidades de sangre
    Given que estoy completando una solicitud
    When ingreso 2 unidades
    Then el sistema muestra y conserva "2 unidades" para el caso

  @US03
  Scenario: Rechazar una cantidad de unidades no válida
    Given que estoy completando una solicitud
    When ingreso 0 unidades
    Then el sistema me solicita ingresar al menos 1 unidad

  @US04 @android-comparative
  Scenario: Vincular la solicitud con un centro de salud
    Given que estoy registrando una solicitud
    When selecciono un centro de salud disponible
    Then la solicitud queda vinculada a ese centro de salud

  @US05
  Scenario: Mostrar la ubicación del punto de donación
    Given que la solicitud está vinculada a un centro de salud
    When abro la ubicación registrada
    Then veo el punto de donación en un mapa junto con su dirección

  @US06
  Scenario: Establecer el nivel de urgencia
    Given que estoy completando una solicitud
    When selecciono el nivel de urgencia "Urgente"
    Then la solicitud aparece identificada visualmente como urgente

  @US07
  Scenario: Revisar la solicitud antes de enviarla
    Given que he completado los datos de la solicitud
    When selecciono la opción "Revisar"
    Then veo un resumen de la solicitud
    And puedo regresar para editar cualquier campo antes de enviarla

  @US08
  Scenario: Consultar el avance de una solicitud activa
    Given que tengo una solicitud activa
    When abro el detalle de la solicitud
    Then veo su estado y la cantidad de confirmaciones recibidas

