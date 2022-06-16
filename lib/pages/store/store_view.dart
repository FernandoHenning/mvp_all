import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/store/widgets/custom_app_bar.dart';


class StoreView extends StatefulWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppBar(),
      ),
    );
  }
}



