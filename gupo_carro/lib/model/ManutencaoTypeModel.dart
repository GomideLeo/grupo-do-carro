class ManutencaoTypeModel {
  int id;
  String name;

  ManutencaoTypeModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}