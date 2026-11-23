/// Clase ContactItem: representación del usuario en la pantalla Select Contact
class ContactItem {
  final String? image;
  final String name;
  final String? status;

  /// Crea una instancia de [ContactItem].
  ///
  /// Requiere obligatoriamente el [name] del contacto.
  /// Los parámetros [image] y [status] son opcionales, permitiendo manejar
  /// usuarios sin foto de perfil o sin mensaje de estado configurado.
  ContactItem({this.image, required this.name, this.status});
}
