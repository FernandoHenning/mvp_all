import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class BlankView extends StatefulWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vista vacía"),
          backgroundColor: ColorsViews.backgrounAppBar,
          foregroundColor: ColorsViews.activeSliderColor,
        ),
      ),
    );
  }
}
