import 'package:chattrooo/common/theme/app_text_theme.dart';
import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:flutter/material.dart';

/// Genera y devuelve el [ThemeData] completo para el modo claro de la aplicación.
///
/// Esta función centraliza la configuración de colores, tipografías y estilos
/// de componentes para asegurar una experiencia visual coherente y profesional.
ThemeData lightTheme() {
  // Base del tema claro de Flutter
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    // Fondo principal de toda la app
    scaffoldBackgroundColor: Colours.lavender50,

    // Configuración global de interacciones (desactiva efectos por defecto y define colores de resalte)
    splashColor: Colors.transparent,
    highlightColor: Colours.lavender400,
    hoverColor: Colors.transparent,

    // Incorpora las propiedades personalizadas (CustomThemeExtension) para el modo claro
    extensions: [CustomThemeExtension.lightMode],

    // Define la tipografía global usando la paleta Navy para los textos
    textTheme: AppTextTheme.themed(textColor: Colours.navy950),

    // Estilo global de los iconos
    iconTheme: IconThemeData(color: Colours.navy950),

    // Configuración del AppBar: fondo lavanda suave, sin sombras y texto oscuro
    appBarTheme: const AppBarTheme(
      backgroundColor: Colours.lavender100,
      foregroundColor: Colours.navy950,
      elevation: 0,
    ),

    // Configuración de los ListTile para listas (Chats, Contactos, etc.)
    listTileTheme: const ListTileThemeData(
      iconColor: Colours.navy950,
      textColor: Colours.navy950,
    ),

    // Estilo para los botones principales (ElevatedButton) de la interfaz
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextTheme.base().labelMedium,
        backgroundColor: Colours.green600,
        foregroundColor: Colours.navy950,
        splashFactory:
            NoSplash.splashFactory, // Desactiva el efecto de onda expansiva
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),

    // Estilo para los botones flotantes
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colours.green600,
      foregroundColor: Colours.navy950,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Estilo global para los BottomSheets de la app
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: Colours.lavender100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // Lógica de color dinámica para los botones de selección (Radio)
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colours.teal700; // seleccionado
        }
        return Colours.teal800; // deseleccionado
      }),
    ),

    // Configuración de la barra de navegación inferior (Bottom Navigation Bar)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colours.lavender100,
      elevation: 0,
      indicatorColor: Colours.green600,
      labelTextStyle: WidgetStatePropertyAll(
        AppTextTheme.base().labelSmall!.copyWith(color: Colours.navy950),
      ),
    ),
  );
}
