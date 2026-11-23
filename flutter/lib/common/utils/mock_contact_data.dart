import 'package:chattrooo/models/contact_item.dart';

/// Lista de contactos sugeridos y disponibles.
///
/// Este listado simulado (mock) contiene los datos para la pantalla "Select Contact".
/// Incluye una variedad de casos de uso: el contacto propio (You), contactos con
/// estados de texto, emojis, estados nulos o vacíos, así como diferentes tipos de
/// imágenes para validar la lógica del componente [UserAvatar].
final List<ContactItem> mockContactList = [
  /// Contacto que representa al propio usuario.
  ContactItem(
    image: "assets/images/avatar.png",
    name: "+34 686 45 56 56 (You)",
    status: "Message yourself",
  ),
  ContactItem(image: "assets/images/dan.png", name: "Dan", status: "~"),
  ContactItem(
    image: "assets/images/darwin.png",
    name: "Darwin",
    status: "Online",
  ),
  // Caso de prueba: Imagen nula (activará el fallback de iniciales).
  ContactItem(image: null, name: "Dina", status: "Busy"),
  ContactItem(image: "assets/images/joe.png", name: "Joe", status: "😀"),
  ContactItem(
    image: "assets/images/journey.png",
    name: "Journey",
    status: "Sleeping",
  ),
  // Caso de prueba: Estado nulo.
  ContactItem(image: "assets/images/julie.png", name: "Julie", status: null),
  // Caso de prueba: Estado vacío.
  ContactItem(image: "assets/images/liam.png", name: "Liam", status: ""),
  ContactItem(
    image: "assets/images/mira.png",
    name: "Mira",
    status: "🎉🎈 Happy Birthday! 🎁🎂",
  ),
  ContactItem(
    image: "assets/images/phoenix.png",
    name: "Phoenix",
    status: "Available",
  ),
  ContactItem(
    image: "assets/images/robin.png",
    name: "Robin",
    status: "At work",
  ),
  ContactItem(
    image: "assets/images/sabrina.png",
    name: "Sabrina",
    status: "At the movies",
  ),
  // Caso de prueba: Imagen vacía.
  ContactItem(image: "", name: "Sara", status: null),
  ContactItem(
    image: "assets/images/sidney.png",
    name: "Sidney",
    status: "In a meeting",
  ),
  ContactItem(
    image: "assets/images/sienna.png",
    name: "Sienna",
    status: "At the gym",
  ),
  // Caso de prueba: Contacto no guardado (se muestra el número como nombre).
  ContactItem(image: "", name: "+37 565 45 45 45", status: "At school"),
];
