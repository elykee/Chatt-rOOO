import 'package:flutter/material.dart';

/// Clase Colours: Definición de la paleta de colores globales de la aplicación.
///
/// Esta clase utiliza un constructor privado `Colours._()` para evitar su
/// instanciación y centraliza todos los valores hexadecimales de color,
/// organizados por familias (Neutros, Marca y Estado).
class Colours {
  /// Constructor privado para prevenir la creación de objetos de esta clase.
  Colours._();

  //Base neutrals/Backgrounds
  // Tonos oscuros utilizados para fondos de pantalla, barras y elementos base.
  static const Color navy600 = Color(0xFF4A4FA3);
  static const Color navy700 = Color(0xFF2E2E82);
  static const Color navy800 = Color(0xff0E0E55);
  static const Color navy900 = Color(0xff050545);
  static const Color navy950 = Color(0xFF00003B);

  // Tonos claros/lavanda utilizados para superficies secundarias y textos suaves.
  static const Color lavender50 = Color(0xFFF4F4FD);
  static const Color lavender100 = Color(0xffEBEBFC);
  static const Color lavender200 = Color(0xFFDDDCFB);
  static const Color lavender300 = Color(0xFFD0CFF9);
  static const Color lavender400 = Color(0xFFC3C2F8);
  static const Color lavender500 = Color(0xffAFAFF5);

  // Brand / Accent colors
  // Colores de identidad de marca utilizados en botones, iconos activos y resaltados.
  static const Color green500 = Color(0xFF00FF85);
  static const Color green600 = Color(0xFF00DF9D);

  static const Color teal700 = Color(0xff00AFAC);
  static const Color teal800 = Color(0xff007D9F);

  // Status colors
  // Colores funcionales para indicar errores, alertas o llamadas perdidas.
  static const Color red500 = Color(0xFFF44336);
  static const Color red600 = Color(0xFFBE3B31);
}
