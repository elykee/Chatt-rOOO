import 'package:chattrooo/models/call_item.dart';
import 'package:flutter/material.dart';

/// Lista de historial de llamadas simuladas.
///
/// Este listado de tipo [CallItem] proporciona los datos para la pantalla "Calls".
/// Incluye información sobre el contacto, la hora y el tipo de llamada
/// (entrante, saliente o perdida) a través de [IconData], lo que permite
/// testear la función [getIconColor] definida en la vista.
final List<CallItem> mockCallList = [
  // Llamada recibida con éxito.
  CallItem(
    name: "Dan",
    image: "assets/images/dan.png",
    callTime: "15 min ago",
    iconData: Icons.call_received_outlined,
  ),
  CallItem(
    name: "Julie",
    image: "assets/images/julie.png",
    callTime: "55 min ago",
    iconData: Icons.call_received_outlined,
  ),
  // Llamada realizada con éxito por el usuario.
  CallItem(
    name: "Joe",
    image: "assets/images/joe.png",
    callTime: "Today, 09:00",
    iconData: Icons.call_made_outlined,
  ),
  CallItem(
    name: "Darwin",
    image: "assets/images/darwin.png",
    callTime: "Today, 16:00",
    iconData: Icons.call_made_outlined,
  ),
  // Caso de prueba: Llamada perdida con imagen nula (activará el fallback de iniciales).
  CallItem(
    name: "Dina",
    image: null,
    callTime: "January 15, 20:00",
    iconData: Icons.call_missed_outlined,
  ),
  CallItem(
    name: "Liam",
    image: "assets/images/liam.png",
    callTime: "Yesterday, 22:00",
    iconData: Icons.call_missed_outlined,
  ),
  CallItem(
    name: "Mira",
    image: "assets/images/mira.png",
    callTime: "Yesterday, 10:30",
    iconData: Icons.call_made_outlined,
  ),
  CallItem(
    name: "Phoenix",
    image: "assets/images/phoenix.png",
    callTime: "January 15, 20:00",
    iconData: Icons.call_received_outlined,
  ),
  // Caso de prueba: Llamada perdida con imagen vacía.
  CallItem(
    name: "Sara",
    image: "",
    callTime: "January 10, 14:00",
    iconData: Icons.call_missed_outlined,
  ),
  CallItem(
    name: "Journey",
    image: "assets/images/journey.png",
    callTime: "January 8, 1:00",
    iconData: Icons.call_made_outlined,
  ),
  CallItem(
    name: "Sabrina",
    image: "assets/images/sabrina.png",
    callTime: "12/12/25, 12:30",
    iconData: Icons.call_received_outlined,
  ),
  // Llamada realizada sin éxito por el usuario.
  CallItem(
    name: "Julie",
    image: "assets/images/julie.png",
    callTime: "01/12/25, 18:00",
    iconData: Icons.call_missed_outgoing_outlined,
  ),
];
