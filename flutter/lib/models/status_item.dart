/// Clase StatusItem: representación del usuario en la pantalla Status
// (No representa el "estado del usuario" como actividad, últimas publicaciones o historias)
//(Lo nombramos de esta manera para facilitar acceso y relación con su uso en la pantalla Status)
class StatusItem {
  final String? image;
  final String name;
  final String statusTime;

  /// Crea una instancia de [StatusItem].
  ///
  /// Requiere obligatoriamente el [name] del contacto y el [statusTime] de la publicación.
  /// El parámetro [image] es opcional por si el usuario no tiene foto de perfil.
  StatusItem({this.image, required this.name, required this.statusTime});
}
