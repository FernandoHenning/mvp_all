import 'package:flutter/material.dart';

class ButtomCustom extends StatelessWidget {
  final Text text;
  final bool? disable;
  final Icon? icon;
  final double height;
  final double width;

  final Color? borderColor;
  final Color? background;
  final Function? onPress;

  const ButtomCustom({
    Key? key,
    required this.text,
    this.height = 40,
    this.width = double.infinity,
    this.icon,
    this.borderColor,
    this.onPress,
    this.background,
    this.disable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            background != null ? MaterialStateProperty.all(background) : null,
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
      ),
      onPressed: disable != null && disable != true
          ? () {
              onPress != null ? onPress!() : null;
            }
          : null,
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(
                width: 5,
              ),
            ],
            text,
          ],
        ),
      ),
    );
  }

  ButtonStyle _styleButton() {
    return ButtonStyle(
      backgroundColor:
          background != null ? MaterialStateProperty.all(background) : null,
      side: borderColor != null
          ? MaterialStateProperty.all(
              BorderSide.lerp(
                  BorderSide(
                    style: BorderStyle.solid,
                    color: borderColor!,
                    width: 2.0,
                  ),
                  BorderSide(
                    style: BorderStyle.solid,
                    color: borderColor!,
                    width: 2.0,
                  ),
                  2.0),
            )
          : null,
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
    );
  }

  ButtonStyle _styleButtonDisable() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(background),
      side: borderColor != null
          ? MaterialStateProperty.all(
              BorderSide.lerp(
                  BorderSide(
                    style: BorderStyle.solid,
                    color: borderColor!,
                    width: 2.0,
                  ),
                  BorderSide(
                    style: BorderStyle.solid,
                    color: borderColor!,
                    width: 2.0,
                  ),
                  2.0),
            )
          : null,
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
    );
  }
}
