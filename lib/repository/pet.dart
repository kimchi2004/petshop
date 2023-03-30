import 'dart:convert';

import 'package:petshop/models/pet.dart';
import 'package:http/http.dart' as http;

Future<List<Pet>> fetchPet() async {
  final response = await http
      .get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    final List<dynamic> petData = jsonDecode(response.body);
    final List<Pet> pets = petData.map((data) => Pet.fromJson(data)).toList();
    return pets;
  } else {
    throw Exception('Failed to load pet list');
  }
}
