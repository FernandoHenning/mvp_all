import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> GetImagesCarousel() async {
  var response = await http.post(
    Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetImagesCarousel'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idChannel": "1"}),
  );

  List<String> images = [];
  if (response.statusCode == 200) {
    print("Status 200");
    var decode = jsonDecode(response.body);
    images.add(decode["dtoImageCarousels"][0]["url"]);
    images.add(decode["dtoImageCarousels"][1]["url"]);
    images.add(decode["dtoImageCarousels"][2]["url"]);
    return images;
  } else {
    return images;
  }
}

Future<List<dynamic>> GetImagesCards() async {
  var response = await http.post(
    Uri.parse("http://desarrollovan-tis.dedyn.io:4030/GetProductsByIdSeller"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idSeller": "1"}),
  );

  List<dynamic> images = [];
  if (response.statusCode == 200) {
    var decode = jsonDecode(response.body);
    images = decode["getProducts"]["response"]["docs"];

    return images;
  } else {
    return images;
  }
}

Future<List<dynamic>> GetInfo() async {
  var response = await http.post(
    Uri.parse("http://desarrollovan-tis.dedyn.io:4030/GetPetTaxonomia"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idChannel": "1"}),
  );

  List<dynamic> images = [];
  List<dynamic> imagesreturn = [];
  if (response.statusCode == 200) {
    var decode = jsonDecode(response.body);
    images = decode["dtoPetTaxonomies"];
    for (var element in images) {
      var items = element["pet"][0]["detallePets"];
      for (var elemento2 in items) {
        imagesreturn.add(elemento2["item"]);
      }
    }
    return imagesreturn;
  } else {
    return images;
  }
}
