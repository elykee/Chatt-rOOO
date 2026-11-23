import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

/// Clase BottomsheetTopDecoration: componente personalizado de la decoración superior de un BottomSheet.
///
/// Este widget genera la pequeña barra horizontal (indicador de arrastre) que se sitúa
/// en la parte superior de los menús desplegables para mejorar la experiencia visual del usuario.
class BottomsheetTopDecoration extends StatelessWidget {
  /// Crea una instancia de [BottomsheetTopDecoration].
  ///
  /// Utiliza la [key] para el manejo interno de Flutter y no requiere
  /// parámetros adicionales ya que sus dimensiones son constantes.
  const BottomsheetTopDecoration({super.key});

  /// Estructura principal del componente
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 30,
      decoration: BoxDecoration(
        color: context.theme.bottomSheetTopDecoration,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
