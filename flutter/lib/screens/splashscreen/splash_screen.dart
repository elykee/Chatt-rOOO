import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/screens/Onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Pantalla de bienvenida con animaciones de entrada y transición de marca.
///
/// Gestiona la secuencia de rebote (bounce) del logo y la transición fluida
/// hacia [OnboardingScreen] usando el sistema de [Hero] de Flutter.
class SplashScreen extends StatefulWidget {
  /// Crea una instancia de [SplashScreen].
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// Estado que gestiona el ciclo de vida de las animaciones de la pantalla.
///
/// Usa [SingleTickerProviderStateMixin] para sincronizar el [AnimationController]
/// con los frames del dispositivo, optimizando el consumo de recursos.
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Controlador que orquestra el tiempo de todas las animaciones.
  late final AnimationController _controller;

  /// Animación que genera el efecto de rebote en el logo y el texto.
  late final Animation<double> _bounceAnimation;

  /// Controla la opacidad del logo de fondo para que aparezca al final.
  late final Animation<double> _backLogoOpacity;

  /// Animación para que el contenido aparezca suavemente al inicio.
  late final Animation<double> _contentFadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4100),
    );

    /// Aparece todo el contenido de forma gradual al arrancar.
    _contentFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );

    /// Define la secuencia de tres rebotes decrecientes.
    _bounceAnimation = TweenSequence<double>([
      // Rebote inicial y más marcado.
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.3,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.3,
          end: 0.9,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 15,
      ),

      // Rebote intermedio.
      TweenSequenceItem(
        tween: Tween(
          begin: 0.9,
          end: 1.15,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.15,
          end: 0.95,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 15,
      ),

      // Rebote final suave para estabilizar.
      TweenSequenceItem(
        tween: Tween(
          begin: 0.95,
          end: 1.05,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.05,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 10,
      ),
    ]).animate(_controller);

    /// El logo de fondo aparece justo al completar la secuencia.
    _backLogoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        // Empezará a aparecer cuando la animación principal vaya por el 90%
        curve: const Interval(1.0, 1.0, curve: Curves.linear),
      ),
    );

    // Iniciamos las animaciones
    _controller.forward();

    /// Temporizador para navegar automáticamente tras finalizar la animación.
    Future.delayed(const Duration(milliseconds: 4600), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(
            milliseconds: 1100,
          ), // Duración del vuelo
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Curva para la transición de la pantalla
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutExpo,
            );

            return FadeTransition(opacity: curvedAnimation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    /// Limpieza del controlador para evitar fugas de memoria.
    _controller.dispose();
    super.dispose();
  }

  /// Constructor de la interfaz visual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadeTransition(
        // Oculta todo hasta que el primer frame esté listo
        opacity: _contentFadeIn,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Stack para manejar el logo principal y el de fondo.
              Stack(
                alignment: Alignment.center,
                children: [
                  // Logo de fondo: Aparece gradualmente al final
                  FadeTransition(
                    opacity: _backLogoOpacity,
                    child: Hero(
                      tag: 'back-logo',
                      child: SvgPicture.asset(
                        'assets/images/logoBack.svg',
                        width: 144,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          context.theme.backlogoColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  // Logo frontal con Hero y Bounce
                  ScaleTransition(
                    scale: _bounceAnimation,
                    child: Hero(
                      tag: 'front-logo', // conecta con el Hero en Onboarding
                      child: SvgPicture.asset(
                        context.theme.iconSvg,
                        width: 178,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Texto Chatt'rOOO con bounce
              ScaleTransition(
                scale: _bounceAnimation,
                child: RichText(
                  text: TextSpan(
                    text: "Chatt'r",
                    style: context.h1.copyWith(
                      color: context.theme.splashScreenTitleColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'O',
                        style: context.h1.copyWith(
                          color: context.theme.greenColor,
                        ),
                      ),
                      TextSpan(
                        text: 'O',
                        style: context.h1.copyWith(color: Colours.lavender500),
                      ),
                      TextSpan(
                        text: 'O',
                        style: context.h1.copyWith(color: Colours.navy600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
