import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/common/utils/mock_call_data.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:chattrooo/components/buttons/circular_action_button.dart';
import 'package:flutter/material.dart';

/// Pantalla que muestra el historial de llamadas recientes.
///
/// Organiza las llamadas en una lista dinámica, indicando el tipo de llamada
/// (recibida, perdida, realizada) mediante iconos de colores y permitiendo
/// devolver la llamada rápidamente.
class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

/// Estado de la pantalla de llamadas.
class _CallsScreenState extends State<CallsScreen> {
  /// Construye la interfaz con la lista de historial de llamadas.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar personalizado
      appBar: const SimpleAppBar(title: 'Calls'),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            // Construye la lista dinámicamente
            child: ListView.builder(
              // Se suma 1 al conteo para incluir el título estático "Recent".
              itemCount: mockCallList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Primer item: el título de la sección
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 20,
                      bottom: 12,
                    ),
                    child: Text('Recent', style: context.label1),
                  );
                }

                // Construcción de cada item de llamadas (ajustando el índice por el título)
                final call =
                    mockCallList[index - 1]; // -1 porque index 0 es el título
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: UserAvatar(name: call.name, image: call.image),
                  title: Text(call.name, style: context.label1),
                  subtitle: Row(
                    children: [
                      // Icono que indica el estado de la llamada con su color dinámico.
                      Icon(call.iconData, color: getIconColor(call.iconData)),
                      SizedBox(width: 10),
                      Text(
                        call.callTime,
                        style: context.text3.copyWith(
                          color: context.theme.subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  // Botón para iniciar llamada
                  trailing: CircularActionButton(
                    onPressed: () {},
                    icon: Icons.phone_outlined,
                    tooltip: 'Call',
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

/// Función auxiliar getIconColor: permite establecer el color del icon según el tipo de llamada.
///
/// Utiliza los iconos de material para diferenciar entre llamadas perdidas, recibidas o realizadas,
Color getIconColor(IconData icon) {
  if (icon == Icons.call_missed_outlined) return Colours.red500;
  if (icon == Icons.call_received_outlined) return Colours.green500;
  if (icon == Icons.call_made_outlined) return Colours.teal700;
  if (icon == Icons.call_missed_outgoing_outlined) return Colours.red600;
  return Colours.green500;
}
