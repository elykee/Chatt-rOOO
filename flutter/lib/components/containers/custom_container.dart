import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';

import 'package:flutter/material.dart';

/// Clase CustomContainer: Contenedor personalizado para el input de código en la pantalla OTP.
///
/// Este widget encapsula un campo de texto estilizado para la entrada de un único
/// dígito del código de verificación, gestionando su propia decoración y centrado.
class CustomContainer extends StatelessWidget {
  /// Controlador para gestionar el valor del texto en este contenedor.
  final TextEditingController controller;

  /// Crea una instancia de [CustomContainer].
  ///
  /// Requiere obligatoriamente un [controller] para que el widget padre
  /// pueda recuperar el dígito ingresado.
  const CustomContainer({super.key, required this.controller});

  /// Estructura principal del widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.otpcodeboxColor,
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: context.label1.copyWith(
          color: context.theme.otpinputtextColor,
          height: 1.2,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1, // Limita la entrada a un solo carácter
        decoration: InputDecoration(
          hintText: '*',
          hintStyle: context.title2.copyWith(
            color: context.theme.otphinttextColor,
            height: 3,
          ),
          border: InputBorder.none,
          counterText: '', // Oculta el contador visual (0/1) debajo del campo
          semanticCounterText: 'Only one digit allowed', // Para accesibilidad
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
