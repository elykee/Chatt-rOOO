import 'package:chattrooo/models/status_item.dart';

/// Listado de usuarios en la pantalla Status.
///
/// Esta lista de datos simulados (mock) proporciona la información necesaria
/// para renderizar las filas de estados, incluyendo casos con imagen,
/// con strings vacíos o con valores nulos para probar la robustez de la UI.
final List<StatusItem> mockStatusList = [
  StatusItem(
    image: "assets/images/dan.png",
    name: "Dan",
    statusTime: "1 min ago",
  ),
  StatusItem(
    image: "assets/images/sienna.png",
    name: "Sienna",
    statusTime: "15 min ago",
  ),

  // Caso de prueba: Imagen vacía (activará el fallback de iniciales en UserAvatar).
  StatusItem(image: "", name: "Sara", statusTime: "1 hour ago"),
  StatusItem(
    image: "assets/images/robin.png",
    name: "Robin",
    statusTime: "Today, 11:00",
  ),

  // Caso de prueba: Imagen nula (activará el fallback de iniciales en UserAvatar).
  StatusItem(image: null, name: "Dina", statusTime: "Today, 08:00"),
  StatusItem(
    image: "assets/images/mira.png",
    name: "Mira",
    statusTime: "Today, 06:00",
  ),
  StatusItem(
    image: "assets/images/joe.png",
    name: "Joe",
    statusTime: "Yesterday",
  ),
  StatusItem(
    image: "assets/images/sidney.png",
    name: "Sidney",
    statusTime: "31/12/25",
  ),
  StatusItem(
    image: "assets/images/liam.png",
    name: "Liam",
    statusTime: "01/12/25",
  ),
];
