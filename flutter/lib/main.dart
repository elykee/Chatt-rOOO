import 'package:chattrooo/common/theme/dark_theme.dart';
import 'package:chattrooo/common/theme/light_theme.dart';
import 'package:chattrooo/screens/splashscreen/splash_screen.dart';
import 'package:chattrooo/viewmodels/chat_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

/// Punto de entrada principal de la aplicación.
///
/// En esta función se inicializa el sistema de inyección de estados mediante
/// [MultiProvider], permitiendo que el [ChatViewModel] esté disponible en
/// toda la jerarquía de widgets.
void main() {
  runApp(
    /// Configuración de la arquitectura MVVM a nivel global.
    /// Se utiliza [MultiProvider] para facilitar la escalabilidad futura
    /// (añadir más ViewModels sin modificar la estructura raíz).
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatViewModel())],
      child: const ChattrOOOApp(),
    ),
  );
}

/// Widget raíz de la aplicación que configura el entorno global de Flutter.
///
/// Esta clase define:
/// - El sistema de temas (Luz/Oscuro) dinámico.
/// - El observador de navegación para animaciones [Hero].
/// - La pantalla inicial de la aplicación ([SplashScreen]).
class ChattrOOOApp extends StatelessWidget {
  /// Constructor de [ChattrOOOApp].
  ///
  /// Utiliza la llave [key] para la identificación del widget en el árbol.
  const ChattrOOOApp({super.key});

  // Created by Ely Kee.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chatt'rOOO",

      /// Configuración de Temas:
      /// Utiliza los temas personalizados definidos en la capa 'common/theme'.
      theme: lightTheme(),
      darkTheme: darkTheme(),

      /// Ajusta el tema automáticamente según la configuración del sistema operativo.
      themeMode: ThemeMode.system,

      /// Configuración avanzada de animaciones entre pantallas.
      /// Se añade un [HeroController] personalizado para que las transiciones de
      /// imágenes y elementos sigan una trayectoria curva [MaterialRectCenterArcTween],
      /// lo que resulta en una experiencia de usuario más fluida.
      navigatorObservers: [
        HeroController(
          createRectTween: (begin, end) {
            // Permite un movimiento más curvo y suave
            return MaterialRectCenterArcTween(begin: begin, end: end);
          },
        ),
      ],

      /// Define la pantalla de entrada (Splash) al iniciar la ejecución.
      home: SplashScreen(),
    );
  }
}
