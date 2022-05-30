import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';
import 'package:mvp_all_9/widgets/AppBar/appbar_custom.dart';
import 'package:mvp_all_9/widgets/TextField/textfield_custom.dart';
import 'package:mvp_all_9/widgets/button_custom.dart';

class RecoverPasswordView extends StatelessWidget {
  const RecoverPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: "Recuperar Contraseña",
      ),
      body: _BodyRecuperar(),
    );
  }
}

class _BodyRecuperar extends StatelessWidget {
  _BodyRecuperar({
    Key? key,
  }) : super(key: key);

  bool valueb = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    const textStyle3 = TextStyle(
      color: ColorsViews.leyendaColor,
      fontSize: 14,
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
            child: Text(
              "Ingresa tu email para restablecer tu contraseña",
              style: textStyle3.copyWith(fontSize: 16),
            ),
          ),
          Container(
            width: double.infinity,
            height: _size.height * 0.42,
            alignment: Alignment.center,
            child: Column(
              children: [
                _ContainerTextField(
                  hintText: "Correo electrónico",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    "Ingresa su correo electronico registrado y le enviaremos un correo electronico que contiene un enlace para restablecer sus contraseñas ",
                    style: textStyle3,
                    // maxLines: 2,
                    // textWidthBasis: TextWidthBasis.longestLine,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _size.height * 0.30,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            // color: Colors.red,
            alignment: Alignment.bottomCenter,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ButtomCustom(
                  disable: false,
                  background: ColorsViews.backgroundButtonActiveColor,
                  text: Text(
                    "Enviar solicitud",
                    style: TextStyle(color: ColorsViews.whiteColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ContainerTextField extends StatelessWidget {
  final String hintText;
  bool? password;
  _ContainerTextField({Key? key, required this.hintText, this.password})
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
              hintText,
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
