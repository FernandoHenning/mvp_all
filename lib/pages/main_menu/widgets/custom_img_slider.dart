import 'package:flutter/material.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  List<String> images = [
    "https://images.pexels.com/photos/757455/pexels-photo-757455.jpeg?auto=compress&cs=tinysrgb&w=900&h=600dpr=1",
    "https://images.pexels.com/photos/8939264/pexels-photo-8939264.jpeg?auto=compress&cs=tinysrgb&w=600&h=400&dpr=1",
    "https://images.pexels.com/photos/485294/pexels-photo-485294.jpeg?auto=compress&cs=tinysrgb&w=600&h=400&dpr=1"
  ];
  int pagePosition = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  pagePosition = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Image.network(images[pagePosition]),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(images.length, pagePosition),
        )
      ],
    );
  }
}

List<Widget> indicators(imagesLenght, currentIndex) {
  return List<Widget>.generate(imagesLenght, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorsViews.activeSliderColor
              : ColorsViews.disableSliderColor,
          shape: BoxShape.circle),
    );
  });
}
