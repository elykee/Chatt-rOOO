import 'package:chattrooo/common/utils/colours.dart';
import 'package:flutter/material.dart';

/// Extensión que permite acceder fácilmente a [CustomThemeExtension] desde cualquier [BuildContext].
///
/// Facilita el uso de colores personalizados en los widgets sin sintaxis repetitiva.
/// Ejemplo: 'final color = context.theme.circleImageColor;'
extension ExtendedTheme on BuildContext {
  /// Getter para obtener la instancia de [CustomThemeExtension] registrada en el tema actual.
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

/// Clase [CustomThemeExtension] Extensión del tema global para colores y recursos personalizados.
///
/// Flutter permite extender su [ThemeData] básico mediante [ThemeExtension]. Esto evita
/// depender de constantes globales y permite que los colores cambien automáticamente
/// cuando el usuario alterna entre Modo Claro y Modo Oscuro.
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  /// Definición de campos para cada recurso de color/imagen personalizado de la app
  final Color splashScreenTitleColor;
  final Color welcomeTitleColor;
  final Color preHomeTitleColor;
  final Color subtitleColor;
  final Color text1Color;
  final Color spantextColor;
  final Color hinttextColor;
  final Color chatBubbleReceivedColor;
  final Color chatBubbleSentColor;
  final Color chatnavbarbgColor;
  final Color chatinputfieldColor;
  final Color chatBubbleTextReceivedColor;
  final Color chatBubbleTextSentColor;
  final Color timeStampMeColor;
  final Color timeStampReceivedColor;
  final Color iconSelected;
  final Color iconSendbgColor;
  final Color iconRecordbgColor;
  final Color iconSendtogglebgColor;
  final Color iconplaceholderColor;
  final Color circleImageColor;
  final Color avatarbgColor;
  final Color bottomSheetTopDecoration;
  final Color dividerColor;
  final Color warningmessagebgColor;
  final Color greenColor;
  final Color otpcodeboxColor;
  final Color otphinttextColor;
  final Color otpinputtextColor;
  final Color searchBarColor;
  final Color searchFocusColor;
  final Color timeColor;
  final Color langBtnBgColor;
  final Color langBtnHighlightColor;
  final Color graphbarsColor;
  final Color graphBarAxisColor;
  final Color menuOptionTextColor;
  final Color menuOptionsBgColor;
  final Color backlogoColor;
  final String iconSvg;

  /// Constructor que inicializa todos los parámetros del tema.
  const CustomThemeExtension({
    required this.splashScreenTitleColor,
    required this.welcomeTitleColor,
    required this.preHomeTitleColor,
    required this.subtitleColor,
    required this.text1Color,
    required this.spantextColor,
    required this.hinttextColor,
    required this.chatBubbleReceivedColor,
    required this.chatBubbleSentColor,
    required this.chatnavbarbgColor,
    required this.chatinputfieldColor,
    required this.chatBubbleTextReceivedColor,
    required this.chatBubbleTextSentColor,
    required this.timeStampMeColor,
    required this.timeStampReceivedColor,
    required this.iconSelected,
    required this.iconSendbgColor,
    required this.iconRecordbgColor,
    required this.iconSendtogglebgColor,
    required this.iconplaceholderColor,
    required this.circleImageColor,
    required this.avatarbgColor,
    required this.bottomSheetTopDecoration,
    required this.dividerColor,
    required this.warningmessagebgColor,
    required this.greenColor,
    required this.otpcodeboxColor,
    required this.otphinttextColor,
    required this.otpinputtextColor,
    required this.searchBarColor,
    required this.searchFocusColor,
    required this.timeColor,
    required this.langBtnBgColor,
    required this.langBtnHighlightColor,
    required this.graphbarsColor,
    required this.graphBarAxisColor,
    required this.menuOptionTextColor,
    required this.menuOptionsBgColor,
    required this.backlogoColor,
    required this.iconSvg,
  });

