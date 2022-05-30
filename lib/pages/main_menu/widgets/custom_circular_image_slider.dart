import 'package:flutter/material.dart';

class CircularImageSlider extends StatelessWidget {
  const CircularImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Tap!'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    // Hide the snackbar before its duration ends
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/DOG_400x400.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Tap!'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    // Hide the snackbar before its duration ends
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/CAT_400x400.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Tap!'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    // Hide the snackbar before its duration ends
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/BIRDS_400x400.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Tap!'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    // Hide the snackbar before its duration ends
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/FISH_400x400.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Tap!'),
                  duration: const Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      // Hide the snackbar before its duration ends
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/BUNNY_400x400.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        height: 100,
        width: 100,
        center: Offset(size.width / 2, size.height / 2));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
