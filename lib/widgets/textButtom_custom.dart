import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/login_form.dart';

class TextButtomCustom extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;
  final double fontSize;
  final double? width;

  const TextButtomCustom(
      {Key? key,
      required this.text,
      required this.color,
      required this.function,
      required this.fontSize,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: () =>
            MaterialPageRoute(builder: (context) => const LoginForm()),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
