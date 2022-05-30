import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/login_form.dart';
import 'package:mvp_all_9/pages/register/register_screen.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          LoginUI(),
          Column(children: const <Widget>[
            LoginOption(),
          ]),
        ],
      ),
    );
  }
}

class LoginUI extends StatelessWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: SizedBox(
        height: 200,
        width: 350,
        child: Image.asset('assets/image/splash.png'),
      ),
    );
  }
}

class LoginOption extends StatelessWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF3169f5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .75, 50),
                      maximumSize:
                          Size(MediaQuery.of(context).size.width * .75, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.android),
                        const Text(
                          'Continuar con Google',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF324fa5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .75, 50),
                        maximumSize:
                            Size(MediaQuery.of(context).size.width * .75, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Icon(Icons.facebook),
                          Text(
                            'Continuar con Facebook',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFF64686f), width: 3),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .75, 50),
                        maximumSize:
                            Size(MediaQuery.of(context).size.width * .75, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterForm()));
                        ;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Icon(
                            Icons.email,
                            color: Color(0xFF64686f),
                          ),
                          Text(
                            'Registrarse con e-mail',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64686f),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: ColorsViews.activeSliderColor),
                onPressed: () {},
                child: const Text(
                  'Entrar como invitado',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(primary: Colors.green[400]),
                onPressed: () {},
                child: const Text(
                  'Entrar como vendedor',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100.0, top: 100),
          child: Row(
            children: <Widget>[
              const Text(
                '¿Ya tienes una cuenta?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginForm()));
                },
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: ColorsViews.activeSliderColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
