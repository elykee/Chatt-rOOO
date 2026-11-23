/// Class ChatItem: representación de cada chat individual en la lista de Chats
class ChatItem {
  final String id;
  final String? image;
  final String name;
  final String lastMsg;
  final String time;
  final String? msg;

  /// Crea una instancia de [ChatItem].
  ///
  /// Requiere obligatoriamente un [id] único, el [name] del contacto, el contenido
  /// del último mensaje [lastMsg] y la hora [time] de este.
  /// Los parámetros [image] y [msg] (usado para el contador de mensajes nuevos)
  /// son opcionales.
  ChatItem({
    required this.id,
    this.image,
    required this.name,
    required this.lastMsg,
    required this.time,
    this.msg,
  });
}
