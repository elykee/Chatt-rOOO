import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:flutter/material.dart';

/// Clase UserAvatar: componente personalizado para el avatar de cada usuario.
///
/// Este widget gestiona la visualización de la imagen de perfil del usuario.
/// Si no hay imagen disponible, implementa una lógica de respaldo (fallback)
/// que muestra la inicial del nombre o, en su defecto, un icono genérico.
class UserAvatar extends StatelessWidget {
  /// Identificadores del UserAvatar
  final String name;
  final String? image;
  final double radius;

  /// Crea una instancia de [UserAvatar].
  ///
  /// Requiere el [name] para la lógica de iniciales.
  /// El parámetro [image] es opcional y [radius] tiene un valor predefinido.
  const UserAvatar({
    super.key,
    required this.name,
    this.image,
    this.radius = 30,
  });

  /// Estructura principal del componente
  @override
  Widget build(BuildContext context) {
    // Aquí calculamos si hay imagen
    final bool hasImage = image != null && image!.isNotEmpty;

    final avatar = CircleAvatar(
      radius: radius,
      backgroundImage: hasImage
          ? AssetImage(image!)
          : null, // Si hay imagen válida, la muestra
      backgroundColor: hasImage
          ? null
          : context.theme.avatarbgColor, // Si no hay imagen, fondo default
      child: hasImage
          ? null
          : (name.isNotEmpty && RegExp(r'[A-Za-z]').hasMatch(name[0]))
          ? Text(
              name[0]
                  .toUpperCase(), // Si el nombre empieza con letra, muestra inicial en mayúscula
              style: context.h2.copyWith(color: Colours.lavender50),
            )
          : Icon(
              Icons.person,
              color: context.theme.iconplaceholderColor,
            ), // Si no es letra (ej. número o vacío), muestra icono de persona
    );

    return avatar;
  }
}
