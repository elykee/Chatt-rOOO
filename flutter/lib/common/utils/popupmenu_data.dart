import 'package:chattrooo/models/menu_text_item.dart';

/// Lista del menú desplegable al clicar en el botón 'More Options'.
/// 
/// Contiene las opciones globales de navegación y configuración que se muestran 
/// al usuario en el [SimpleAppBar] mediante un componente de tipo PopupMenu.
List<MenuTextItem> popupmenuList = [
  MenuTextItem(text: 'New Group'),
  MenuTextItem(text: 'Linked Devices'),
  MenuTextItem(text: 'Settings'),
  MenuTextItem(text: 'Logout'),
];
