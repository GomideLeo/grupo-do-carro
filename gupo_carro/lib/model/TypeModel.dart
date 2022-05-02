class TypeModel {
  int id;
  String name;

  TypeModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}