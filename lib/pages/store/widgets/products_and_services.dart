import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class ProductsAndServicesWidget extends StatelessWidget {
  const ProductsAndServicesWidget({Key? key}) : super(key: key);
  final double image_width = 175.0;
  final double image_height  = 175.0;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(5),
              elevation: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/onBoarding/B5.png", width: image_width, height: image_height,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('PRODUCTOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsViews.backgroundButtonActiveColor),),
                    ),
                  ],
                ),
              ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(5),
            elevation: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/onBoarding/B1.png", width: image_width, height: image_height ,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('SERVICIOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsViews.backgroundButtonActiveColor),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
