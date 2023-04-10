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

void registerUser(User user) async {
  final url = Uri.parse('https://petstore.swagger.io/v2/user');
  final body = json.encode(user.toJson());

  final response = await http.post(url, body: body);

  if (response.statusCode == 200) {
  } else {
  }
}

class AuthService {
  final baseUrl = 'https://petstore.swagger.io/v2/user/login?username=a&password=a';

  Future<bool> login(User user) async {
    final url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      // Successful login
      return true;
    } else {
      // Failed login
      return false;
    }
  }
}
