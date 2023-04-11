import 'dart:convert';

import 'package:petshop/models/User.dart';
import 'package:http/http.dart' as http;

List<User> parserUser(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<User>> fetchUser() async {
  final response = await http.get(Uri.parse('https://petstore.swagger.io/v2/user/chi@gmail.com'));
  print('Response body: ${response.body}');
  print('Status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    return parserUser(response.body);
  } else {
    throw Exception('Failed to load User list');
  }
}

Future<User> createUser(User user) async {
  final response = await http.post(
    Uri.parse('https://petstore.swagger.io/v2/user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': user.id,
      'username': user.username,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': user.password,
      'phone': user.phone,
      'userStatus': 0,
    }),
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

Future<bool> login(String username, String password) async {
  final response = await http.get(
    Uri.parse('https://petstore.swagger.io/v2/user/login?username=$username&password=$password'),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
