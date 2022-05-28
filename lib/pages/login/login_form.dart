import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/main_menu/main_menu_view.dart';
import 'package:mvp_all_9/pages/recover_password/recover_password_view.dart';
import 'package:mvp_all_9/pages/register/register_screen.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';
import 'package:mvp_all_9/widgets/AppBar/appbar_custom.dart';
import 'package:mvp_all_9/widgets/TextField/textfield_custom.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        title: "Inicia sesión",
      ),
      body: _BodyLoginForm(),
    );
  }
}

class _BodyLoginForm extends StatelessWidget {
  const _BodyLoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool valueb = false;
    const textStyle2 = TextStyle(
      color: ColorsViews.txtHeaderColor,
      fontSize: 16,
    );
    const textStyle3 = TextStyle(
      color: ColorsViews.leyendaColor,
      fontSize: 16,
    );
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // color: Colors.amber,
            width: double.infinity,
            height: _size.height * 0.1,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Iniciar sesión en tu cuenta para continuar",
              style: textStyle3,
            ),
          ),
          _FormText(size: _size, textStyle2: textStyle2),
          _Button(size: _size)
        ],
      ),
    );
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
      height: _size.height * 0.38,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      // color: Colors.red,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  ColorsViews.backgroundButtonActiveColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainMenu()),
              );
            },
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Iniciar sesión",
                    style: TextStyle(color: ColorsViews.whiteColor),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Todavia no tienes una cuenta?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: const Text(
                  "Regístrate",
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
    required this.textStyle2,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final TextStyle textStyle2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _size.height * 0.38,
      alignment: Alignment.center,
      child: Column(
        children: [
          _ContainerTextField(
            text: "Correo electrónico",
            hintText: "Email Address",
          ),
          _ContainerTextField(
            text: "Contraseña",
            hintText: "Password",
            password: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const RecuperarContrasenaScreen(),
                    ),
                  );
                },
                child: Text(
                  "¿Has olvidado tu contraseña?",
                  style: textStyle2,
                )),
          )
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
