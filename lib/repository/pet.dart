import 'dart:convert';

import 'package:petshop/models/pet.dart';
import 'package:http/http.dart' as http;

List<Pet> parserPet(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Pet>((json) => Pet.fromJson(json)).toList();
}

Future<List<Pet>> fetchPet() async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    return parserPet(response.body);
  } else {
    throw Exception('Failed to load Pet list');
  }
}

Future<List<Pet>> fetchPetid(int id) async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    return parserPet(response.body);
  } else {
    throw Exception('Failed to load Pet list');
  }
}