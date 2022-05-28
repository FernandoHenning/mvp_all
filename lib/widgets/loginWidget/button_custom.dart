import 'package:flutter/material.dart';

class ButtomCustomLogin extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function function;
  final Color color;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;

  const ButtomCustomLogin({
    Key? key,
    required this.icon,
    required this.text,
    required this.function,
    required this.color,
    this.textColor,
    this.borderColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 3)
                : BorderSide.none,
          ),
          alignment: Alignment.center,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(icon, color: iconColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ],
        ),
        onPressed: () => function(),
      ),
    );
  }
}
