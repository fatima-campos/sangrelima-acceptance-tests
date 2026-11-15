Feature: Búsqueda de donantes y evaluación de compatibilidad
  Como plataforma
  Quiero relacionar las solicitudes validadas con donantes aptos
  Para contactar únicamente a personas compatibles, cercanas y disponibles
  @US16
  Scenario: Registrar el tipo de sangre del donante
    Given que soy un donante y estoy configurando mi perfil
    When registro mi grupo sanguíneo y factor Rh
    Then el sistema utiliza esos datos para buscar solicitudes compatibles

  @US17 @android-comparative
  Scenario: Seleccionar únicamente donantes compatibles
    Given que la solicitud requiere el tipo de sangre "O-"
    When se inicia la búsqueda de donantes
    Then solo se consideran donantes con un tipo de sangre compatible

  @US18 @android-comparative
  Scenario: Dar prioridad a los donantes cercanos
    Given que la solicitud tiene registrada la ubicación de un centro de salud
    When se buscan posibles donantes
    Then se da prioridad a los donantes que se encuentran cerca del centro de salud

  @US19
  Scenario: Excluir a los donantes que realizaron una donación recientemente
    Given que un donante tiene registrada una donación anterior
    When se evalúa su disponibilidad para una nueva solicitud
    Then se verifica el tiempo transcurrido desde su última donación antes de incluirlo

  @US20
  Scenario: Tener en cuenta la disponibilidad del donante
    Given que soy un donante activo
    When marco mi estado como no disponible
    Then no soy seleccionado como posible donante

  @US21
  Scenario: Excluir temporalmente a los donantes que no son aptos
    Given que el sistema detecta que temporalmente no cumplo con los requisitos para donar
    When se genera una lista de posibles donantes
    Then mi perfil no se incluye hasta que la condición deje de aplicarse

  @US22 @android-comparative
  Scenario: Ordenar los donantes según su nivel de compatibilidad
    Given que existen varios posibles donantes
    When se realiza la búsqueda de coincidencias
    Then los resultados se ordenan según la compatibilidad, cercanía y disponibilidad

  @US23
  Scenario: Actualizar la búsqueda cuando cambia una solicitud
    Given que una solicitud validada cambia su tipo de sangre, ubicación o estado
    When se confirma la actualización
    Then el sistema vuelve a buscar posibles donantes utilizando los nuevos datos

