Feature: Información confiable y verificada
  Como donante o solicitante
  Quiero acceder a información clara y verificada
  Para confiar en cada solicitud y evitar traslados innecesarios

  @US47
  Scenario: Consultar los requisitos básicos antes de acudir a donar
    Given que soy un donante y estoy evaluando una solicitud compatible
    When abro la información sobre los requisitos
    Then veo las condiciones básicas para poder donar

  @US48
  Scenario: Consultar la información del centro de salud
    Given que una solicitud fue validada por un centro de salud
    When abro el detalle de la solicitud
    Then veo el nombre, la ubicación y la información disponible del centro de salud

  @US49
  Scenario: Reportar información sospechosa
    Given que soy un donante y estoy viendo una solicitud activa
    When envío un reporte indicando el motivo
    Then el sistema registra la observación para su revisión
    And el estado clínico del caso no cambia automáticamente

  @US49
  Scenario: Enviar un reporte sin indicar el motivo
    Given que soy un donante y estoy viendo una solicitud activa
    When envío un reporte sin indicar el motivo
    Then el sistema me solicita seleccionar o escribir el motivo

  @US50
  Scenario: Compartir una solicitud verificada
    Given que mi solicitud fue validada
    When selecciono la opción "Compartir"
    Then el sistema genera un contenido con la información principal y una referencia al caso verificado


