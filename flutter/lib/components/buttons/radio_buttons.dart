import 'package:chattrooo/common/enums/app_language.dart';
import 'package:flutter/material.dart';

/// Clase RadioButtons: componente personalizado de los botones para elegir idioma.
///
/// Este widget gestiona la selección exclusiva entre diferentes idiomas disponibles
/// en la aplicación, utilizando un estado interno para la selección visual y
/// notificando al widget padre mediante un callback.
class RadioButtons extends StatefulWidget {
  /// El idioma seleccionado por defecto al cargar el componente.
  final AppLanguage initialLanguage;

  /// Callback que se ejecuta cuando el usuario selecciona un nuevo idioma.
  final Function(AppLanguage) onLanguageChanged;

  /// Crea una instancia de [RadioButtons].
  ///
  /// Requiere un [initialLanguage] para el estado inicial y [onLanguageChanged]
  /// para comunicar la selección hacia afuera.
  const RadioButtons({
    super.key,
    required this.initialLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

/// Estado del componente RadioButtons.
class _RadioButtonsState extends State<RadioButtons> {
  /// Variable interna que rastrea el idioma seleccionado en el grupo.
  late AppLanguage _language;

  /// Inicialización del estado con el valor pasado por el widget padre
  @override
  void initState() {
    super.initState();
    _language = widget.initialLanguage;
  }

  /// Estructura principal del componente
  @override
  Widget build(BuildContext context) {
    return RadioGroup<AppLanguage>(
      groupValue: _language,
      onChanged: (AppLanguage? value) {
        setState(() {
          _language = value!;
        });
        // Notificar al padre [LanguageButton] que el idioma cambió
        widget.onLanguageChanged(value!);
      },
      child: const Column(
        children: <Widget>[
          // Opción para el idioma Inglés
          ListTile(
            title: Text('English'),
            subtitle: Text("Phone's language"),
            leading: Radio<AppLanguage>(value: AppLanguage.english),
          ),
          // Opción para el idioma Español
          ListTile(
            title: Text('Spanish'),
            subtitle: Text('Español'),
            leading: Radio<AppLanguage>(value: AppLanguage.spanish),
          ),
        ],
      ),
    );
  }
}
