import 'package:flutter/material.dart';

/// Widget reutilizable que representa un botón elevado personalizado.
///
/// Este componente encapsula un [ElevatedButton] con dimensiones y estilos
/// configurables, pensado para acciones de navegación como
/// **"Agree and Continue"**, **"Next"** o botones primarios en flujos
/// de onboarding y formularios.
///
/// ### Características:
/// - Altura fija para consistencia visual.
/// - Ancho configurable o adaptativo según el tamaño de pantalla.
/// - Texto personalizable.
/// - Color de fondo opcional.
/// - Estilo de texto configurable.
///
/// ### Ejemplo de uso:
/// ```dart
/// CustomElevatedButton(
///   text: 'Next',
///   onPressed: () {
///     print('Continuar');
///   },
///   backgroundColor: Colors.green,
/// )
/// ```
//
// Clase CustomElevatedButton : compomente personalizado del botón de navegación 'Agree and Continue' y 'Next'
class CustomElevatedButton extends StatelessWidget {
  /// Ancho del botón.
  ///
  /// Si se proporciona, el botón utilizará este valor.
  /// Si es nulo, el ancho se calcula automáticamente como
  /// el ancho de la pantalla menos 100 píxeles.
  final double? buttonWidth;

  /// Función que se ejecuta cuando el usuario pulsa el botón.
  ///
  /// Este callback es obligatorio y define la acción principal del botón.
  final VoidCallback onPressed;

  /// Texto que se muestra dentro del botón.
  ///
  /// Normalmente representa la acción principal, por ejemplo:
  /// `"Next"`, `"Agree and Continue"`, `"Confirmar"`.
  final String text;

  /// Color de fondo del botón.
  ///
  /// Si no se especifica, se utiliza el color definido por el tema
  /// actual de [ElevatedButton].
  final Color? backgroundColor;

  /// Estilo del texto del botón.
  ///
  /// Permite personalizar tamaño, color, peso de fuente, etc.
  /// Si es nulo, se utiliza el estilo por defecto del tema.
  final TextStyle? textStyle;

  /// Constructor de una instancia de [CustomElevatedButton].
  ///
  /// Los parámetros [onPressed] y [text] son obligatorios.
  /// El ancho, color de fondo y estilo de texto son opcionales.
  const CustomElevatedButton({
    super.key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textStyle,
  });

  /// Construye la interfaz visual del botón.
  ///
  /// El botón se envuelve en un [SizedBox] para controlar su tamaño,
  /// y utiliza un [ElevatedButton] para mostrar el texto y manejar
  /// la interacción del usuario.
  ///
  /// La altura del botón es fija (42 px) para mantener consistencia
  /// en toda la aplicación.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        style: backgroundColor != null
            ? ElevatedButton.styleFrom(backgroundColor: backgroundColor)
            : null,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
