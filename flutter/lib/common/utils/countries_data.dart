import 'package:chattrooo/models/country_item.dart';

/// Lista de países disponibles.
///
/// Este listado de objetos [CountryItem] se utiliza para poblar los selectores
/// de país, permitiendo al usuario elegir su región para el prefijo telefónico
/// durante el proceso de registro o autenticación.
final List<CountryItem> countriesList = [
  CountryItem(name: "USA"),
  CountryItem(name: "Italy"),
  CountryItem(name: "Spain"),
  CountryItem(name: "France"),
  CountryItem(name: "Germany"),
  CountryItem(name: "India"),
];
