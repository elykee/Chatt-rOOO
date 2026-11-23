import 'package:flutter/material.dart';

/// Clase [AppTextTheme] centraliza la configuración tipográfica de la aplicación.
///
/// Define dos conjuntos de estilos:
/// 1. [base]: Define las fuentes, tamaños y grosores (esqueleto tipográfico).
/// 2. [themed]: Inyecta dinámicamente el color a la base según el tema activo.
class AppTextTheme {
  /// Constructor privado para evitar instanciación.
  AppTextTheme._();

  /// Define el sistema de fuentes y escalas de la aplicación.
  ///
  /// Utiliza 'MuseoModerno' para estilos de gran impacto (Display) y
  /// 'Comfortaa' para una lectura amigable en el resto de la interfaz (Title, Body, Label).
  static TextTheme base() {
    return const TextTheme(
      // DISPLAY (Headlines usando MuseoModerno Font)
      displayLarge: TextStyle(
        fontFamily: 'MuseoModerno',
        fontSize: 42,
        fontWeight: FontWeight.w900,
      ),
      displayMedium: TextStyle(
        fontFamily: 'MuseoModerno',
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),

      displaySmall: TextStyle(
        fontFamily: 'MuseoModerno',
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),

      // Title (AppBar, ListTile títulos usando Comfortaa Font)
      titleLarge: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      // BODY (Textos largos, mensajes de chat y descripciones usando Comfortaa Font)
      bodyLarge: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),

      bodySmall: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),

      // Label (Etiqueta de botones, contadores de mensajes y fechas usando Comfortaa Font)
      labelLarge: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  /// Aplica el color principal ([textColor]) a todas las escalas del [base].
  ///
  /// Este método es llamado por [lightTheme] y [darkTheme] para asegurar
  /// que la tipografía sea legible sobre cualquier fondo.
  static TextTheme themed({required Color textColor}) {
    final baseTheme = base();
    return TextTheme(
      displayLarge: baseTheme.displayLarge?.copyWith(color: textColor),
      displayMedium: baseTheme.displayMedium?.copyWith(color: textColor),
      displaySmall: baseTheme.displaySmall?.copyWith(color: textColor),
      titleLarge: baseTheme.titleLarge?.copyWith(color: textColor),
      titleMedium: baseTheme.titleMedium?.copyWith(color: textColor),
      bodyLarge: baseTheme.bodyLarge?.copyWith(color: textColor),
      bodySmall: baseTheme.bodySmall?.copyWith(color: textColor),
      labelLarge: baseTheme.labelLarge?.copyWith(color: textColor),
      labelMedium: baseTheme.labelMedium?.copyWith(color: textColor),
      labelSmall: baseTheme.labelSmall?.copyWith(color: textColor),
    );
  }
}
