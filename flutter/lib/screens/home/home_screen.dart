import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/popupmenu_data.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:chattrooo/components/buttons/circular_action_button.dart';
import 'package:chattrooo/models/menu_text_item.dart';
import 'package:chattrooo/screens/home/calls/calls_screen.dart';
import 'package:chattrooo/screens/home/chats/chat_screen.dart';
import 'package:chattrooo/screens/home/status/status_screen.dart';
import 'package:flutter/material.dart';

/// Pantalla principal de la aplicación que organiza la navegación por pestañas.
///
/// Utiliza un [NavigationBar] para alternar entre Chats, Estados y Llamadas,
/// manteniendo el estado de cada una mediante un [IndexedStack].
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// Estado que gestiona la navegación, el buscador y las acciones de la AppBar.
class _HomeScreenState extends State<HomeScreen> {
  /// Índice de la pestaña actualmente seleccionada.
  int _selectedIndex = 0;

  /// Controlan el estado visual de los botones de acción en la AppBar.
  bool _cameraSelected = false;
  bool _moreOptionsSelected = false;

  /// Nodo de enfoque para gestionar los cambios de estilo en la barra de búsqueda.
  FocusNode _searchFocus = FocusNode();

  /// Controlador para el campo de texto de búsqueda.
  final TextEditingController _searchController = TextEditingController();

  /// Incializar estado de la barra del buscador
  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();

    /// Escucha cambios de foco para reconstruir la UI y actualizar colores.
    _searchFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    /// Liberación de controladores y nodos de enfoque.
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  /// Construye la estructura de la pantalla principal.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar personalizada que incluye el buscador, visible solo en la pestaña de Chats.
      appBar: _selectedIndex == 0
          ? SimpleAppBar(
              title: "Chatt'rOOO",
              actions: [
                // Botón de cámara
                CircularActionButton(
                  icon: Icons.camera_alt_outlined,
                  onPressed: () {
                    setState(() {
                      _cameraSelected = true;
                      _moreOptionsSelected = false;
                    });
                  },
                  backgroundColor: _cameraSelected
                      ? context.theme.iconSelected
                      : Colors.transparent,
                  tooltip: 'Camera',
                ),

                // Menú desplegable con opciones adicionales.
                PopupMenuButton<MenuTextItem>(
                  padding: EdgeInsets.zero,
                  color: context.theme.menuOptionsBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  itemBuilder: (context) {
                    return popupmenuList.map((menu) {
                      return PopupMenuItem<MenuTextItem>(
                        value: menu,
                        child: Text(
                          menu.text,
                          style: context.label1.copyWith(
                            color: context.theme.menuOptionTextColor,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  onOpened: () {
                    setState(() {
                      _cameraSelected = false;
                      _moreOptionsSelected = true;
                    });
                  },
                  onSelected: (value) {
                    setState(() {
                      _moreOptionsSelected = false;
                    });
                  },
                  onCanceled: () {
                    setState(() {
                      _moreOptionsSelected = false;
                    });
                  },
                  icon: CircularActionButton(
                    icon: Icons.more_vert_outlined,
                    backgroundColor: _moreOptionsSelected
                        ? context.theme.iconSelected
                        : Colors.transparent,
                    tooltip: 'More Options',
                  ),
                ),
              ],

              // Sección inferior de la AppBar que contiene la barra de búsqueda.
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Semantics(
                    label: 'Textfield to input search',
                    child: TextField(
                      style: context.label1.copyWith(
                        color: context.theme.menuOptionTextColor,
                      ),
                      controller: _searchController,
                      focusNode: _searchFocus,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Ask Meta AI or Search',
                        hintStyle: context.label2.copyWith(
                          color: context.theme.hinttextColor,
                        ),
                        filled: true,
                        fillColor: _searchFocus.hasFocus
                            ? context.theme.searchFocusColor
                            : context.theme.searchBarColor,
                        prefixIcon: _searchFocus.hasFocus
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_outlined),
                                onPressed: () {
                                  _searchController.clear();
                                  _searchFocus.unfocus();
                                },
                                tooltip: 'Go back',
                              )
                            : const Icon(Icons.search_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null, // ← simpleappbar para Status y Calls
      // IndexedStack mantiene todas las pantallas montadas, pero solo muestra la seleccionada.
      // Ventaja: si cambiamos de pestaña, no se pierde el estado de la pantalla anterior.
      body: IndexedStack(
        index: _selectedIndex,
        children: [ChatScreen(), StatusScreen(), CallsScreen()],
      ),

      // Barra de navegación inferior para conmutar entre las secciones principales.
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat_rounded),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.published_with_changes_outlined),
            selectedIcon: Icon(Icons.published_with_changes_rounded),
            label: 'Status',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_outlined),
            selectedIcon: Icon(Icons.phone_rounded),
            label: "Calls",
          ),
        ],
      ),
    );
  }
}
