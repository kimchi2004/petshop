import 'dart:convert';

import 'package:petshop/models/pet.dart';
import 'package:http/http.dart' as http;

Future<Pet> fetchPet() async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pet list');
  }
}