# 💬 Chatt'rOOO — Flutter (MVVM)

Implementación multiplataforma desarrollada en **Flutter** bajo arquitectura **MVVM**.

---

## Qué hace la app
- **Mensajería y chat:** experiencia conversacional con diseño de burbujas de chat, avatares circulares y navegación fluida entre pantallas.
- **Identidad visual y temas:** sistema de temas personalizados con paleta de colores específica y estilos de tipografía coherentes en toda la aplicación.
- **Interacción y capacidades:** entrada de voz a texto (`Speech-to-Text`), visualización de datos con gráficos (`fl_chart`) y splash screen animado.
- **Simulación realista:** gestión de respuestas asíncronas y datos de prueba locales mediante `Future.delayed`.

---

## Aspectos técnicos destacados
- **Arquitectura y estado:** organización bajo **MVVM** con gestión reactiva de estados mediante `Provider`.
- **UI y animaciones:** *Splash Screen* personalizado con efecto *bounce*, transiciones de página, temas personalizados, avatares circulares y burbujas de chat.
- **Integraciones y paquetes:** reconocimiento de voz (`Speech-to-Text`), gráficos (`fl_chart`) e icono adaptativo de aplicación.
- **Documentación:** API técnica generada íntegramente con `dart doc`.

---

## Cómo probarlo
- **Desde el código:** abra la carpeta `flutter` en **VS Code**. Ejecute `flutter pub get` y luego `flutter run` y seleccione el navegador web.
- **Instalación rápida (APK):** descargue directamente el archivo [`chattrooo-demo.apk`](./chattrooo-demo.apk) de esta misma carpeta e instálelo en un dispositivo o emulador Android.
  -  *Nota: la función de voz a texto `Speech-to-Text` no funciona en el emulador.*
- **Documentación técnica:** puede generar la API ejecutando `dart doc` desde la terminal del proyecto y consultarla abriendo `doc/api/index.html` en su navegador.

---

## Próximos pasos
- Conectar los servicios simulados (`Future.delayed`) a un *backend* o base de datos en tiempo real y ampliar las pruebas unitarias y de *widget*.