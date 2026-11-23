import 'dart:io';
import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/common/theme/text_theme_x.dart';
import 'package:chattrooo/common/utils/colours.dart';
import 'package:chattrooo/components/containers/bottomsheet_topdecoration.dart';
import 'package:chattrooo/screens/home/home_screen.dart';
import 'package:chattrooo/components/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Pantalla para configurar la información básica del perfil del usuario.
///
/// Permite al usuario ingresar su nombre y seleccionar una foto de perfil
/// opcional mediante la cámara o la galería.
class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

/// Estado que gestiona la captura del nombre y la selección de imagen de perfil.
class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  /// Controlador para el campo de entrada del nombre.
  final TextEditingController nameController = TextEditingController();

  /// Almacena el archivo de imagen seleccionado por el usuario.
  File? pickedImage;

  @override
  void dispose() {
    /// Liberación de recursos para evitar fugas de memoria.
    nameController.dispose();
    super.dispose();
  }

  /// Construye la interfaz de configuración de perfil.
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
                      'Profile Info',
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
                      child: Text(
                        'Please provide your name and an optional profile photo',
                        textAlign: TextAlign.center,
                        style: context.text3,
                      ),
                    ),
                  ),

                  SizedBox(height: 70),

                  // Avatar interactivo para seleccionar la foto de perfil.
                  Semantics(
                    button: true,
                    label: pickedImage == null
                        ? 'Add profile picture'
                        : 'Change profile picture',
                    child: GestureDetector(
                      onTap: () {
                        _imagePickerTypeBottomSheet(context);
                      },
                      child: pickedImage == null
                          ? CircleAvatar(
                              radius: 80,
                              backgroundColor: context.theme.circleImageColor,
                              child: Image.asset(
                                "assets/images/photo_camera.png",
                                color: context.theme.iconplaceholderColor,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(pickedImage!),
                            ),
                    ),
                  ),

                  SizedBox(height: 40),

                  // Entrada de texto para el nombre con soporte para emojis.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            style: context.label1.copyWith(
                              color: context.theme.menuOptionTextColor,
                            ),
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Type your name here',
                              hintStyle: context.label1.copyWith(
                                color: context.theme.hinttextColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colours.green600),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.green500,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.emoji_emotions_outlined),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.15),

              // Botón NEXT que finaliza la configuración y lleva al Home.
              SizedBox(
                height: 180,
                child: Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      text: 'NEXT',
                      textStyle: TextStyle(fontWeight: FontWeight.w700),
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

  /// Despliega las opciones para elegir el origen de la imagen (Cámara o Galería).
  void _imagePickerTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      builder: (BuildContext context) {
        return Padding(
          // Añadimos un padding abajo para que no choque con el borde del móvil
          padding: EdgeInsets.fromLTRB(
            10,
            20,
            10,
            MediaQuery.of(context).padding.bottom + 20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rayita decorativa superior
                BottomsheetTopDecoration(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Text('Select Avatar Image', style: context.text1),
                    const Spacer(),
                    // Botón cerrar 'X'
                    CloseButton(),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: context.theme.dividerColor, thickness: 0.5),

                // Botones de selección de fuente de imagen.
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: context.theme.iconplaceholderColor,
                          size: 80,
                        ),
                        tooltip: 'Camera',
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        icon: Icon(
                          Icons.image,
                          color: context.theme.iconplaceholderColor,
                          size: 80,
                        ),
                        tooltip: 'Gallery',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Función asíncrona para seleccionar la imagen y actualizar el estado.
  Future<void> _pickImage(ImageSource imagesource) async {
    try {
      final photo = await ImagePicker().pickImage(
        source: imagesource,
      ); // Abre cámara/galería
      if (photo == null) return; // Usuario canceló
      final tempimage = File(photo.path);

      // Comprueba si el widget todavía está montado antes de usar context
      if (!mounted) return;
      setState(() {
        pickedImage =
            tempimage; // Actualiza el estado con la imagen seleccionada en el avatar
      });
      Navigator.of(context).pop(); // Cierra la hoja inferior
    } catch (e) {
      if (!mounted) return; //solo si hubo error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: context.theme.hinttextColor,
        ),
      );
    }
  }
}
