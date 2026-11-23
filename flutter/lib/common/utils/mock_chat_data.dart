import 'package:chattrooo/models/chat_item.dart';

/// Lista de chats individuales.
///
/// Esta lista de datos simulados (mock) representa la pantalla principal de chats.
/// Cada [ChatItem] incluye un `id` único que se utiliza para vincular la conversación
/// con sus respectivos mensajes en el mapa de mensajes.
final List<ChatItem> mockChatList = [
  // Chat con Mira. El id 'user_1' vincula con [miraMessages] en el mock de datos.
  ChatItem(
    id: 'user_1',
    image: "assets/images/mira.png",
    name: "Mira",
    lastMsg: "Alles gut? It's ...",
    time: "22:45",
    msg: "2",
  ),
  // Chat con Darwin. El id 'user_2' vincula con [darwinMessages].
  ChatItem(
    id: 'user_2',
    image: "assets/images/darwin.png",
    name: "Darwin",
    lastMsg: "Don't know yet. W ...",
    time: "22:15",
    msg: "5",
  ),
  // Chat con Robin. El id 'user_3' vincula con [robinMessages].
  ChatItem(
    id: 'user_3',
    image: "assets/images/robin.png",
    name: "Robin",
    lastMsg: "Hey! How are you d ...",
    time: "21:35",
    msg: "1",
  ),
  ChatItem(
    id: 'user_4',
    image: "assets/images/sienna.png",
    name: "Sienna",
    lastMsg: "Wil go to the mov ...",
    time: "20:00",
    msg: "3",
  ),
  ChatItem(
    id: 'user_5',
    image: "assets/images/joe.png",
    name: "Joe",
    lastMsg: "Let's see how it ...",
    time: "17:35",
    msg: "4",
  ),
  ChatItem(
    id: 'user_6',
    image: "assets/images/julie.png",
    name: "Julie",
    lastMsg: "Thank you, just g ...",
    time: "17:20",
    msg: "6",
  ),
  ChatItem(
    id: 'user_7',
    image: "assets/images/phoenix.png",
    name: "Phoenix",
    lastMsg: "Hopefully soon. W ...",
    time: "17:00",
    msg: "7",
  ),
  // Caso de prueba: Imagen nula.
  ChatItem(
    id: 'user_8',
    image: null,
    name: "Dina",
    lastMsg: "No worries. Will c ...",
    time: "15:15",
    msg: "1",
  ),
  ChatItem(
    id: 'user_9',
    image: "assets/images/sidney.png",
    name: "Sidney",
    lastMsg: ">_< I'll look into ...",
    time: "Yesterday",
    msg: "3",
  ),
  // Caso de prueba: Imagen vacía.
  ChatItem(
    id: 'user_10',
    image: "",
    name: "Sara",
    lastMsg: "So broke man, but I ...",
    time: "Yesterday",
    msg: "1",
  ),
  // Caso de prueba: Contador de mensajes vacío.
  ChatItem(
    id: 'user_11',
    image: "assets/images/sabrina.png",
    name: "Sabrina",
    lastMsg: "Ok, cool. Thanks f ...",
    time: "Yesterday",
    msg: "",
  ),
  // Caso de prueba: Contador de mensajes nulo.
  ChatItem(
    id: 'user_12',
    image: "assets/images/journey.png",
    name: "Journey",
    lastMsg: "Check this out. Hop ...",
    time: "1/10/26",
    msg: null,
  ),

  ChatItem(
    id: 'user_13',
    image: "assets/images/liam.png",
    name: "Liam",
    lastMsg: "Haven't seen it yet ...",
    time: "1/13/26",
    msg: "",
  ),
];
