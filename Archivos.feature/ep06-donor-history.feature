Feature: Historial y continuidad de donaciones
  Como donante
  Quiero consultar mi historial y saber cuándo puedo volver a donar
  Para mantenerme motivado y estar disponible para futuras donaciones

  @US37
  Scenario: Consultar mi historial de donaciones
    Given que tengo donaciones registradas
    When ingreso a mi historial
    Then veo cada donación con su fecha y estado

  @US38
  Scenario: Conocer la próxima fecha estimada para donar
    Given que tengo registrada mi última donación
    When consulto mi estado de elegibilidad
    Then veo la próxima fecha estimada en la que podré volver a donar

  @US39
  Scenario: Recibir un recordatorio cuando vuelva a ser apto para donar
    Given que todavía no puedo donar porque no ha transcurrido el tiempo necesario
    When llega mi fecha estimada para volver a donar
    Then recibo una notificación indicando que ya estoy disponible para donar nuevamente

  @US40
  Scenario: Obtener una insignia de reconocimiento
    Given que completé una participación reconocida por la plataforma
    When se actualiza mi historial
    Then se asigna la insignia correspondiente a mi perfil

  @US41
  Scenario: Consultar el resumen de mis aportes
    Given que tengo actividades registradas en la plataforma
    When ingreso a mi resumen de participación
    Then veo la cantidad de donaciones y acciones reconocidas que he realizado
