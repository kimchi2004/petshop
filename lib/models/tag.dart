
class Tag{
  final int id;
  final String name;
  const Tag({
    required this.id,
    required this.name,
  });
  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(
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
