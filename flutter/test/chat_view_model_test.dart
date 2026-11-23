import 'package:flutter_test/flutter_test.dart';
import 'package:chattrooo/viewmodels/chat_view_model.dart';
import 'package:chattrooo/common/utils/mock_messages_data.dart';

void main() {
  /// Grupo de pruebas unitarias para [ChatViewModel].
  ///
  /// Estas pruebas validan la lógica de envío de mensajes, la gestión de estados
  /// y la correcta integración de los flujos de datos simulados (mocks).
  group('ChatViewModel Tests', () {
    late ChatViewModel vm;

    /// Configuración inicial que se ejecuta antes de cada test individual.
    /// Garantiza que cada prueba trabaje con una instancia limpia del ViewModel.
    setUp(() {
      vm = ChatViewModel();
    });

    /// Test: Estado inicial
    /// Comprueba el estado inicial de [currentBatchIndex] y que no se haya enviado ningún lote todavía
    test('Initial state of currentBatchIndex should be 0', () {
      expect(vm.currentBatchIndex, 0);
    });

    /// Verifica que el método [initChat] pueble correctamente el estado para cada [chatId].
    test('Initial state with mock messages for all chatIds', () {
      for (var entry in mockMessagesByChatId.entries) {
        final chatId = entry.key;
        final mock = entry.value;

        /// Acción: Inicializar el chat con los datos de prueba.
        vm.initChat(mock.initialMessages, mock.delayedMessageBatches);

        /// Validación de longitud de mensajes.
        expect(
          vm.messages.length,
          mock.initialMessages.length,
          reason:
              'Failed for chatId $chatId', // Argumento reason es un aviso en caso de fallo
        );

        /// Si hay mensajes iniciales, el primero suele ser del contacto (isMe: false).
        if (mock.initialMessages.isNotEmpty) {
          expect(
            vm.messages.first.isMe,
            false,
            reason: 'Failed for chatId $chatId',
          );
        }

        /// Verificación de estados secundarios de control:
        /// 1. [currentBatchIndex]: Asegura que el contador de respuestas automáticas esté a 0 (inicio del guion).
        /// 2. [listening]: Garantiza que el micrófono esté apagado por defecto al iniciar el chat.
        expect(vm.currentBatchIndex, 0, reason: 'Failed for chatId $chatId');
        expect(vm.listening, false, reason: 'Failed for chatId $chatId');

        /// Reinicio manual de la instancia para la siguiente iteración del loop.
        vm = ChatViewModel();
      }
    });

    /// Test de envíos de mensajes vacíos
    test('Send message with empty text should do nothing', () {
      final initialCount = vm.messages.length;

      /// Acción: Intentar enviar una cadena vacía.
      vm.sendMessage('');

      /// Verificación: La lista no debe haber crecido.
      expect(vm.messages.length, initialCount);
    });

    /// Test de integración de mensajes: enviar mensaje agrega mensaje del usuario para todos los chatIds
    test('Send message adds user message for all chatIds', () {
      for (var entry in mockMessagesByChatId.entries) {
        final chatId = entry.key;
        final mock = entry.value;

        vm.initChat(mock.initialMessages, mock.delayedMessageBatches);

        final initialCount = vm.messages.length;

        /// Acción: Enviar un mensaje de texto válido.
        const testMessage = 'Hello, how are you?';
        vm.sendMessage(testMessage);

        /// Validaciones de integridad del mensaje enviado.
        expect(
          vm.messages.length,
          initialCount + 1,
          reason: 'Failed for chatId $chatId',
        );
        expect(
          vm.messages.last.text,
          testMessage,
          reason: 'Failed for chatId $chatId',
        );
        expect(
          vm.messages.last.isMe,
          true, // El mensaje debe marcarse como enviado por el usuario.
          reason: 'Failed for chatId $chatId',
        );

        /// Limpiamos el VM para el siguiente loop
        vm = ChatViewModel();
      }
    });

    /// Test de unidad puro: valida la funcionalidad básica de envío (sendMessage) sin dependencias externas (sin mocks)
    test('Send message adds the message to the list and send it', () {
      final initialCount = vm.messages.length;
      vm.sendMessage('Hello, how are you?');
      expect(vm.messages.length, initialCount + 1);
      expect(vm.messages.last.text, 'Hello, how are you?');
      expect(vm.messages.last.isMe, true);
    });

    /// Test de asincronía y respuestas automáticas: comprueba que sendMessage dispara los delayed batches para todos los chatIds
    test('Send message triggers delayed batches for all chatIds', () async {
      for (var entry in mockMessagesByChatId.entries) {
        final chatId = entry.key;
        final mock = entry.value;

        /// Inicializamos el ViewModel con mensajes iniciales y batches
        vm.initChat(mock.initialMessages, mock.delayedMessageBatches);

        final initialCount = vm.messages.length;

        /// Acción: Enviar mensaje para detonar la respuesta.
        vm.sendMessage('Hi');

        /// Sincronización: Esperamos 2 segundos para dar tiempo al Future.delayed del ViewModel.
        /// NOTA: este tiempo debe ser igual o mayor al delay usado en nuestro ChatViewModel
        await Future.delayed(const Duration(seconds: 2));

        /// Cálculo de longitud esperada: inicial + el enviado + el lote de respuesta (si existe).
        final expectedLength =
            initialCount +
            1 +
            (mock.delayedMessageBatches.isNotEmpty
                ? mock.delayedMessageBatches[0].length
                : 0);

        expect(
          vm.messages.length,
          expectedLength,
          reason: 'Failed for chatId $chatId',
        );

        /// Limpiamos el ViewModel para la siguiente iteración
        vm = ChatViewModel();
      }
    });
  });
}
