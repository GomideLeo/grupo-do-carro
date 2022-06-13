class AbastecimentoModel {
  int id;
  String idCarro;
  DateTime data;
  int combustivelType;
  String combustivel;
  double preco;
  double quantidadeLitros;
  int odometro;

  AbastecimentoModel({
    required this.id,
    required this.idCarro,
    required this.data,
    required this.combustivelType,
    required this.combustivel,
    required this.preco,
    required this.quantidadeLitros,
    required this.odometro,
  });

  Map<String, dynamic> toMap() {
    return {
      'idCarro': idCarro,
      'data': data.toIso8601String(),
      'combustivelType': combustivelType,
      'preco': (preco*100).round(),
      'quantidadeLitros': (quantidadeLitros*100).round(),
      'odometro' : odometro,
    };
  }
}