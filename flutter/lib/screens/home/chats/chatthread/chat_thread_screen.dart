import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/common/utils/mock_messages_data.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:chattrooo/components/buttons/circular_action_button.dart';
import 'package:chattrooo/components/buttons/custom_button.dart';
import 'package:chattrooo/components/containers/chat_bubble.dart';
import 'package:chattrooo/screens/home/chats/chatthread/help_screen.dart';
import 'package:chattrooo/screens/home/chats/chatthread/report_screen.dart';
import 'package:chattrooo/viewmodels/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Pantalla de conversación individual (hilo de chat).
///
/// Gestiona el intercambio de mensajes en tiempo real, la entrada por voz
/// y el acceso a reportes y ayuda específicos del chat.
class ChatThreadScreen extends StatefulWidget {
  /// Identificadores del chat individual
  final String chatId;
  final String chatName;
  final String? chatImage;

  /// Crea una instancia de [ChatThreadScreen].
  ///
  /// Requiere obligatoriamente [chatId] y [chatName] para identificar la conversación.
  /// El parámetro [chatImage] es opcional por si el usuario no tiene foto de perfil.
  const ChatThreadScreen({
    super.key,
    required this.chatId,
    required this.chatName,
    this.chatImage,
  });

  @override
  State<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

/// Estado de la pantalla que maneja la sincronización con el ViewModel y la UI local.
class _ChatThreadScreenState extends State<ChatThreadScreen> {
  /// Variables de UI (No contienen lógica de negocio. Permiten: cambiar iconos y fondo al seleccionar)
  bool _barChartSelected = false;
  bool _helpSelected = false;
  bool _videoCallSelected = false;
  bool _attachFileSelected = false;
  bool _cameraSelected = false;
  bool _emoticonSelected = false;
  bool _sendMessageSelected = false;

  /// Control del input de mensajes y foco
  final TextEditingController _controller = TextEditingController();
  final FocusNode _inputFocus = FocusNode();

  /// Inicialización del chat individual cargando datos del mock al ViewModel
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = Provider.of<ChatViewModel>(context, listen: false);
      final chatMock = mockMessagesByChatId[widget.chatId];

