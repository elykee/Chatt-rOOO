import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:flutter/material.dart';

/// Pantalla de ayuda y manual de usuario.
///
/// Proporciona información sobre el funcionamiento de la aplicación,
/// como la arquitectura utilizada y guías de uso de funcionalidades.
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  /// Estructura principal de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado
      appBar: SimpleAppBar(
        title: 'User manual',
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Información sobre el patrón arquitectónico.
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('MVVM architectural pattern', style: context.title2),
            subtitle: Text(
              'This app uses the MVVM pattern, making the codebase more modular and testable.',
              style: context.text3,
            ),
          ),

          // Guía de uso para la entrada de voz.
          ListTile(
            leading: Icon(Icons.mic_outlined),
            title: Text('Voice input', style: context.title2),
            subtitle: Text(
              'Press the microphone button to start speech recording.',
              style: context.text3,
            ),
          ),
        ],
      ),
    );
  }
}
