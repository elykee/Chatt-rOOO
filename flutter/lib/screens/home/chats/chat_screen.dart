import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/common/utils/mock_chat_data.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:chattrooo/screens/home/chats/chatthread/chat_thread_screen.dart';
import 'package:chattrooo/screens/home/contacts/contacts_screen.dart';

import 'package:flutter/material.dart';

/// Pantalla que muestra la lista de conversaciones activas del usuario.
///
/// Renderiza una lista dinámica de chats con información del último mensaje,
/// hora y badges de notificaciones pendientes.
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

/// Estado de la pantalla que gestiona la visualización de la lista de chats.
class _ChatScreenState extends State<ChatScreen> {
  /// Estructura principal de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            // Construye la lista dinámicamente
            child: ListView.builder(
              itemCount: mockChatList.length,
              itemBuilder: (context, index) {
                // Construcción de cada chat individual
                final chat = mockChatList[index];
                return Semantics(
                  label: "Open ${chat.name}'s profile",
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    leading: UserAvatar(name: chat.name, image: chat.image),
                    title: Text(chat.name, style: context.label1),
                    subtitle: Text(
                      chat.lastMsg,
                      style: context.text3.copyWith(
                        color: context.theme.subtitleColor,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Muestra la hora del mensaje con color resaltado si hay mensajes nuevos.
                        Text(
                          chat.time,
                          style: context.label3.copyWith(
                            color: (chat.msg != null && chat.msg!.isNotEmpty)
                                ? context
                                      .theme
                                      .timeColor // si hay mensajes, mostrar hora/fecha en color
                                : context
                                      .theme
                                      .subtitleColor, // si no hay mensajes, reflejar en color claro
                          ),
                        ),

                        // Mostrar badge circular si solo hay mensajes nuevos
                        if (chat.msg != null && chat.msg!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 4),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: context.theme.greenColor,
                              child: Text(
                                chat.msg!,
                                style: context.text3.copyWith(
                                  color: Colours.navy950,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    // Navegamos al ChatThread (Chat Invididual)
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatThreadScreen(
                            chatId: chat.id,
                            chatName: chat.name,
                            chatImage: chat.image,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Botón flotante para acceder a la lista de contactos e iniciar un nuevo chat
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ContactsScreen()),
          );
        },
        tooltip: 'New message',
        child: const Icon(Icons.chat_outlined),
      ),
    );
  }
}
