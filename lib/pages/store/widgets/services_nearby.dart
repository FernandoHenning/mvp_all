import 'package:flutter/material.dart';
import 'package:mvp_all_9/services/images_service/images_service.dart';
import 'package:mvp_all_9/style/colors/colors_views.dart';

class ServicesNearby extends StatefulWidget {
  const ServicesNearby({Key? key}) : super(key: key);

  @override
  State<ServicesNearby> createState() => _ServicesNearbyState();
}

class _ServicesNearbyState extends State<ServicesNearby> {
  int pagePosition = 1;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text(
              "Servicios cerca",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorsViews.backgrounAppBar
                  ),
                  color: ColorsViews.backgrounAppBar,
                  borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: const Text(
                "Paseadores",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorsViews.whiteColor
                  ),
                  color: ColorsViews.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: const Text(
                "Restaurantes",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorsViews.whiteColor
                  ),
                  color: ColorsViews.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: const Text(
                "Fotos estudio",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(builder: (
            BuildContext context,
            AsyncSnapshot<List<dynamic>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height:
                  275, // Para una sola fila poner en 345 y 500 para 2 filas
                  width: double.infinity,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 1,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(snapshot.data!.length, (index) {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Card(
                          surfaceTintColor: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                snapshot.data![index]['urlImage'].toString(),
                                height: 100, // Para una sola fila poner en 200 y 115 para 2 filas

                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                    child: Text(
                                      snapshot.data![index]['name'],
                                      style: const TextStyle(
                                          color: ColorsViews.backgroundButtonActiveColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Text(
                                      snapshot.data![index]['description'],
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${snapshot.data![index]['price'].toString()}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),

                                        ),
                                        const Text(
                                          "10% Desc.",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
            } else {
              return const Text("Empty Data");
            }
          }else{
            return Text('State:${snapshot.connectionState}');
          }
        },
          future: GetImagesCards(),
        )
      ],
    );
  }
}
