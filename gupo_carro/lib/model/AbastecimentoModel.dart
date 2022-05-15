class AbastecimentoModel {
  int id;
  int idCarro;
  DateTime data;
  int combustivelType;
  String combustivel;
  int preco;
  int quantidadeLitros;
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
      'data': data,
      'combustivelType': combustivelType,
      'preco': preco,
      'quantidadeLitros': quantidadeLitros,
      'odometro' : odometro,
    };
  }
}