Feature: Gestión de centros de salud
  Como personal autorizado de un centro de salud
  Quiero gestionar las solicitudes y donaciones desde un solo lugar
  Para conocer en todo momento el avance real de cada caso

  @US42
  Scenario: Ver las solicitudes activas de mi centro de salud
    Given que existen solicitudes vinculadas a mi centro de salud
    When ingreso al panel de solicitudes
    Then veo los casos activos y su estado actual

  @US43
  Scenario: Actualizar el estado de una solicitud
    Given que estoy a cargo de una solicitud validada
    When selecciono un nuevo estado permitido, como "Cubierta"
    Then el sistema actualiza el caso
    And el cambio se refleja para los usuarios relacionados

  @US44
  Scenario: Registrar el resultado de la evaluación del donante
    Given que un donante se encuentra en el centro de salud
    When finaliza la evaluación presencial
    Then puedo registrar si está "Apto" o "No apto"
    And el sistema no reemplaza los criterios médicos establecidos

  @US45 @android-comparative
  Scenario: Registrar una donación completada
    Given que un donante completó el proceso de donación
    When confirmo el registro
    Then la donación queda vinculada a la solicitud y al historial del donante

  @US45
  Scenario: Registrar una donación de un donante que no llegó al centro de salud
    Given que un donante no tiene registrada su llegada para la solicitud
    When intento registrar una donación completada
    Then el sistema me solicita confirmar primero su llegada

  @US46
  Scenario: Consultar las confirmaciones, llegadas y donaciones
    Given que una solicitud tiene actividad de donantes
    When ingreso al detalle de la solicitud
    Then veo por separado la cantidad de confirmaciones, llegadas y donaciones completadas
