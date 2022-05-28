import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: ColorsViews.whiteColor),
      ),
      backgroundColor: ColorsViews.backgrounAppBar,
      foregroundColor: ColorsViews.activeSliderColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
