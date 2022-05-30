import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/login/main_login.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';
import 'package:mvp_all_9/widgets/button_custom.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  int actual = 0;

  List<Map<String, String>> boardingData = [
    {
      'image': "assets/onBoarding/B1.png",
      'title': "ESPARCIMIENTO",
      'text': "Brindamos todos los servicios para\nconsentir tu mascota",
    },
    {
      'image': "assets/onBoarding/B2.png",
      'title': "ADOPCIÓN",
      'text':
          "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
    },
    {
      'image': "assets/onBoarding/B3.png",
      'title': "HOSPITALIDAD",
      'text':
          "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
    },
    {
      'image': "assets/onBoarding/B4.png",
      'title': "VETERINARIA",
      'text':
          "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
    },
    {
      'image': "assets/onBoarding/B5.png",
      'title': "TIENDA",
      'text':
          "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page!.round() != actual) {
        setState(() {
          actual = controller.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: imagesPage(controller: controller, actual: actual),
              ),
              Expanded(
                flex: 1,
                child: _ButtonBottom(
                  colorActive: (actual == boardingData.length - 1)
                      ? ColorsViews.backgroundButtonActiveColor
                      : null,
                  colorTextActive: (actual == boardingData.length - 1)
                      ? ColorsViews.whiteColor
                      : null,
                  borderColor: (actual == boardingData.length - 1)
                      ? Colors.transparent
                      : null,
                  disable: false,
                  onPress: (actual == boardingData.length - 1)
                      ? () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ),
                          )
                      : () => controller.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastOutSlowIn,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonBottom extends StatelessWidget {
  final Color? colorActive;
  final Color? colorTextActive;
  final Color? borderColor;

  final bool? disable;
  final Function? onPress;
  const _ButtonBottom({
    Key? key,
    this.colorActive,
    this.colorTextActive,
    this.disable,
    this.onPress,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ButtomCustom(
        width: 300,
        height: 30,
        background: colorActive,
        borderColor: borderColor ?? ColorsViews.borderButtonColor,
        disable: disable ?? true,
        text: Text(
          colorActive != null ? "Continuar" : "Siguiente",
          style: TextStyle(
            color: colorTextActive ?? ColorsViews.textButtonDisableColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPress: onPress,
      ),
    );
  }
}

class imagesPage extends StatelessWidget {
  const imagesPage({
    Key? key,
    required this.controller,
    required this.actual,
  }) : super(key: key);

  final PageController controller;
  final int actual;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> boardingData = [
      {
        'image': "assets/onBoarding/B1.png",
        'title': "ESPARCIMIENTO",
        'text': "Brindamos todos los servicios para\nconsentir tu mascota",
      },
      {
        'image': "assets/onBoarding/B2.png",
        'title': "ADOPCIÓN",
        'text':
            "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
      },
      {
        'image': "assets/onBoarding/B3.png",
        'title': "HOSPITALIDAD",
        'text':
            "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
      },
      {
        'image': "assets/onBoarding/B4.png",
        'title': "VETERINARIA",
        'text':
            "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
      },
      {
        'image': "assets/onBoarding/B5.png",
        'title': "TIENDA",
        'text':
            "Est ea tempor duis sunt mollit exercitation\ndo elit dolor ea duis.",
      },
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
            controller: controller,
            itemCount: boardingData.length,
            itemBuilder: (context, index) => ContainerBoarding(
              image: boardingData[index]['image']!,
              title: boardingData[index]['title']!,
              text: boardingData[index]['text']!,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              boardingData.length,
              (index) => AnimatedContainer(
                duration: kThemeAnimationDuration,
                width: actual == index ? 25 : 20,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: actual == index
                      ? ColorsViews.activeSliderColor
                      : ColorsViews.disableSliderColor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ContainerBoarding extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const ContainerBoarding({
    Key? key,
    required this.image,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 300,
          height: 300,
        ),
        Text(
          title,
          style: const TextStyle(
            color: ColorsViews.txtHeaderColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
