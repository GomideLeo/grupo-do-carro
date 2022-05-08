import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';

class CarModel {
  String id;
  String nickname;
  String plate;
  String? modelo;
  String? photo;
  OdometerModel? odometer;
  List<GasStatsModel>? gasStats;
  
  CarModel({required this.id, required this.nickname, required this.plate, this.modelo, this.photo, this.odometer, this.gasStats});

}