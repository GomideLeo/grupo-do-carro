class ManutencaoModel {
  int id;
  String idCarro;
  int type;
  String typeName;
  DateTime data;
  int? preco;
  int? odometro;
  DateTime? dataProximo;
  int? odometroProximo;

  ManutencaoModel({
    required this.id,
    required this.idCarro,
    required this.type,
    required this.typeName,
    required this.data,
    this.preco,
    this.odometro,
    this.dataProximo,
    this.odometroProximo,
  });

  Map<String, dynamic> toMap() {
    return {
      'idCarro': idCarro,
      'manType': type,
      'data': data.toIso8601String(),
      'preco': preco,
      'odometro': odometro,
      'dataProximo': dataProximo?.toIso8601String(),
      'odometroProximo': odometroProximo,
    };
  }
}