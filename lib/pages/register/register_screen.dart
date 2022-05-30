import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/login_form.dart';
import 'package:mvp_all_9/pages/main_menu/main_menu_view.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _value = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: ColorsViews.activeSliderColor,
          backgroundColor: ColorsViews.backgrounAppBar,
          title: Text(
            "Iniciar sesión",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Text(
                        'Inicia sesión en tu cuenta para continuar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 113, 113),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 161, 161, 161)),
                            hintText: "Nombre completo",
                            fillColor: Colors.white70,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Correo electrónico',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 161, 161, 161)),
                            hintText: "Direccion de correo",
                            fillColor: Colors.white70,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contraseña',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText:
                              !_passwordVisible, //This will obscure text dynamically
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                )),
                            filled: true,
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 161, 161, 161),
                            ),
                            fillColor: Colors.white70,
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 179, 179, 179),
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 15, right: 0, bottom: 15),
                          child: Text(
                            'Las contraseñas deben de contener caracteres, numeros y simbolos con un minimo de 6 caracteres.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 204, 203, 203),
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 4, bottom: 4, right: 12)),
                            Checkbox(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              value: _value,
                              onChanged: (v) {
                                setState(() {
                                  _value = v!;
                                });
                              },
                            ),
                            Flexible(
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(children: <InlineSpan>[
                                  const TextSpan(
                                    text: 'Al registrarme, acepto ',
                                    style: TextStyle(
                                        color:
                                            ColorsViews.textButtonDisableColor),
                                  ),
                                  TextSpan(
                                    text: ' los terminos y condiciones',
                                    style: TextStyle(
                                        color: ColorsViews.activeSliderColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  const TextSpan(
                                    text: ' y la ',
                                    style: TextStyle(
                                        color:
                                            ColorsViews.textButtonDisableColor),
                                  ),
                                  TextSpan(
                                    text: ' politica de privacidad.',
                                    style: TextStyle(
                                        color: ColorsViews.activeSliderColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorsViews.backgroundButtonActiveColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0))),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            print("Created New Account");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainMenu()));
                          }).onError((error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                                duration: const Duration(seconds: 1),
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {
                                    // Hide the snackbar before its duration ends
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              ),
                            );
                          });
                        },
                        child: const Center(
                          child: Text(
                            "Crear Cuenta",
                            style: TextStyle(color: ColorsViews.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("¿Ya tienes una cuenta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginForm()),
                            );
                          },
                          child: const Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              color: Color(0xFFFC1460),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
