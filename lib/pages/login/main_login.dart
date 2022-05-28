import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/login_form.dart';
import 'package:mvp_all_9/pages/register/register_screen.dart';
import 'package:mvp_all_9/widgets/loginWidget/button_custom.dart';
import 'package:mvp_all_9/widgets/textButtom_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 50, 24, 0),
                child: ImageTop(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: ButtonsCenter(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: ButtonBottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageTop extends StatelessWidget {
  const ImageTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: Image(
        image: AssetImage("assets/image/splash.png"),
      ),
    );
  }
}

class ButtonBottom extends StatelessWidget {
  const ButtonBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: TextButtomCustom(
            width: 300,
            text: "Entrar Como invitado",
            color: const Color(0xFFFC1460),
            function: () {},
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 30,
          child: TextButtomCustom(
            width: 300,
            text: "Entrar Como vendedor",
            color: const Color(0xFF76aa75),
            function: () {},
            fontSize: 13,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("¿Ya tienes una cuenta?"),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginForm()));
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
    );
  }
}

class ButtonsCenter extends StatelessWidget {
  const ButtonsCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtomCustomLogin(
          function: () {},
          text: "Continuar con Google",
          icon: const Icon(Icons.android).icon!,
          color: const Color(0xFF3169F5),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtomCustomLogin(
          function: () {},
          text: "Continuar con Facebook",
          icon: const Icon(Icons.facebook).icon!,
          color: const Color(0xFF324FA5),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtomCustomLogin(
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const RegisterScreen(),
              ),
            );
          },
          text: "Registrarse con e-mail",
          icon: Icons.email,
          color: const Color(0xFFFFFFFF),
          borderColor: const Color(0xFF64686f),
          textColor: const Color(0xFF64686f),
          iconColor: const Color(0xFF64686f),
          // borderColor: ,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
