import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/main_menu/widgets/products_nearby.dart';
import 'package:mvp_all_9/pages/main_menu/widgets/search_field.dart';
import 'package:mvp_all_9/pages/store/widgets/custom_app_bar.dart';
import 'package:mvp_all_9/pages/store/widgets/my_pets.dart';
import 'package:mvp_all_9/pages/store/widgets/hot_sale_widget.dart';
import 'package:mvp_all_9/pages/store/widgets/products_and_services.dart';
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
              children:   [
                UserInfoWidget(),
                Divider(thickness: 1),
                MyPetsWidget(),
                ProductsAndServicesWidget(),
                CustomSearchBar(),
                HotSalesCarousel(),
                Divider(thickness: 1),
                ProductNearby()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



