import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/common/utils/countries_data.dart';
import 'package:chattrooo/models/country_item.dart';

import 'package:chattrooo/screens/otp/otp_screen.dart';
import 'package:chattrooo/components/buttons/custom_elevated_button.dart';

import 'package:flutter/material.dart';

/// Pantalla de login para el registro del número de teléfono.
///
/// Permite seleccionar el país y validar el formato del teléfono antes de
/// proceder a la verificación por OTP.
class LoginScreen extends StatefulWidget {
  /// Almacena el país seleccionado del listado.
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// Estado que gestiona la entrada de datos y validaciones de la pantalla.
class _LoginScreenState extends State<LoginScreen> {
  CountryItem? selectedCountry;

  /// Controladores para el prefijo y el número de teléfono.
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController prefixController = TextEditingController();

  /// Libera los controladores para evitar fugas de memoria.
  @override
  void dispose() {
    prefixController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  /// Constructor de la interfaz visual.
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          // Forzamos a que el contenido ocupe al menos toda la pantalla
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            // Esto hace que el primer hijo vaya arriba y el último abajo
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 80),
                  Center(
                    child: Text(
                      'Enter your phone number',
                      style: context.h3.copyWith(
                        color: context.theme.preHomeTitleColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              "Chatt'rOOO will need to verify your phone number. \nCarrier charges may apply\n",
                          style: context.text3,
                          children: [
                            TextSpan(
                              text: "\nWhat's my number?",
                              style: context.text3.copyWith(
                                color: context.theme.preHomeTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      // Menú desplegable para la selección del país.
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: DropdownButtonFormField<CountryItem>(
                          dropdownColor: context.theme.menuOptionsBgColor,
                          elevation: 2,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: context.theme.greenColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colours.teal700,
                                width: 1.5,
                              ),
                            ),
                          ),
                          initialValue: selectedCountry,
                          hint: Text(
                            'Select your country',
                            style: context.label1.copyWith(
                              color: context.theme.hinttextColor,
                            ),
                          ),
                          items: countriesList.map((country) {
                            return DropdownMenuItem<CountryItem>(
                              value: country,
                              child: Text(
                                country.name,
                                style: context.label1.copyWith(
                                  color: context.theme.menuOptionTextColor,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCountry = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Campo para el prefijo telefónico.
                            SizedBox(
                              width: 50,
                              child: TextField(
                                style: context.label1.copyWith(
                                  color: context.theme.menuOptionTextColor,
                                ),
                                controller: prefixController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: '+00',
                                  hintStyle: context.label1.copyWith(
                                    color: context.theme.hinttextColor,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: context.theme.greenColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colours.teal700,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            // Campo para el número de teléfono.
                            Expanded(
                              child: TextField(
                                style: context.label1.copyWith(
                                  color: context.theme.menuOptionTextColor,
                                ),
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Phone number',
                                  hintStyle: context.label1.copyWith(
                                    color: context.theme.hinttextColor,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: context.theme.greenColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colours.teal700,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.15),

              // Botón Next
              SizedBox(
                height: 180,
                child: Column(
                  children: [
                    /// Botón para validar datos y navegar a la pantalla OTP.
                    CustomElevatedButton(
                      onPressed: () {
                        String countryCode = prefixController.text.trim();
                        String phoneNumber = phoneController.text.trim();
                        if (selectedCountry == null) {
                          // Validación de la selección de país
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select a country',
                                style: context.text3.copyWith(
                                  color: Colours.navy950,
                                ),
                              ),
                              backgroundColor:
                                  context.theme.warningmessagebgColor,
                            ),
                          );

                          // Validación del prefijo de teléfono
                        } else if (countryCode.isEmpty ||
                            !RegExp(r'^\+[0-9]{1,3}$').hasMatch(countryCode)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter a valid country code',
                                style: context.text3.copyWith(
                                  color: Colours.navy950,
                                ),
                              ),
                              backgroundColor:
                                  context.theme.warningmessagebgColor,
                            ),
                          );

                          // Validación del número de teléfono
                        } else if (phoneNumber.isEmpty ||
                            !RegExp(r'^[0-9]{5,}$').hasMatch(phoneNumber)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter a valid phone number',
                                style: context.text3.copyWith(
                                  color: Colours.navy950,
                                ),
                              ),
                              backgroundColor:
                                  context.theme.warningmessagebgColor,
                            ),
                          );
                        } else {
                          // Registrar el número de teléfono para la siguiente pantalla OTP
                          String fullNumber = '$countryCode$phoneNumber';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OTPScreen(fullNumber: fullNumber),
                            ),
                          );
                        }
                      },
                      text: 'NEXT',
                      textStyle: context.label2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
