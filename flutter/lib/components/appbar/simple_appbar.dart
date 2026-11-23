import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/components/buttons/circular_action_button.dart';
import 'package:flutter/material.dart';

/// Clase SimpleAppBar: AppBar personalizado que gestiona sus propios estados internos.
///
/// Este componente extiende la funcionalidad del [AppBar] estándar para incluir
/// un manejo automático de estados visuales (selección) en sus botones de acción,
/// permitiendo además una configuración flexible de títulos, subtítulos y avatares.
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions; // Opcional, si null, usar los iconos por defecto
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;
  final Widget? titleLeading;
  final TextStyle? style;
  final TextStyle? subtitleStyle;

  /// Crea una instancia de [SimpleAppBar].
  ///
  /// Requiere obligatoriamente un [title]. La altura por defecto es de 80px
  /// para dar espacio al diseño de cabecera con subtítulos o avatares.
  const SimpleAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.automaticallyImplyLeading = false,
    this.actions,
    this.bottom,
    this.toolbarHeight = 80,
    this.titleLeading,
    this.style,
    this.subtitleStyle,
  });

  /// Define el tamaño necesario para el AppBar, sumando el área del 'bottom' si existe.
  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));

  /// Estructura principal del componente.
  @override
  Widget build(BuildContext context) {
    /// [ValueNotifiers] internos para gestionar el estado visual sin necesidad de un StatefulWidget.
    final ValueNotifier<bool> searchSelected = ValueNotifier(false);
    final ValueNotifier<bool> moreSelected = ValueNotifier(false);

    /// Lógica para alternar el estado del botón 'Search'.
    void onSearchPressed() {
      searchSelected.value = !searchSelected.value;
      moreSelected.value = false;
    }

    /// Lógica para alternar el estado del botón 'More options'.
    void onMorePressed() {
      moreSelected.value = !moreSelected.value;
      searchSelected.value = false;
    }

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: toolbarHeight,
      title: Padding(
        padding: EdgeInsets.only(left: automaticallyImplyLeading ? 0 : 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mostrar titleLeading si existe
            if (titleLeading != null) titleLeading!,
            if (titleLeading != null) const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(title, style: style ?? context.title1),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style:
                          subtitleStyle ??
                          context.label3.copyWith(
                            color: context.theme.subtitleColor,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children:
                actions ??
                [
                  // Botón 'Search' con estado interno
                  ValueListenableBuilder(
                    valueListenable: searchSelected,
                    builder: (context, selected, _) {
                      return CircularActionButton(
                        icon: Icons.search_outlined,
                        backgroundColor: selected
                            ? context.theme.iconSelected
                            : Colors.transparent,
                        tooltip: 'Search',
                        onPressed: () {
                          onSearchPressed();
                        },
                      );
                    },
                  ),

                  // Botón 'More options' con estado interno
                  ValueListenableBuilder(
                    valueListenable: moreSelected,
                    builder: (context, selected, _) {
                      return CircularActionButton(
                        icon: Icons.more_vert_outlined,
                        backgroundColor: selected
                            ? context.theme.iconSelected
                            : Colors.transparent,
                        tooltip: 'More Options',
                        onPressed: () {
                          onMorePressed();
                        },
                      );
                    },
                  ),
                ],
          ),
        ),
      ],
      bottom: bottom,
    );
  }
}
