import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/enums/app_language.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/components/buttons/radio_buttons.dart';
import 'package:chattrooo/components/containers/bottomsheet_topdecoration.dart';
import 'package:flutter/material.dart';

/// Clase LanguageButton: componente personalizado del botón de selección de idiomas.
///
/// Este widget muestra el idioma seleccionado actualmente y, al ser presionado,
/// despliega un [showModalBottomSheet] que contiene las opciones de idioma disponibles.
class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

/// Estado del componente LanguageButton
class _LanguageButtonState extends State<LanguageButton> {
  /// Almacena el idioma seleccionado en el estado local del botón.
  AppLanguage _selectedLanguage = AppLanguage.english;

  /// Función para el despliega el menú inferior con la lista de idiomas.
  ///
  /// Utiliza un [showModalBottomSheet] para presentar el componente [RadioButtons]
  /// y permite al usuario actualizar el idioma global o local de la aplicación.
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      builder: (context) {
        return Padding(
          // Añadimos un padding abajo para que no choque con el borde del móvil
          padding: EdgeInsets.fromLTRB(
            10,
            20,
            10,
            MediaQuery.of(context).padding.bottom + 20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rayita decorativa superior
                BottomsheetTopDecoration(),
                const SizedBox(height: 20),
                // Header con icono de cerrar
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Text('App Language', style: context.text1),
                    const Spacer(),
                    CloseButton(),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: context.theme.dividerColor, thickness: 0.5),

                // Lista de opciones tipo Radio para el cambio de idioma.
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RadioButtons(
                    initialLanguage: _selectedLanguage,
                    onLanguageChanged: (AppLanguage language) {
                      setState(() {
                        _selectedLanguage = language;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Estructura visual del botón.
  ///
  /// Implementa [Semantics] para mejorar la accesibilidad y [InkWell] para
  /// proporcionar retroalimentación visual al hacer clic.
  @override
  Widget build(BuildContext context) {
    final label = _selectedLanguage == AppLanguage.english
        ? 'Change Language. Default: English'
        : 'Change Language. Default: Spanish';

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: context.theme.langBtnBgColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => showBottomSheet(context),
          borderRadius: BorderRadius.circular(20),
          splashFactory: NoSplash.splashFactory,
          highlightColor: context.theme.langBtnHighlightColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 10),
                Text(
                  _selectedLanguage == AppLanguage.english
                      ? 'English'
                      : 'Spanish',
                  style: context.label2,
                ),
                const SizedBox(width: 10),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
