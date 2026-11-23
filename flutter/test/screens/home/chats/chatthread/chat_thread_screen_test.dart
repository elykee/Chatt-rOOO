import 'package:chattrooo/common/theme/dark_theme.dart';
import 'package:chattrooo/common/theme/light_theme.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:chattrooo/screens/home/chats/chatthread/help_screen.dart';
import 'package:chattrooo/screens/home/chats/chatthread/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:chattrooo/screens/home/chats/chatthread/chat_thread_screen.dart';
import 'package:chattrooo/viewmodels/chat_view_model.dart';
import 'package:chattrooo/common/utils/mock_chat_data.dart';
import 'package:chattrooo/common/utils/mock_messages_data.dart';
import 'package:chattrooo/components/containers/chat_bubble.dart';

void main() {
  /// Grupo de pruebas para la pantalla de hilo de chat [ChatThreadScreen].
  ///
  /// Se utiliza un bucle para iterar sobre [mockChatList], garantizando que
  /// la pantalla renderice correctamente la información de cualquier contacto.
  group('ChatThreadScreen Widget Tests', () {
    for (var chat in mockChatList) {
      /// Test principal: AppBar, Body y Área de Input
      testWidgets('Content renders correctly for chat: ${chat.name}', (
        tester,
      ) async {
        /// Inicializamos el ViewModel
        final ChatViewModel vm = ChatViewModel();

        /// Inyectamos las dependencias necesarias:
        /// 1. [ChangeNotifierProvider] para que el widget acceda al estado.
        /// 2. [MaterialApp] para cargar los temas y permitir navegación.
        await tester.pumpWidget(
          ChangeNotifierProvider.value(
            value: vm,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: ThemeMode.system,
              home: ChatThreadScreen(chatId: chat.id, chatName: chat.name),
            ),
          ),
        );

        /// Renderiza el primer frame y espera a que terminen las animaciones iniciales.
        await tester.pumpAndSettle();

        final mock = mockMessagesByChatId[chat.id];

        /// Verificación de la AppBar
        expect(find.byType(SimpleAppBar), findsOneWidget);

        /// Verifica que aparezca el avatar del usuario
        final avatar = find.byType(UserAvatar);
        expect(avatar, findsOneWidget);

        /// Verifica que el nombre del contacto y su estado "Online" sean visibles
        final title = find.text(chat.name);
        final subtitle = find.text('Online');
        expect(title, findsOneWidget);
        expect(subtitle, findsOneWidget);

        /// Verificación de botones de acción mediante Tooltips (Accesibilidad)
        final videoCallButton = find.byTooltip('Video Call');
        final reportsButton = find.byTooltip('Reports');
        final helpButton = find.byTooltip('Help');
        expect(videoCallButton, findsOneWidget);
        expect(reportsButton, findsOneWidget);
        expect(helpButton, findsOneWidget);

        /// Body: Lista de mensajes
        if (mock != null && mock.initialMessages.isNotEmpty) {
          /// Verifica que el número de burbujas [ChatBubble] coincida con los datos mock
          expect(
            find.byType(ChatBubble),
            findsNWidgets(mock.initialMessages.length),
          );

          /// Asegura que el contenido textual de cada mensaje sea el correcto
          for (var msg in mock.initialMessages) {
            expect(find.text(msg.text), findsOneWidget);
          }
        } else {
          /// Si no hay mensajes, no debe renderizarse ninguna burbuja
          expect(find.byType(ChatBubble), findsNothing);
        }

        /// Body: Área de entrada de texto (input)
        expect(find.byType(TextField), findsOneWidget);

        /// Comprobaciones de existencia de los botones de interacción y su accesibilidad
        final emoticonButton = find.byTooltip('Select emoticon');
        final attachFileButton = find.byTooltip('Attach file');
        final cameraButton = find.byTooltip('Camera');
        final micButton = find.bySemanticsLabel('Record voice message');
        final sendButton = find.bySemanticsLabel('Send message');
        expect(emoticonButton, findsOneWidget);
        expect(attachFileButton, findsOneWidget);
        expect(cameraButton, findsOneWidget);
        expect(micButton, findsOneWidget);
        expect(sendButton, findsOneWidget);
      });

      /// Test navegación Reports
      testWidgets('Reports button navigates for chat: ${chat.name}', (
        tester,
      ) async {
        /// Inicializamos el ViewModel
        final ChatViewModel vm = ChatViewModel();

        /// Construir el widget con MaterialApp y Provider
        await tester.pumpWidget(
          ChangeNotifierProvider.value(
            value: vm,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: ThemeMode.system,
              home: ChatThreadScreen(chatId: chat.id, chatName: chat.name),
            ),
          ),
        );

        /// Esperar a que todo se construya y futuros terminen
        await tester.pumpAndSettle();

        /// Acción: Simula un toque en el botón de reportes
        final reportsButton = find.byTooltip('Reports');
        await tester.tap(reportsButton);

        /// Espera a que la animación de navegación termine completamente
        await tester.pumpAndSettle();

        /// Verificación: [ReportScreen] debe ser visible y [ChatThreadScreen] debe haber salido del árbol
        expect(find.byType(ReportScreen), findsOneWidget);

        /// Comprobar que la pantalla anterior ya no está visible
        expect(find.byType(ChatThreadScreen), findsNothing);
      });

      /// Test navegación Help
      testWidgets('Help button navigates for chat: ${chat.name}', (
        tester,
      ) async {
        /// Inicializamos el ViewModel
        final ChatViewModel vm = ChatViewModel();

        /// Construcción del entorno del widget
        await tester.pumpWidget(
          ChangeNotifierProvider.value(
            value: vm,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: ThemeMode.system,
              home: ChatThreadScreen(chatId: chat.id, chatName: chat.name),
            ),
          ),
        );

        /// Espera a que la interfaz esté lista
        await tester.pumpAndSettle();

        /// Acción: Simula un toque en el botón de ayuda
        final helpButton = find.byTooltip('Help');
        await tester.tap(helpButton);

        /// Espera a que la animación de navegación termine
        await tester.pumpAndSettle();

        /// Comprobar que HelpScreen está presente
        expect(find.byType(HelpScreen), findsOneWidget);

        /// Verificación: Comprobar que [HelpScreen] es ahora la pantalla activa
        expect(find.byType(ChatThreadScreen), findsNothing);
      });
    }
  });
}
