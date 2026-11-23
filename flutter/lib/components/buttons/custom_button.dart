import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:flutter/material.dart';

/// Clase CustomButton: componente personalizado del botón 'Micrófono' y 'Enviar'.
///
/// Este widget circular se utiliza en el área de entrada del chat para acciones
/// principales. Implementa [Semantics] para garantizar que sea accesible
/// para usuarios con lectores de pantalla.
class CustomButton extends StatelessWidget {
  /// El icono que se mostrará en el centro del botón.
  final IconData icon;

  /// El color del icono. Si es nulo, se aplica un color por defecto (navy950).
  final Color? iconColor;

  /// Función que se ejecuta al presionar el botón.
  final VoidCallback onPressed;

  /// Color de fondo del botón circular. Si es nulo, utiliza el color verde del tema.
  final Color? backgroundColor;

  /// Texto descriptivo para herramientas de accesibilidad.
  final String? semanticLabel;

  /// Crea una instancia de [CustomButton].
  ///
  /// Requiere obligatoriamente un [icon] y la función [onPressed].
  /// Permite personalizar colores y etiquetas de accesibilidad de forma opcional.
  const CustomButton({
    super.key,
    required this.icon,
    this.iconColor,
    required this.onPressed,
    this.backgroundColor,
    this.semanticLabel,
  });

  /// Construye la interfaz visual del botón.
  ///
  /// Utiliza un [Material] con [CircleBorder] y [InkWell] para proporcionar
  /// una respuesta visual táctil (efecto splash) perfectamente circular.
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel, // el lector de pantalla leerá esto (Accesibilidad)
      button: true, // indica que es un botón
      child: Material(
        color: backgroundColor ?? context.theme.greenColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon, color: iconColor ?? Colours.navy950),
          ),
        ),
      ),
    );
  }
}
