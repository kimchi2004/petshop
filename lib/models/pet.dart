import 'package:petshop/models/tag.dart';
import 'package:petshop/models/category.dart';


class Pet {
  final int id;
  final Category category;
  final String name;
  final String photoUrls;
  final Tag tags;
  final String status;

  const Pet({
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

}