import 'package:chattrooo/common/theme/app_text_theme.dart';
import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:flutter/material.dart';

/// Genera y devuelve el [ThemeData] completo para el modo oscuro de la aplicación.
///
/// Esta función centraliza la configuración de colores, tipografías y estilos
/// de componentes. Utiliza una base oscura (Navy) para reducir la fatiga visual
/// y mejorar el contraste en entornos de poca luz.
ThemeData darkTheme() {
  // Base del tema oscuro de Flutter
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    // Fondo principal de toda la app
    scaffoldBackgroundColor: Colours.navy950,

    // Configuración global de interacciones (desactiva efectos por defecto y define colores de resalte)
    splashColor: Colors.transparent,
    highlightColor: Colours.navy600,
    hoverColor: Colors.transparent,

    // Incorpora las propiedades personalizadas (CustomThemeExtension) para el modo oscuro
    extensions: [CustomThemeExtension.darkMode],

    // Define la tipografía global usando la paleta Lavender para asegurar legibilidad sobre fondo oscuro.
    textTheme: AppTextTheme.themed(textColor: Colours.lavender50),

    // Estilo global de los iconos
    iconTheme: IconThemeData(color: Colours.lavender50),

    // Configuración del AppBar: fondo lavanda suave, sin sombras y texto claro
    appBarTheme: const AppBarTheme(
      backgroundColor: Colours.navy800,
      foregroundColor: Colours.lavender50,
      elevation: 0,
    ),

    // Configuración de los ListTile para listas (Chats, Contactos, etc.)
    listTileTheme: const ListTileThemeData(
      iconColor: Colours.lavender50,
      textColor: Colours.lavender50,
    ),

    // Estilo para los botones principales (ElevatedButton) de la interfaz
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextTheme.base().labelMedium,
        backgroundColor:
            Colours.green500, // Verde brillante para resaltar en el oscuro
        foregroundColor: Colours.navy950,
        splashFactory:
            NoSplash.splashFactory, // Desactiva el efecto de onda expansiva
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),

    // Estilo para los botones flotantes
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colours.green500,
      foregroundColor: Colours.navy950,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Estilo global para los BottomSheets de la app
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: Colours.navy800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // Lógica de color dinámica para los botones de selección (Radio)
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colours.green500; // seleccionado
        }
        return Colours.lavender100; // deseleccionado
      }),
    ),

    // Configuración de la barra de navegación inferior (Bottom Navigation Bar)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colours.navy800,
      elevation: 0,
      indicatorColor: Colours.green500,
      labelTextStyle: WidgetStatePropertyAll(
        AppTextTheme.base().labelSmall!.copyWith(color: Colours.lavender50),
      ),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? Colours
                    .navy950 // Icono oscuro sobre el indicador verde
              : Colours.lavender50, // Icono claro si no está seleccionado
        );
      }),
    ),
  );
}
