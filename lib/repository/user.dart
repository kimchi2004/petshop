import 'dart:convert';

import 'package:petshop/models/User.dart';
import 'package:http/http.dart' as http;

List<User> parserUser(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<User>> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/user/login?username=a&password=a'));

  if (response.statusCode == 200) {
    return parserUser(response.body);
  } else {
    throw Exception('Failed to load User list');
  }
}

class AuthService {
  final baseUrl = 'https://petstore.swagger.io/v2/user';

  Future<bool> registerUser(User user) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(url, body: json.encode(user.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(User user) async {
    final url = '$baseUrl/login';
    final response = await http.post(Uri.parse(url), body: json.encode(user.toJson()),);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
