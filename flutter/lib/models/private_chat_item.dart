/// Clase PrivateChatItem: representación del mensaje individual en un chat privado
class PrivateChatItem {
  final String id;
  final String text;
  final bool isMe;
  final DateTime time;
  final String type; // 'texto', 'voz', 'imagen'

  /// Crea una instancia de [PrivateChatItem].
  ///
  /// Requiere obligatoriamente un [id] único, el contenido del mensaje [text],
  /// un booleano [isMe] para saber si el remitente es el usuario actual,
  /// y la fecha/hora [time] del envío.
  /// El parámetro [type] indica el formato del mensaje y por defecto es 'text'.
  PrivateChatItem({
    required this.id,
    required this.text,
    required this.isMe,
    required this.time,
    this.type = 'text',
  });
}
