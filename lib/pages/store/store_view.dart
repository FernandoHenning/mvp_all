import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/store/widgets/custom_app_bar.dart';
import 'package:mvp_all_9/pages/store/widgets/user_info.dart';


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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: Column(
              children: const [
                UserInfoWidget(),
                Divider(thickness: 1),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



