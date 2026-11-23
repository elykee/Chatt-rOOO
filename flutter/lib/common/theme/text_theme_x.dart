import 'package:flutter/material.dart';

/// Extensión de estilos de texto para optimizar referencias (atajo).
///
/// Esta extensión sobre [BuildContext] permite acceder de forma rápida y legible
/// a los estilos definidos en el [TextTheme] global de la aplicación, evitando
/// repetir la sintaxis `Theme.of(context).textTheme...`.
extension TextThemeX on BuildContext {
  /// Getter privado para obtener el tema de texto actual del contexto.
  TextTheme get _text => Theme.of(this).textTheme;

  // Estilos de encabezado (Headlines)
  TextStyle get h1 => _text.displayLarge!;
  TextStyle get h2 => _text.displayMedium!;
  TextStyle get h3 => _text.displaySmall!;

  // Estilos de títulos (Titles)
  TextStyle get title1 => _text.titleLarge!;
  TextStyle get title2 => _text.titleMedium!;

  // Estilos de cuerpo de texto (Body)
  TextStyle get text1 => _text.bodyLarge!;
  TextStyle get text3 => _text.bodySmall!;

  // Estilos de etiquetas y micro-copys (Labels)
  TextStyle get label1 => _text.labelLarge!;
  TextStyle get label2 => _text.labelMedium!;
  TextStyle get label3 => _text.labelSmall!;
}

// to override use copyWith() 
// Examples
// Text(
//   'Online',
//   style: context.bodySmall.copyWith(
//     color: context.theme.hinttextColor,
//   ),
// ),

// Text(
//   'Warning',
//   style: context.labelLarge.copyWith(
//     color: Colors.red,
//   ),
// ),

// Text(
//   'Message',
//   style: context.body.copyWith(fontSize: 20),
// ),
// Text(
//   'Chats',
//   style: context.title.copyWith(
//     color: context.theme.greenColor,
//   ),
// ),
// Text(
//   'Hello',
//   style: context.body.copyWith(
//     fontWeight: FontWeight.w600,
//   ),
// )





