import 'package:flutter/material.dart';
import 'package:mvp_all_9/services/images_service/images_service.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class ProductNearby extends StatefulWidget {
  const ProductNearby({Key? key}) : super(key: key);

  @override
  State<ProductNearby> createState() => _ProductNearbyState();
}

class _ProductNearbyState extends State<ProductNearby> {
  int pagePosition = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "Productos cerca",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        FutureBuilder<List<dynamic>>(
          builder: (
            BuildContext context,
            AsyncSnapshot<List<dynamic>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: PageView.builder(
                          itemCount: snapshot.data!.length,
                          pageSnapping: true,
                          controller: _pageController,
                          itemBuilder: (context, pagePosition) {
                            return Container(

                              color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data![pagePosition]['urlImage'].toString(),
                                    height: 260,
                                    width: 800,
                                  ),
                                  Text(
                                    snapshot.data![pagePosition]['name'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: ColorsViews.backgroundButtonActiveColor,

                                    ),
                                  ),
                                  Text(snapshot.data![pagePosition]['description'].toString()),

                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
          future: GetImagesCards(),
        ),
      ],
    );
  }
}
