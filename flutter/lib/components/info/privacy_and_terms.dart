import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:flutter/material.dart';

// Clase PrivacyAndTerms: Estilo de texto personalizado con RichText.
///
/// Este widget muestra los avisos legales de privacidad y términos de servicio
/// utilizando [RichText] para combinar diferentes estilos y colores en un mismo párrafo.
class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({super.key});

  /// Estructura principal del widget.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Read our ',
          style: context.text3,
          children: [
            // Enlace visual a la Política de Privacidad.
            TextSpan(
              text: 'Privacy Policy.',
              style: context.text3.copyWith(color: context.theme.spantextColor),
            ),
            TextSpan(
              text: ' Tap "Agree and continue" to accept the ',
              style: context.text3,
            ),
            // Enlace visual a los Términos de Servicio.
            TextSpan(
              text: 'Terms of Services.',
              style: context.text3.copyWith(color: context.theme.spantextColor),
            ),
          ],
        ),
      ),
    );
  }
}
