import 'dart:convert';

import 'package:petshop/models/pet.dart';
import 'package:http/http.dart' as http;

Future<Pet> fetchPet() async {
  final response = await http.get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=available'));

  if (response.statusCode == 200) {
    final List<dynamic> petData = jsonDecode(response.body);
    if (petData.isNotEmpty) {
      return Pet.fromJson(petData[0]);
    }
  }
  throw Exception('Failed to load pet list');
}
