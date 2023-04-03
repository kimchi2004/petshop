import 'dart:convert';

import 'package:petshop/models/category.dart';
import 'package:http/http.dart' as http;

List<Category> parserCategorty(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}

Future<List<Category>> fetchCategorty() async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    return parserCategorty(response.body);
  } else {
    throw Exception('Failed to load Categorty list');
  }
}