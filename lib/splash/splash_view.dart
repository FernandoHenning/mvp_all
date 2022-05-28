import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp_all_9/splash/splash_canva.dart';

// Importaciones clase Vistas
import '../pages/on_boarding/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    _image("assets/image/splash.png");
    _toOnbording();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CustomPaint(
            painter: SplashCanvas(imageCanvas: image),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
      context,
      _createRoute(const OnBoarding()),
    );
  }

  Route _createRoute(Widget widget) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600));
  }

  _image(String path) async {
    final data = await rootBundle.load(path);
    final bits = data.buffer.asUint8List();
    final image = await decodeImageFromList(bits);
    setState(() {
      this.image = image;
    });
  }
}
