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
    "https://www.business2community.com/wp-content/uploads/2020/10/sales-promotion-ideas-pet-supplies-plus-20-percent-off_0_0.png",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pet-shop-promotion-instagram-post-design-template-75d5225438c71177ea1c6171d0fd597c_screen.jpg",
    "https://img.freepik.com/free-psd/pet-store-social-media-promotion-instagram-banner-post-design-template_205739-332.jpg"
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
      children: [
        Expanded(
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
                  margin: const EdgeInsets.all(10),
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
