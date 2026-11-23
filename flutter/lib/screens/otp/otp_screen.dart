import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/screens/profile/profile_info_screen.dart';
import 'package:chattrooo/components/containers/custom_container.dart';
import 'package:chattrooo/components/buttons/custom_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Pantalla para la verificación del código OTP enviado al usuario.
///
/// Presenta seis campos de entrada individuales para el código de verificación
/// y permite regresar para corregir el número de teléfono si es necesario
class OTPScreen extends StatelessWidget {
  /// El número de teléfono completo al que se envió el código.
  final String fullNumber;
  OTPScreen({super.key, required this.fullNumber});

  /// Controladores para cada uno de los seis cuadros de entrada del código.
  final TextEditingController otpBox1 = TextEditingController();
  final TextEditingController otpBox2 = TextEditingController();
  final TextEditingController otpBox3 = TextEditingController();
  final TextEditingController otpBox4 = TextEditingController();
  final TextEditingController otpBox5 = TextEditingController();
  final TextEditingController otpBox6 = TextEditingController();

  /// Estructura principal de la pantalla.
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
                      'Verifying you number',
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
                              "You've tried to register $fullNumber recently.\nWait before requesting an SMS or call with your code.\n",
                          style: context.text3,
                          children: [
                            // Texto con acción para regresar a la pantalla anterior.
                            TextSpan(
                              text: "\nWrong number?",
                              style: context.text3.copyWith(
                                color: context.theme.preHomeTitleColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //Ir a la página anterior
                                  Navigator.pop(context);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),

                  // Fila de contenedores personalizados para la entrada del código.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(controller: otpBox1),
                        CustomContainer(controller: otpBox2),
                        CustomContainer(controller: otpBox3),
                        CustomContainer(controller: otpBox4),
                        CustomContainer(controller: otpBox5),
                        CustomContainer(controller: otpBox6),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Didn't receive code?",
                    style: context.text3.copyWith(
                      color: context.theme.preHomeTitleColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.15),

              // Botón NEXT que redirige a la configuración del perfil.
              SizedBox(
                height: 180,
                child: Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileInfoScreen(),
                          ),
                        );
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
