
class Category{
  final int id;
  final String name;
  const Category({
    required this.id,
    required this.name,
  });
  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
