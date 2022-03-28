import 'package:gupo_carro/model/GasStatsModel.dart';

class CarModel {
  String nickname;
  String plate;
  String photo;
  List<GasStatsModel> gasStats;
  
  CarModel(this.nickname, this.plate, this.photo, this.gasStats);
}
