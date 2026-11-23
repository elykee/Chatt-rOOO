import 'package:chattrooo/models/private_chat_item.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// Clase [ChatViewModel] actúa como el mediador entre la UI y los datos del chat.
///
/// Gestiona el estado de la conversación, el procesamiento de mensajes (reales y simulados)
/// y la integración con el hardware para el reconocimiento de voz.
class ChatViewModel extends ChangeNotifier {
  /// Estado interno privado

  /// Lista maestra de mensajes que se muestran en pantalla.
  final List<PrivateChatItem> _messages = [];

  /// Almacena los grupos de mensajes de respuesta programados (fase de simulación).
  List<List<PrivateChatItem>> _pendingBatches = [];

  /// Controla cuál es el siguiente grupo de respuestas automáticas a enviar.
  int _currentBatchIndex = 0;

  /// Estado del micrófono: true si está capturando audio.
  bool _listening = false;

  /// Instancia del motor de reconocimiento de voz.
  final stt.SpeechToText _speech = stt.SpeechToText();

  /// Almacena el texto temporal que el usuario va diciendo por voz.
  String? _lastRecognizedWords;

  /// Constructor: Inicializa el ViewModel listo para ser configurado.
  ///
  /// En nuestro caso está vacío ya que el estado del chat se inyectará
  /// dinámicamente mediante el método [initChat].
  ChatViewModel();

  /// Configura la conversación inicial cargando mensajes previos y respuestas futuras.
  ///
  /// Se apoya en [ChatMockMessages] para simular una conversación dinámica.
  void initChat(
    List<PrivateChatItem> initialMessages,
    List<List<PrivateChatItem>> delayedMessageBatches,
  ) {
    _messages.clear();
    _messages.addAll(initialMessages);
    _pendingBatches = delayedMessageBatches;
    _currentBatchIndex = 0;
    notifyListeners(); // Actualiza la UI con los mensajes iniciales
  }

  /// Getters: Exponen el estado de forma segura a la vista
  int get currentBatchIndex => _currentBatchIndex;
  List<PrivateChatItem> get messages => _messages;
  bool get listening => _listening;
  String? get lastRecognizedWords => _lastRecognizedWords;

  /// Función: Enviar Mensaje.
  ///
  /// Añade el mensaje del usuario a la lista y dispara una respuesta automática
  /// (ya sea de los datos de prueba o una respuesta genérica).
  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Crea y añade el mensaje del usuario
    _messages.add(
      PrivateChatItem(
        id: DateTime.now().toString(),
        text: text,
        isMe: true,
        time: DateTime.now(),
        type: 'text',
      ),
    );

    notifyListeners();

    // Lógica de simulación de respuesta del sistema (Mocking)
    if (_currentBatchIndex < _pendingBatches.length) {
      // Simula que el otro usuario responde después de 2 segundos
      Future.delayed(const Duration(seconds: 2), () {
        final batch = _pendingBatches[_currentBatchIndex].map((msg) {
          return PrivateChatItem(
            id: msg.id,
            text: msg.text,
            isMe: msg.isMe,
            time: DateTime.now(), // hora actual
            type: msg.type,
          );
        }).toList();

        _messages.addAll(batch);
        _currentBatchIndex++;
        notifyListeners(); // Refresca el chat con las respuestas recibidas
      });
    } else {
      // Auto-respuesta genérica cuando se agotan los mensajes de prueba
      Future.delayed(const Duration(seconds: 2), () {
        _messages.add(
          PrivateChatItem(
            id: DateTime.now().toString(),
            text: "I received: $text",
            isMe: false,
            time: DateTime.now(),
            type: 'text',
          ),
        );
        notifyListeners();
      });
    }
  }

  /// Función asíncrona: Gestión del Reconocimiento de Voz.
  ///
  /// Activa o desactiva el micrófono. Utiliza el motor [SpeechToText] para
  /// capturar audio y transformarlo en texto, notificando cambios en tiempo real.
  Future<void> toggleListening() async {
    if (!_listening) {
      // Limpia el buffer antes de empezar
      _lastRecognizedWords = '';

      bool disponible = await _speech.initialize();
      if (disponible) {
        _listening = true;
        notifyListeners();

        _speech.listen(
          onResult: (val) {
            _lastRecognizedWords = val.recognizedWords;

            // Notificamos constantemente para que el usuario vea el dictado en vivo
            notifyListeners();
          },
        );
      }
    } else {
      // Detiene la escucha y libera el micrófono
      _listening = false;
      _speech.stop();
      notifyListeners();
    }
  }

  /// Limpia el texto reconocido acumulado para resetear el campo de entrada.
  void clearRecognizedWords() {
    _lastRecognizedWords = null;
    notifyListeners();
  }
}
