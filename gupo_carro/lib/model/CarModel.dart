import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';

class CarModel {
  String nickname;
  String plate;
  String? photo;
  OdometerModel? odometer;
  List<GasStatsModel>? gasStats;
  
  CarModel({required this.nickname, required this.plate, this.photo, this.odometer, this.gasStats});
}