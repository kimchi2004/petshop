
class Tags{
  final int id;
  final String name;
  const Tags({
    required this.id,
    required this.name,
  });
  factory Tags.fromJson(Map<String, dynamic> json){
    return Tags(
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
