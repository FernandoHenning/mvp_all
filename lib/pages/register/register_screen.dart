import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/login_form.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';
import 'package:mvp_all_9/widgets/AppBar/appbar_custom.dart';
import 'package:mvp_all_9/widgets/TextField/textfield_custom.dart';
import 'package:mvp_all_9/widgets/button_custom.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        title: "Regístrate",
      ),
      body: _BodyRegister(),
    );
  }
}

class _BodyRegister extends StatefulWidget {
  const _BodyRegister({
    Key? key,
  }) : super(key: key);

  @override
  State<_BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<_BodyRegister> {
  bool valueb = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    const textStyle = TextStyle(
      color: ColorsViews.blackColor,
      fontSize: 16,
    );
    const textStyle2 = TextStyle(
      color: ColorsViews.txtHeaderColor,
      fontSize: 16,
    );
    const textStyle3 = TextStyle(
      color: ColorsViews.leyendaColor,
      fontSize: 14,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.amber,
            width: double.infinity,
            height: _size.height * 0.1,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Crea una cuenta para empezar a usar la app",
              style: textStyle3.copyWith(fontSize: 16),
            ),
          ),
          _FormText(
            size: _size,
            style: textStyle3,
          ),
          Container(
            height: _size.height * 0.1,
            // color: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Checkbox(
                  value: valueb,
                  splashRadius: 0.5,
                  shape: const CircleBorder(),
                  checkColor: ColorsViews.whiteColor,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (value) {
                    valueb = value!;
                    setState(() {});
                  },
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Al registrarme,acepto los ",
                          style: textStyle,
                        ),
                        TextSpan(
                          text: "términos y \ncondiciones",
                          style: textStyle2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print("terminos"),
                        ),
                        const TextSpan(
                          text: " y la ",
                          style: textStyle,
                        ),
                        TextSpan(
                          text: "política de privacidad",
                          style: textStyle2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print("politica"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          _Button(size: _size)
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color(0xFF898989);
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.height * 0.25,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      // color: Colors.red,
      alignment: Alignment.bottomCenter,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ButtomCustom(
            disable: false,
            background: ColorsViews.backgroundButtonActiveColor,
            text: Text(
              "Crear Cuenta",
              style: TextStyle(color: ColorsViews.whiteColor),
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
                          builder: (context) => const LoginForm()));
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
          )
        ],
      ),
    );
  }
}

class _FormText extends StatelessWidget {
  const _FormText({
    Key? key,
    required Size size,
    required this.style,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _size.height * 0.42,
      alignment: Alignment.center,
      child: Column(
        children: [
          _ContainerTextField(
            text: "Nombre",
            hintText: "Nombre Completo",
          ),
          _ContainerTextField(
            text: "Correo electrónico",
            hintText: "Dirección de correo",
          ),
          Container(
            color: ColorsViews.whiteColor,
            child: Column(
              children: [
                // aqui va el texfield
                _ContainerTextField(
                  text: "Contraseña",
                  hintText: "Contraseña",
                  password: true,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "La contraseña debe contener caracter, numeros y simbolos con un minimo de 6 caracteres",
                    style: style,
                    // maxLines: 2,
                    // textWidthBasis: TextWidthBasis.longestLine,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainerTextField extends StatelessWidget {
  final String text;
  final String hintText;
  bool? password;
  _ContainerTextField(
      {Key? key, required this.hintText, this.password, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          SizedBox(
              // height: 10,
              child: TextFieldCustom(
            hintText: hintText,
            change: () {},
            password: password,
          )),
        ],
      ),
    );
  }
}