  /// Crea una copia de la instancia actual permitiendo sobrescribir propiedades específicas.
  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? splashScreenTitleColor,
    Color? welcomeTitleColor,
    Color? preHomeTitleColor,
    Color? subtitleColor,
    Color? text1Color,
    Color? spantextColor,
    Color? hinttextColor,
    Color? chatBubbleReceivedColor,
    Color? chatBubbleSentColor,
    Color? chatnavbarbgColor,
    Color? chatinputfieldColor,
    Color? chatBubbleTextReceivedColor,
    Color? chatBubbleTextSentColor,
    Color? timeStampMeColor,
    Color? timeStampReceivedColor,
    Color? iconSelected,
    Color? iconSendbgColor,
    Color? iconRecordbgColor,
    Color? iconSendtogglebgColor,
    Color? iconplaceholderColor,
    Color? circleImageColor,
    Color? avatarbgColor,
    Color? bottomSheetTopDecoration,
    Color? dividerColor,
    Color? warningmessagebgColor,
    Color? greenColor,
    Color? otpcodeboxColor,
    Color? otphinttextColor,
    Color? otpinputtextColor,
    Color? searchBarColor,
    Color? searchFocusColor,
    Color? timeColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? graphbarsColor,
    Color? graphBarAxisColor,
    Color? menuOptionTextColor,
    Color? menuOptionsBgColor,
    Color? backlogoColor,
    String? iconSvg,
  }) {
    return CustomThemeExtension(
      splashScreenTitleColor:
          splashScreenTitleColor ?? this.splashScreenTitleColor,
      welcomeTitleColor: welcomeTitleColor ?? this.welcomeTitleColor,
      preHomeTitleColor: preHomeTitleColor ?? this.preHomeTitleColor,

      subtitleColor: subtitleColor ?? this.subtitleColor,
      text1Color: text1Color ?? this.text1Color,
      spantextColor: spantextColor ?? this.spantextColor,
      hinttextColor: hinttextColor ?? this.hinttextColor,
      chatBubbleReceivedColor:
          chatBubbleReceivedColor ?? this.chatBubbleReceivedColor,
      chatBubbleSentColor: chatBubbleSentColor ?? this.chatBubbleSentColor,
      chatnavbarbgColor: chatnavbarbgColor ?? this.chatnavbarbgColor,
      chatinputfieldColor: chatinputfieldColor ?? this.chatinputfieldColor,
      chatBubbleTextReceivedColor:
          chatBubbleTextReceivedColor ?? this.chatBubbleTextReceivedColor,
      chatBubbleTextSentColor:
          chatBubbleTextSentColor ?? this.chatBubbleTextSentColor,
      timeStampMeColor: timeStampMeColor ?? this.timeStampMeColor,
      timeStampReceivedColor:
          timeStampReceivedColor ?? this.timeStampReceivedColor,
      iconSelected: iconSelected ?? this.iconSelected,
      iconSendbgColor: iconSendbgColor ?? this.iconSendbgColor,
      iconRecordbgColor: iconRecordbgColor ?? this.iconRecordbgColor,
      iconSendtogglebgColor:
          iconSendtogglebgColor ?? this.iconSendtogglebgColor,
      iconplaceholderColor: iconplaceholderColor ?? this.iconplaceholderColor,
      circleImageColor: circleImageColor ?? this.circleImageColor,
      avatarbgColor: avatarbgColor ?? this.avatarbgColor,
      bottomSheetTopDecoration:
          bottomSheetTopDecoration ?? this.bottomSheetTopDecoration,
      dividerColor: dividerColor ?? this.dividerColor,
      warningmessagebgColor:
          warningmessagebgColor ?? this.warningmessagebgColor,
      greenColor: greenColor ?? this.greenColor,
      otpcodeboxColor: otpcodeboxColor ?? this.otpcodeboxColor,
      otphinttextColor: otphinttextColor ?? this.otphinttextColor,
      otpinputtextColor: otpinputtextColor ?? this.otpinputtextColor,
      searchBarColor: searchBarColor ?? this.searchBarColor,
      searchFocusColor: searchFocusColor ?? this.searchFocusColor,
      timeColor: timeColor ?? this.timeColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor:
          langBtnHighlightColor ?? this.langBtnHighlightColor,
      graphbarsColor: graphbarsColor ?? this.graphbarsColor,
      graphBarAxisColor: graphBarAxisColor ?? this.graphBarAxisColor,
      menuOptionTextColor: menuOptionTextColor ?? this.menuOptionTextColor,
      menuOptionsBgColor: menuOptionsBgColor ?? this.menuOptionsBgColor,
      backlogoColor: backlogoColor ?? this.backlogoColor,
      iconSvg: iconSvg ?? this.iconSvg,
    );
  }

  /// Realiza la interpolación lineal entre dos estados del tema.
  ///
  /// Este método es invocado automáticamente por Flutter para suavizar la
  /// transición de los recursos visuales. Se activa al cambiar entre [lightMode]
  /// y [darkMode], o cuando navegamos entre pantallas que aplican diferentes
  /// configuraciones de estilo (como del Splash al Onboarding), evitando saltos
  /// visuales bruscos y permitiendo que los colores "fluyan" de un estado a otro.
  @override
  ThemeExtension<CustomThemeExtension> lerp(
    covariant ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      splashScreenTitleColor: Color.lerp(
        splashScreenTitleColor,
        other.splashScreenTitleColor,
        t,
      )!,
      welcomeTitleColor: Color.lerp(
        welcomeTitleColor,
        other.welcomeTitleColor,
        t,
      )!,
      preHomeTitleColor: Color.lerp(
        preHomeTitleColor,
        other.preHomeTitleColor,
        t,
      )!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      text1Color: Color.lerp(text1Color, other.text1Color, t)!,
      spantextColor: Color.lerp(spantextColor, other.spantextColor, t)!,
      hinttextColor: Color.lerp(hinttextColor, other.hinttextColor, t)!,
      chatBubbleReceivedColor: Color.lerp(
        chatBubbleReceivedColor,
        other.chatBubbleReceivedColor,
        t,
      )!,
      chatBubbleSentColor: Color.lerp(
        chatBubbleSentColor,
        other.chatBubbleSentColor,
        t,
      )!,
      chatnavbarbgColor: Color.lerp(
        chatnavbarbgColor,
        other.chatnavbarbgColor,
        t,
      )!,
      chatinputfieldColor: Color.lerp(
        chatinputfieldColor,
        other.chatinputfieldColor,
        t,
      )!,
      chatBubbleTextReceivedColor: Color.lerp(
        chatBubbleTextReceivedColor,
        other.chatBubbleTextReceivedColor,
        t,
      )!,
      chatBubbleTextSentColor: Color.lerp(
        chatBubbleSentColor,
        other.chatBubbleTextSentColor,
        t,
      )!,
      timeStampMeColor: Color.lerp(
        timeStampMeColor,
        other.timeStampMeColor,
        t,
      )!,
      timeStampReceivedColor: Color.lerp(
        timeStampReceivedColor,
        other.timeStampReceivedColor,
        t,
      )!,
      iconSelected: Color.lerp(iconSelected, other.iconSelected, t)!,
      iconSendbgColor: Color.lerp(iconSendbgColor, other.iconSendbgColor, t)!,
      iconRecordbgColor: Color.lerp(
        iconRecordbgColor,
        other.iconRecordbgColor,
        t,
      )!,
      iconSendtogglebgColor: Color.lerp(
        iconSendtogglebgColor,
        other.iconSendtogglebgColor,
        t,
      )!,
      iconplaceholderColor: Color.lerp(
        iconplaceholderColor,
        other.iconplaceholderColor,
        t,
      )!,
      circleImageColor: Color.lerp(
        circleImageColor,
        other.circleImageColor,
        t,
      )!,
      avatarbgColor: Color.lerp(avatarbgColor, other.avatarbgColor, t)!,
      bottomSheetTopDecoration: Color.lerp(
        bottomSheetTopDecoration,
        other.bottomSheetTopDecoration,
        t,
      )!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      warningmessagebgColor: Color.lerp(
        warningmessagebgColor,
        other.warningmessagebgColor,
        t,
      )!,
      greenColor: Color.lerp(greenColor, other.greenColor, t)!,
      otpcodeboxColor: Color.lerp(otpcodeboxColor, other.otpcodeboxColor, t)!,
      otphinttextColor: Color.lerp(
        otphinttextColor,
        other.otphinttextColor,
        t,
      )!,
      otpinputtextColor: Color.lerp(
        otpinputtextColor,
        other.otpinputtextColor,
        t,
      )!,
      searchBarColor: Color.lerp(searchBarColor, other.searchBarColor, t)!,
      searchFocusColor: Color.lerp(
        searchFocusColor,
        other.searchFocusColor,
        t,
      )!,
      timeColor: Color.lerp(timeColor, other.timeColor, t)!,
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t)!,
      langBtnHighlightColor:
          // Usamos '??' para asegurarnos de que nunca sea null, aunque lerp podría devolver null
          Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t)!,
      graphbarsColor: Color.lerp(graphbarsColor, other.graphbarsColor, t)!,
      graphBarAxisColor: Color.lerp(
        graphBarAxisColor,
        other.graphBarAxisColor,
        t,
      )!,
      menuOptionTextColor: Color.lerp(
        menuOptionTextColor,
        other.menuOptionTextColor,
        t,
      )!,
      menuOptionsBgColor: Color.lerp(
        menuOptionsBgColor,
        other.menuOptionsBgColor,
        t,
      )!,
      backlogoColor: Color.lerp(backlogoColor, other.backlogoColor, t)!,
      iconSvg: t < 0.5 ? iconSvg : other.iconSvg,
    );
  }

  /// Instancia de configuración para el Tema Claro.
  static const lightMode = CustomThemeExtension(
    splashScreenTitleColor: Colours.navy950,
    welcomeTitleColor: Colours.navy950,
    preHomeTitleColor: Colours.teal700,
    subtitleColor: Colours.navy600,
    text1Color: Colours.navy950,
    spantextColor: Colours.teal700,
    hinttextColor: Colours.lavender500,
    chatBubbleReceivedColor: Colours.lavender200,
    chatBubbleSentColor: Colours.teal700,
    chatnavbarbgColor: Colours.lavender100,
    chatinputfieldColor: Colours.navy700,
    chatBubbleTextReceivedColor: Colours.navy950,
    chatBubbleTextSentColor: Colours.lavender50,
    timeStampMeColor: Colours.lavender200,
    timeStampReceivedColor: Colours.navy600,
    iconSelected: Colours.lavender100,
    iconSendbgColor: Colours.green600,
    iconRecordbgColor: Colours.red500,
    iconSendtogglebgColor: Colours.teal700,
    iconplaceholderColor: Colours.navy600,
    circleImageColor: Colours.lavender400,
    avatarbgColor: Colours.teal700,
    bottomSheetTopDecoration: Colours.navy600,
    dividerColor: Colours.lavender400,
    warningmessagebgColor: Colours.lavender300,
    greenColor: Colours.green600,
    otpcodeboxColor: Colours.lavender400,
    otphinttextColor: Colours.navy600,
    otpinputtextColor: Colours.navy700,
    searchBarColor: Colours.lavender300,
    searchFocusColor: Colours.lavender500,
    timeColor: Colours.teal700,
    langBtnBgColor: Colours.lavender400,
    langBtnHighlightColor: Colours.navy600,
    graphbarsColor: Colours.teal700,
    graphBarAxisColor: Colours.navy950,
    menuOptionTextColor: Colours.navy700,
    menuOptionsBgColor: Colours.lavender200,
    backlogoColor: Colours.navy700,
    iconSvg: 'assets/images/logoFrontLight.svg',
  );

  /// Instancia de configuración para el Tema Oscuro.
  static const darkMode = CustomThemeExtension(
    splashScreenTitleColor: Colours.lavender50,
    welcomeTitleColor: Colours.lavender50,
    preHomeTitleColor: Colours.green500,
    subtitleColor: Colours.lavender500,
    text1Color: Colours.lavender50,
    spantextColor: Colours.teal700,
    hinttextColor: Colours.lavender500,
    chatBubbleReceivedColor: Colours.navy700,
    chatBubbleSentColor: Colours.teal800,
    chatnavbarbgColor: Colours.navy800,
    chatinputfieldColor: Colours.lavender400,
    chatBubbleTextReceivedColor: Colours.lavender50,
    chatBubbleTextSentColor: Colours.lavender50,
    timeStampMeColor: Colours.lavender400,
    timeStampReceivedColor: Colours.lavender500,
    iconSelected: Colours.navy700,
    iconSendbgColor: Colours.green500,
    iconRecordbgColor: Colours.red600,
    iconSendtogglebgColor: Colours.teal800,
    iconplaceholderColor: Colours.lavender400,
    circleImageColor: Colours.navy600,
    avatarbgColor: Colours.navy600,
    bottomSheetTopDecoration: Colours.lavender500,
    dividerColor: Colours.navy700,
    warningmessagebgColor: Colours.lavender300,
    greenColor: Colours.green500,
    otpcodeboxColor: Colours.lavender300,
    otphinttextColor: Colours.navy700,
    otpinputtextColor: Colours.navy800,
    searchBarColor: Colours.navy600,
    searchFocusColor: Colours.navy700,
    timeColor: Colours.green600,
    langBtnBgColor: Colours.navy600,
    langBtnHighlightColor: Colours.lavender100,
    graphbarsColor: Colours.green500,
    graphBarAxisColor: Colours.lavender50,
    menuOptionTextColor: Colours.lavender300,
    menuOptionsBgColor: Colours.navy800,
    backlogoColor: Colours.lavender500,
    iconSvg: 'assets/images/logoFrontDark.svg',
  );
}
