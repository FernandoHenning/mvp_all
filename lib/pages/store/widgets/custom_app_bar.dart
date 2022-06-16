import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/store/widgets/named_icon.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsViews.backgrounAppBar,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: ColorsViews.activeSliderColor, onPressed: () {  },
      ),
      title: Text("Tienda"),
      actions: <Widget>[
        NamedIcon(
          iconData: Icons.shopping_bag_outlined,
          notificationCount: 0,
          onTap: () {},
        ),
        NamedIcon(
          iconData: Icons.notifications_outlined,
          notificationCount: 1,
          onTap: () {},
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.person_outline,size: 35,),
        )
      ],
    );
  }
}