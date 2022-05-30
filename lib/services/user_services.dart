import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}

class LoginService {
  Future<String> logIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception(response.body.toString());
    }
  }
}
