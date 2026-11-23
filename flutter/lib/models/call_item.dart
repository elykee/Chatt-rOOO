import 'package:flutter/material.dart';

/// Class CallItem: representación del usuario en la pantalla Calls
class CallItem {
  final String name;
  final String? image;
  final String callTime;
  final IconData iconData;

  /// Crea una instancia de [CallItem].
  ///
  /// Requiere obligatoriamente el [name] del contacto, la hora de la llamada [callTime]
  /// y el [iconData] que indica el tipo de llamada (entrante, saliente o perdida).
  /// El parámetro [image] es opcional por si el contacto no tiene foto de perfil.
  CallItem({
    required this.name,
    this.image,
    required this.callTime,
    required this.iconData,
  });
}