      if (chatMock != null) {
        vm.initChat(chatMock.initialMessages, chatMock.delayedMessageBatches);
      } else {
        // Fallback si no hay chat definido
        // La pantalla se abrirá con lista vacía y el usuario podrá seguir escribiendo pero las respuestas serán las auto-respuestas definidas en el ChatViewModel
        vm.initChat([], []);
      }
    });

    /// Escuchar si cambia el foco en el TextField para resetear selecciones visuales.
    _inputFocus.addListener(() {
      if (_inputFocus.hasFocus) {
        // TextField seleccionado → deseleccionamos todos los iconos
        setState(() {
          _emoticonSelected = false;
          _attachFileSelected = false;
          _cameraSelected = false;
          _sendMessageSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    /// Liberación de recursos para evitar fugas de memoria.
    _inputFocus.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Construye la estructura de la conversación y sincroniza la voz con el texto.
  @override
  Widget build(BuildContext context) {
    // Obtener la instancia del ViewModel a través de Provider
    final viewModel = Provider.of<ChatViewModel>(context);

    // Sincronización de resultados de voz al controlador de texto
    if (viewModel.lastRecognizedWords != null &&
        viewModel.lastRecognizedWords != _controller.text &&
        viewModel.listening) {
      _controller.text = viewModel.lastRecognizedWords!;
      // Mover el cursor al final
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }

    return Scaffold(
      // AppBar Personalizado
      appBar: SimpleAppBar(
        title: widget.chatName,
        subtitle: 'Online',
        automaticallyImplyLeading: true,
        titleLeading: UserAvatar(
          name: widget.chatName,
          image: widget.chatImage,
        ),
        actions: [
          //Botón videollamada
          CircularActionButton(
            icon: Icons.videocam_outlined,
            onPressed: () {
              setState(() {
                _videoCallSelected = true;
                _helpSelected = false;
                _barChartSelected = false;
              });
            },
            backgroundColor: _videoCallSelected
                ? context.theme.iconSelected
                : Colors.transparent,
            tooltip: 'Video Call',
          ),
          // Botón informes
          CircularActionButton(
            icon: Icons.bar_chart_outlined,
            onPressed: () {
              setState(() {
                _barChartSelected = true;
                _helpSelected = false;
                _videoCallSelected = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportScreen()),
              ).then((_) {
                setState(() {
                  _barChartSelected = false;
                });
              });
            },
            backgroundColor: _barChartSelected
                ? context.theme.iconSelected
                : Colors.transparent,
            tooltip: 'Reports',
          ),
          // Botón ayuda
          CircularActionButton(
            icon: Icons.help_outlined,
            onPressed: () {
              setState(() {
                _helpSelected = true;
                _barChartSelected = false;
                _videoCallSelected = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HelpScreen()),
              ).then((_) {
                setState(() {
                  _helpSelected = false;
                });
              });
            },
            backgroundColor: _helpSelected
                ? context.theme.iconSelected
                : Colors.transparent,
            tooltip: 'Help',
          ),
        ],
      ),
      // Cuerpo principal con lista de mensajes reactiva
      body: Column(
        children: [
          Expanded(
            /// [Consumer] escucha automáticamente [notifyListeners()] y reconstruye solo la parte necesaria
            child: Consumer<ChatViewModel>(
              builder: (context, vm, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vm.messages.length,
                  itemBuilder: (ctx, i) {
                    final msg = vm.messages[i];
                    // Cada mensaje se pinta con [ChatBubble] widget
                    return ChatBubble(message: msg);
                  },
                );
              },
            ),
          ),
          _buildInputArea(viewModel),
        ],
      ),
    );
  }

  /// Construye el área inferior de entrada de texto
  Widget _buildInputArea(ChatViewModel viewModel) {
    return Container(
      // Añadimos un padding abajo para que no choque con el borde del móvil
      padding: EdgeInsets.fromLTRB(
        16,
        20,
        16,
        MediaQuery.of(context).padding.bottom + 20,
      ),
      color: context.theme.chatnavbarbgColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Semantics(
                label: 'Message input', // accesible para lectores de pantalla
                textField: true,
                child: TextField(
                  controller: _controller,
                  focusNode: _inputFocus,
                  style: context.label1.copyWith(
                    color: context.theme.menuOptionTextColor,
                  ),
                  decoration: InputDecoration(
                    hintText: viewModel.listening
                        ? 'Listening ...'
                        : 'Write a message',
                    hintStyle: context.label2.copyWith(
                      color: context.theme.hinttextColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: context.theme.chatinputfieldColor,
                      ),
                    ),
                    filled: true,
                    fillColor: _inputFocus.hasFocus
                        ? context.theme.searchBarColor
                        : context.theme.chatnavbarbgColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),

                    // Prefijo: Agregar emoticonos
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularActionButton(
                        icon: Icons.insert_emoticon_outlined,
                        iconColor: context.theme.chatinputfieldColor,
                        onPressed: () {
                          _inputFocus.unfocus();
                          setState(() {
                            _emoticonSelected = true;
                            _attachFileSelected = false;
                            _cameraSelected = false;
                          });
                        },
                        backgroundColor: _emoticonSelected
                            ? context.theme.iconSelected
                            : Colors.transparent,
                        tooltip: 'Select emoticon',
                      ),
                    ),

                    // Sufijo: Agregar fichero + Cámara
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularActionButton(
                            icon: Icons.attach_file_outlined,
                            iconColor: context.theme.chatinputfieldColor,
                            onPressed: () {
                              _inputFocus.unfocus();
                              setState(() {
                                _attachFileSelected = true;
                                _cameraSelected = false;
                                _emoticonSelected = false;
                              });
                            },
                            backgroundColor: _attachFileSelected
                                ? context.theme.iconSelected
                                : Colors.transparent,
                            tooltip: 'Attach file',
                          ),
                          const SizedBox(width: 4),
                          CircularActionButton(
                            icon: Icons.camera_alt_outlined,
                            iconColor: context.theme.chatinputfieldColor,
                            onPressed: () {
                              _inputFocus.unfocus();
                              setState(() {
                                _cameraSelected = true;
                                _attachFileSelected = false;
                                _emoticonSelected = false;
                              });
                            },
                            backgroundColor: _cameraSelected
                                ? context.theme.iconSelected
                                : Colors.transparent,
                            tooltip: 'Camera',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Botón micrófono
          CustomButton(
            semanticLabel: 'Record voice message',
            icon: viewModel.listening ? Icons.mic_off : Icons.mic,
            iconColor: viewModel.listening ? Colours.lavender50 : null,
            backgroundColor: viewModel.listening
                ? context.theme.iconRecordbgColor
                : context.theme.greenColor,
            onPressed: () => viewModel.toggleListening(),
          ),

          const SizedBox(width: 8),

          // Botón enviar mensaje
          CustomButton(
            semanticLabel: 'Send message',
            icon: Icons.send,
            backgroundColor: _sendMessageSelected
                ? context.theme.iconSendtogglebgColor
                : null,
            onPressed: () {
              setState(() {
                _sendMessageSelected = true;
              });
              viewModel.sendMessage(_controller.text);
              _controller.clear();
              viewModel.clearRecognizedWords();
              if (viewModel.listening) viewModel.toggleListening();

              // Resetear despues de un delay
              Future.delayed(const Duration(milliseconds: 700), () {
                setState(() {
                  _sendMessageSelected = false;
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
