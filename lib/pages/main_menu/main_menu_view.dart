import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/main_menu/widgets/custom_img_slider.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorsViews.backgrounAppBar,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png"),
                      radius: 45,
                    ),
                    Text(
                      "Fernando Henning Macías",
                      style: TextStyle(color: ColorsViews.whiteColor),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const ExpansionTile(
                    title: Text('Menu 1'),
                    children: <Widget>[
                      ListTile(title: Text('Sub-menu 1')),
                      ListTile(title: Text('Sub-menu 2')),
                      ListTile(title: Text('Sub-menu 3')),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text('Menu 2'),
                    children: const <Widget>[
                      ListTile(title: Text('Sub-menu 1')),
                      ListTile(title: Text('Sub-menu 2')),
                      ListTile(title: Text('Sub-menu 3')),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() => expanded);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: ColorsViews.backgrounAppBar,
          foregroundColor: ColorsViews.activeSliderColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ImageSlider(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          selectedItemColor: ColorsViews.activeSliderColor,
        ),
      ),
    );
  }
}
