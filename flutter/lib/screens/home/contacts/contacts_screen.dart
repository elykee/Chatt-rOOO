import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/mock_contact_data.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:flutter/material.dart';

/// Pantalla para seleccionar un contacto de la lista.
///
/// Aunque es un [StatefulWidget], en esta versión actual actúa principalmente
/// como una representación visual de los contactos disponibles en [mockContactList].
class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

/// Estado de la pantalla que maneja la visualización de la lista de contactos.
class _ContactsScreenState extends State<ContactsScreen> {
  /// Estructura principal de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado
      appBar: SimpleAppBar(
        title: "Select Contact",
        automaticallyImplyLeading: true,
        subtitle: "${mockContactList.length} contacts",
      ),
      // Cuerpo principal
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            // Construye la lista dinámicamente
            child: ListView.builder(
              itemCount: mockContactList.length,
              itemBuilder: (context, index) {
                // Construcción de cada contacto
                final contact = mockContactList[index];
                return SizedBox(
                  height: 70,
                  child: Center(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      leading: UserAvatar(
                        name: contact.name,
                        image: contact.image,
                      ),

                      title: Text(contact.name, style: context.label1),
                      // Muestra el estado del contacto si existe y no está vacío.
                      subtitle:
                          (contact.status != null && contact.status!.isNotEmpty)
                          ? Text(
                              contact.status!,
                              style: context.text3.copyWith(
                                color: context.theme.subtitleColor,
                              ),
                            )
                          : null,
                      dense: false,
                      visualDensity: const VisualDensity(vertical: 0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
