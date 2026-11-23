import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/components/buttons/custom_elevated_button.dart';
import 'package:chattrooo/components/buttons/language_button.dart';
import 'package:chattrooo/components/info/privacy_and_terms.dart';
import 'package:chattrooo/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Pantalla de bienvenida que presenta los términos y el acceso principal.
///
/// Muestra los logos animados mediante [Hero] y ofrece las opciones de
/// aceptar términos, continuar al login o cambiar el idioma.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

/// Estado que controla la visibilidad de los elementos tras terminar la ruta de navegación.
class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _showLogos = false;

  @override
  void initState() {
    super.initState();

    /// Espera a que termine la transición de pantalla para activar los logos.
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) setState(() => _showLogos = true);
    });
  }

  /// Construye la estructura visual con soporte para scroll en pantallas pequeñas.
  @override
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
              // Bloque superior: Logos y mensajes de bienvenida.
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _showLogos ? 1.0 : 0.0,
                      child: SizedBox(
                        height: 340,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            /// Logo de fondo posicionado con [Hero] para continuidad.
                            Positioned(
                              top: 30,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Transform.translate(
                                  offset: Offset(60, 165),
                                  child: Hero(
                                    tag:
                                        'back-logo', // Hero para conectar con el SplashScreen
                                    // Este constructor evita que el logo de destino aparezca antes de tiempo
                                    placeholderBuilder: (context, size, child) {
                                      return SizedBox(
                                        width: size.width,
                                        height: size.height,
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/logoBack.svg',
                                      width: 150,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        context.theme.backlogoColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Logo frontal con efecto [Hero] sincronizado.
                            Positioned(
                              top: 100,
                              right: 0,
                              left: 0,
                              child: Center(
                                child: Hero(
                                  tag:
                                      'front-logo', // Hero para conectar con el SplashScreen
                                  // Este constructor evita que el logo de destino aparezca antes de tiempo
                                  placeholderBuilder: (context, size, child) {
                                    return SizedBox(
                                      width: size.width,
                                      height: size.height,
                                    );
                                  },

                                  child: SvgPicture.asset(
                                    context.theme.iconSvg, // Logo frontal svg
                                    width: 203,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 70),

                  // Sección de texto de bienvenida y políticas.
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Welcome to Chatt'r",
                                style: context.h2.copyWith(
                                  color: context.theme.welcomeTitleColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'O',
                                    style: context.h2.copyWith(
                                      color: context.theme.greenColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'O',
                                    style: context.h2.copyWith(
                                      color: Colours.lavender500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'O',
                                    style: context.h2.copyWith(
                                      color: Colours.navy600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 22),
                          // Widget de privacidad y términos
                          PrivacyAndTerms(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.15),

              // Parte inferior: botones
              SizedBox(
                height: 180,
                child: Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        // Navega a la pantalla de login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      text: 'AGREE AND CONTINUE',
                      textStyle: context.label2,
                    ),
                    const SizedBox(height: 20),
                    // Botón para seleccionar idioma de la App
                    const LanguageButton(),
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
