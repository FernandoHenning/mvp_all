import 'package:flutter/material.dart';
import 'package:mvp_all_9/services/images_service/images_service.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class HotSalesCarousel extends StatefulWidget {
  HotSalesCarousel({Key? key}) : super(key: key);

  @override
  State<HotSalesCarousel> createState() => _HotSalesCarouselState();
}

class _HotSalesCarouselState extends State<HotSalesCarousel> {
  Future<List<String>> _imagesUrl = GetImagesCarousel();
  int pagePosition = 1;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FutureBuilder<List<String>>(
        builder: (
            BuildContext context,
            AsyncSnapshot<List<String>> snapshot,
        ){              if (snapshot.connectionState == ConnectionState.waiting) {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height:150,
                  width: double.infinity,
                  child: PageView.builder(
                      itemCount: snapshot.data!.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          pagePosition = page;
                        });
                      },
                      itemBuilder: (context, pagePosition) {
                        return  Image.network(
                            fit: BoxFit.contain,
                            snapshot.data![pagePosition],
                            width: double.infinity,
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
        future: _imagesUrl,
      ),
    );
  }
}
