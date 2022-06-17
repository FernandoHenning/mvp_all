import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 300,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0),
                    ),
                ),
                fillColor: Colors.black12,
                hintText: 'Buscar productos o servicios',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor: MaterialStateProperty.all(ColorsViews.activeSliderColor), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) return ColorsViews.activeSliderColor; // <-- Splash color
              }),
            ),
            child: const Icon(Icons.filter_list),
          )
        ],
      ),
    );
  }
}
