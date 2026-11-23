import 'package:flutter/material.dart';

/// Widget reutilizable que representa un botón circular con un icono centrado.
///
/// Este componente muestra un [Icon] dentro de un botón circular con un color
/// de fondo configurable y soporte para accesibilidad mediante [tooltip].
///
/// Está pensado para ser utilizado como botón de acción en la AppBar,
/// en áreas de input de chat o cualquier lugar donde se requiera un botón
/// de acción circular.
///
/// ### Características:
/// - Forma circular.
/// - Color de fondo configurable.
/// - Icono con color configurable.
/// - Soporte para [tooltip] para accesibilidad.
/// - Efecto táctil personalizado mediante la propiedad 'splashRadius'de [IconButton].
///
/// ### Ejemplo de uso:
/// ```dart
/// CircularActionButton(
///   icon: Icons.favorite,
///   onPressed: () {
///     print('Botón presionado');
///   },
///   backgroundColor: Colors.red,
///   iconColor: Colors.white,
///   tooltip: 'Agregar a favoritos',
/// )
/// ```

/// Clase CircularActionButton: compomente personalizado para botones de iconos en la Appbar y el área de input del chat
class CircularActionButton extends StatelessWidget {
  /// Icono que se mostrará dentro del botón.
  ///
  /// Normalmente se usan iconos del conjunto [Icons], por ejemplo
  /// [Icons.send], [Icons.favorite], [Icons.mic].
  final IconData icon;

  /// Callback que se ejecuta cuando el usuario presiona el botón.
  ///
  /// Puede ser nulo si el botón está deshabilitado
  final VoidCallback? onPressed;

  /// Color de fondo del botón.
  ///
  /// Si no se especifica, se usa [Colors.transparent].
  final Color? backgroundColor;

  /// Color del icono dentro del botón.
  ///
  /// Si no se especifica, se usa el color actual del [IconTheme] del contexto.
  final Color? iconColor;

  /// Texto que aparece al mantener pulsado el botón o al usar lectores de pantalla.
  ///
  /// Mejora la accesibilidad y sirve como [tooltip].
  final String? tooltip;

  /// Constructor de una instancia de [CircularActionButton].
  ///
  /// Los parámetros [icon] son obligatorios. Los demás son opcionales.
  const CircularActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.tooltip,
  });

  /// Construye la interfaz visual del botón.
  ///
  /// Se compone de un contenedor circular que contiene un [IconButton].
  /// El [IconButton] muestra el [icon] con [iconColor], ejecuta [onPressed]
  /// al ser pulsado y muestra [tooltip] si se proporciona.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor ?? IconTheme.of(context).color),
        onPressed: onPressed,
        tooltip: tooltip,
        splashRadius: 32,
      ),
    );
  }
}
