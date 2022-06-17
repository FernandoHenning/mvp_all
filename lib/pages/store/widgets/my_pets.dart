import 'package:flutter/material.dart';

class MyPetsWidget extends StatelessWidget {
  const MyPetsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mis mascotas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Column(

                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://images-na.ssl-images-amazon.com/images/G/33/img20/Pets/TopLevel/DOG_400x400.jpg",
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Text("Mi perro")
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(side: BorderSide(
                                  width: 1,
                                  color: Colors.grey
                              )),
                              padding: const EdgeInsets.all(10),
                              primary: Colors.grey[200], // <-- Button color
                              onPrimary: Colors.grey, // <-- Splash color
                            ),
                            child: const Icon(
                              Icons.add_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Agregar\nmascota", style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                      Text(""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
