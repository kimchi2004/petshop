import 'dart:convert';

import 'package:petshop/models/tag.dart';
import 'package:petshop/models/category.dart';

List<Pet> petFromJson(String str) =>
    List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

class Pet {
  int id;
  Category category;
  String name;
  String photoUrls;
  Tag tags;
  String status;

  Pet({
    required this.id,
    required this.category,
    required this.name,
    required this.photoUrls,
    required this.tags,
    required this.status,
  });

  factory Pet.fromJson(Map<String, dynamic> json) =>
      Pet(
        id: json['id'],
        category: Category.fromJson(json['category']),
        name: json['name'],
        photoUrls: json['photoUrls'],
        tags: Tag.fromJson(json['tags']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category.toJson();
    data['name'] = name;
    data['photoUrls'] = photoUrls;
    data['tags'] = tags.toJson();
    data['status'] = status;
    return data;
  }
}