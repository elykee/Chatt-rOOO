import 'package:chattrooo/models/private_chat_item.dart';

/// Clase ChatMockMessages: Modelo Auxiliar para simular mensajes entrantes y salientes.
///
/// Permite definir una lista de [initialMessages] que aparecen al abrir el chat
/// y una secuencia de [delayedMessageBatches] que el ViewModel irá disparando
/// para simular una conversación real.
class ChatMockMessages {
  final List<PrivateChatItem> initialMessages;
  final List<List<PrivateChatItem>> delayedMessageBatches;

  /// Crea una instancia de [ChatMockMessages].
  ///
  /// Requiere los mensajes iniciales y la estructura de lotes retardados.
  ChatMockMessages({
    required this.initialMessages,
    required this.delayedMessageBatches,
  });
}

/// Función auxiliar para convertir un String "HH:mm" en un objeto DateTime
/// IMPORTANTE:
/// - NO formatea la hora para mostrarla.
/// - Solo crea el objeto DateTime.
/// - La visualización se gestiona en la UI (ChatBubble) mediante _formatTime.
DateTime time(String hhmm) {
  final parts = hhmm.split(':'); // "22:45" → ["22","45"]
  return DateTime(0, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
}

/// Mensajes simulados de algunos contactos (Mira, Darwin, Robin)
///
/// Cada lista contiene el historial completo de mensajes que se usará en el mapa.

// Mensaje de Mira
final List<PrivateChatItem> miraMessages = [
  PrivateChatItem(
    id: '1',
    text: "Alles Gut? It's been ages!",
    isMe: false,
    time: time("22:45"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '2',
    text:
        'How is it going Michael, shall we catch up while grabbing dinner tonight?',
    isMe: false,
    time: time("22:45"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '3',
    text: 'Great!',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '4',
    text: 'At 7:30 pm sounds good?',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '5',
    text: 'Indian or Mexican?',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '6',
    text: 'Cool! Will send you the link in a bit.\nLooking forward to it! ^^',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '7',
    text: 'See ya ~~',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
];

// Mensaje de Darwin
final List<PrivateChatItem> darwinMessages = [
  PrivateChatItem(
    id: '1',
    text: "Don't know yet. We shall see how the meeting goes.",
    isMe: false,
    time: time("22:00"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '2',
    text: 'But the flyer you sent me sounds promising.',
    isMe: false,
    time: time("22:00"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '3',
    text: 'What day shall we book it?',
    isMe: false,
    time: time("22:05"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '4',
    text: "I will ask Joe to join too. I am sure he'll be thrilled too.",
    isMe: false,
    time: time("22:15"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '5',
    text: 'Will keep you posted then 👍',
    isMe: false,
    time: time("22:15"),
    type: 'text',
  ),

  PrivateChatItem(
    id: '6',
    text: 'Told ya! So when are we going?',
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),

  PrivateChatItem(
    id: '7',
    text: "Awesome!!! Let's start booking then!",
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
];

// Mensaje de Robin
final List<PrivateChatItem> robinMessages = [
  PrivateChatItem(
    id: '1',
    text: "Hey! How are you doing Michael? Long time no see!",
    isMe: false,
    time: time("21:35"),
    type: 'text',
  ),
  PrivateChatItem(
    id: '2',
    text: "Next month I'll be flying to London for a conference.",
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '3',
    text: "You bet! Let's meet at our usual restaurant, shall we?",
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
  PrivateChatItem(
    id: '4',
    text: "Ok, till next time. Take care! 😉",
    isMe: false,
    time: DateTime.now(),
    type: 'text',
  ),
];

/// MAPA FINAL: Relación chatId → conversación mock.
///
/// Este mapa es la fuente de verdad que consulta el [ChatThreadScreen]
/// al iniciarse para cargar los mensajes correspondientes a cada usuario.
final Map<String, ChatMockMessages> mockMessagesByChatId = {
  'user_1': ChatMockMessages(
    initialMessages: [miraMessages[0], miraMessages[1]],
    delayedMessageBatches: [
      [miraMessages[2], miraMessages[3]],
      [miraMessages[4]],
      [miraMessages[5]],
      [miraMessages[6]],
    ],
  ),

  'user_2': ChatMockMessages(
    initialMessages: [
      darwinMessages[0],
      darwinMessages[1],
      darwinMessages[2],
      darwinMessages[3],
      darwinMessages[4],
    ],
    delayedMessageBatches: [
      [darwinMessages[5]],
      [darwinMessages[6]],
    ],
  ),

  'user_3': ChatMockMessages(
    initialMessages: [robinMessages[0]],
    delayedMessageBatches: [
      [robinMessages[1]],
      [robinMessages[2]],
      [robinMessages[3]],
    ],
  ),
};
