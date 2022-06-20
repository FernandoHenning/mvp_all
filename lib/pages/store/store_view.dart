import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/store/widgets/products_nearby.dart';
import 'package:mvp_all_9/pages/store/widgets/search_field.dart';
import 'package:mvp_all_9/pages/store/widgets/custom_app_bar.dart';
import 'package:mvp_all_9/pages/store/widgets/my_pets.dart';
import 'package:mvp_all_9/pages/store/widgets/hot_sale_widget.dart';
import 'package:mvp_all_9/pages/store/widgets/products_and_services.dart';
import 'package:mvp_all_9/pages/store/widgets/services_nearby.dart';
import 'package:mvp_all_9/pages/store/widgets/user_info.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';


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
                ProductNearby(),
                ServicesNearby(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNav(),extendBody: false,
      ),
    );
  }
}

//BottonNav
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width, 100),
          painter: MyCustomPainter(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            width: size.width,
            height: 60,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.home_filled,
                  size: 40,
                  color: Colors.white,
                ),
                Icon(
                  Icons.task,
                  size: 40,
                  color: Colors.white,
                ),
                Icon(
                  Icons.verified_user_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = ColorsViews.backgroundButtonActiveColor;

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 10;

    final path = Path();
    path.moveTo(0, size.height * 1);
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.085, size.height * 0.3057,
        size.width * 0.1274, size.height * 0.3044);
    path.cubicTo(
        size.width * 0.40625,
        size.height * 0.3785,
        size.width * 0.25395,
        size.height * 0.5331,
        size.width * 0.6012,
        size.height * 0.45);
    path.cubicTo(
        size.width * 0.77765,
        size.height * 0.4087,
        size.width * 0.74255,
        size.height * 0.2829,
        size.width * 0.8662,
        size.height * 0.3044);
    path.quadraticBezierTo(size.width * 0.91005, size.height * 0.2945,
        size.width * 0.9992, size.height * 0.4072);
    path.lineTo(size.width * 1, size.height * 1.008);
    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}