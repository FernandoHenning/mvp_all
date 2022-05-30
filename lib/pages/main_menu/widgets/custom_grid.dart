import 'package:flutter/material.dart';
import 'package:mvp_all_9/pages/main_menu/blank_view.dart';

class FoodCustomGrid extends StatelessWidget {
  const FoodCustomGrid({Key? key}) : super(key: key);

  static const List<String> _imagesUrl = [
    "https://m.media-amazon.com/images/I/61HhuaY4WzS._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/61QQzfc068L._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/51ehTgUH4oS._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/81RcmnT9WRL._AC_UL320_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368, // Para una sola fila poner en 345 y 500 para 2 filas
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(_imagesUrl.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlankView()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      _imagesUrl[index],
                      height:
                          200, // Para una sola fila poner en 200 y 115 para 2 filas
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ToysCustomGrid extends StatelessWidget {
  const ToysCustomGrid({Key? key}) : super(key: key);

  static const List<String> _imagesUrl = [
    "https://m.media-amazon.com/images/I/618e7g46FhL._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/71RNxwf8NmL._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/71avugl7egS._AC_UL320_.jpg",
    "https://m.media-amazon.com/images/I/71RYZSLBQBL._AC_UL320_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368, // Para una sola fila poner en 345 y 500 para 2 filas
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(_imagesUrl.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlankView()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      _imagesUrl[index],
                      height:
                          200, // Para una sola fila poner en 200 y 115 para 2 filas
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
