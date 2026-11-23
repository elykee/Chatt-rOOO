import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/common/utils/mock_status_data.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/avatar/user_avatar.dart';
import 'package:flutter/material.dart';

/// Pantalla que muestra los estados de los contactos y el estado propio.
///
/// Permite visualizar actualizaciones recientes en formato de lista y
/// ofrece acciones rápidas para crear nuevos estados mediante texto o cámara.
class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

/// Estado de la pantalla de estados.
class _StatusScreenState extends State<StatusScreen> {
  /// Construye la interfaz con la lista de actualizaciones y botones de acción.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Status'),
      body: Column(
        children: [
          SizedBox(height: 10),

          // Opción para añadir un estado propio.
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colours.green500,
                    child: Center(
                      child: Icon(
                        Icons.add_rounded,
                        color: Colours.navy950,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text("Add status", style: context.label1),
            subtitle: Text(
              'Disappears after 24 hours',
              style: context.text3.copyWith(color: context.theme.subtitleColor),
            ),
          ),
          SizedBox(height: 20),

          // Cabecera de la sección de actualizaciones recientes.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent updates', style: context.label1),
                Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Lista dinámica de los estados de los contactos.
          Expanded(
            child: ListView.builder(
              itemCount: mockStatusList.length,
              itemBuilder: (context, index) {
                final status = mockStatusList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: UserAvatar(name: status.name, image: status.image),
                  title: Text(status.name, style: context.label1),
                  subtitle: Text(
                    status.statusTime,
                    style: context.text3.copyWith(
                      color: context.theme.subtitleColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Botones flotantes para crear estados (Texto y Cámara).
      floatingActionButton: Column(
        mainAxisSize:
            MainAxisSize.min, // importante para que no ocupe toda la altura
        children: [
          FloatingActionButton(
            heroTag: null, // Evita conflictos de animación Hero
            onPressed: () {},
            tooltip: 'Edit',
            child: Icon(Icons.mode_edit_outline),
          ),
          SizedBox(height: 10), // espaciado entre botones
          FloatingActionButton(
            heroTag: null, // Evita conflictos de animación Hero
            onPressed: () {},
            tooltip: 'Camera',
            child: Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
    );
  }
}
