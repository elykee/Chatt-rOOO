import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:flutter/material.dart';
import '../../common/theme/custom_theme_extension.dart';
import '../../models/private_chat_item.dart';

/// Clase ChatBubble: componente personalizado del contenedor del mensaje.
///
/// Este widget se encarga de renderizar visualmente un mensaje en la conversación,
/// adaptando su alineación, color y estilo dependiendo de si el mensaje es
/// enviado por el usuario actual o recibido.
class ChatBubble extends StatelessWidget {
  /// El objeto del mensaje que contiene el texto, remitente y hora.
  final PrivateChatItem message;

  /// Determina si se debe mostrar la marca de tiempo debajo del mensaje.
  final bool showTime;

  /// Crea una instancia de [ChatBubble].
  ///
  /// Requiere el objeto [message] de tipo [PrivateChatItem].
  /// El parámetro [showTime] es opcional y por defecto es true.
  const ChatBubble({super.key, required this.message, this.showTime = true});

  /// Estructura principal del componente
  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Align(
      // Alineación dinámica: derecha para el usuario, izquierda para el contacto.
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isMe
              ? context.theme.chatBubbleSentColor
              : context.theme.chatBubbleReceivedColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: context.text1.copyWith(
                color: isMe
                    ? context.theme.chatBubbleTextSentColor
                    : context.theme.chatBubbleTextReceivedColor,
              ),
            ),
            if (showTime)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _formatTime(message.time),
                  style: context.label3.copyWith(
                    color: isMe
                        ? context.theme.timeStampMeColor
                        : context.theme.timeStampReceivedColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Función auxiliar para formatear la hora del mensaje.
  /// Convierte DateTime → String "HH:mm" para mostrar en la UI.
  String _formatTime(DateTime time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }
}
