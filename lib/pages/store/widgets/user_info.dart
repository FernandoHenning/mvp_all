import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  String dropdownValue = 'Calle 10 9';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Hola',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Roberto',
                    style: TextStyle(
                        color: ColorsViews.backgroundButtonActiveColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ',',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/image/splash.png",
              height: 60,
              width: 60,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 25,
                  color: ColorsViews.backgroundButtonActiveColor,
                ),
                SizedBox(width: 10,),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "Entregar ahora",
                        style: TextStyle(color: Colors.grey),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                        elevation: 8,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Calle 10 9']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color:Colors.grey[200], //background color of dropdown button
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<String>(
                  underline: Container(),
                  value: "Entregar a domicilio",

                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                  elevation: 8,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Entregar a domicilio']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
