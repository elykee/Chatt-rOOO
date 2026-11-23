import 'package:flutter/material.dart';

/// Clase CloseButton: componente personalizado del botón de cierre.
///
/// Este widget se utiliza principalmente en cabeceras de diálogos o
/// [showModalBottomSheet] para permitir al usuario cerrar la vista actual
/// y regresar a la pantalla anterior.
class CloseButton extends StatelessWidget {
  /// Crea una instancia de [CloseButton].
  ///
  /// Utiliza la [key] para la gestión interna de Flutter. No requiere
  /// parámetros adicionales ya que su función es siempre cerrar la vista actual.
  const CloseButton({super.key});

  /// Estructura principal del componente.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: IconButton(
        onPressed: () {
          // Cierra la pantalla o modal actual en el stack de navegación.
          Navigator.pop(context);
        },
        icon: Icon(Icons.close_outlined),
        tooltip: 'Close',
      ),
    );
  }
}
