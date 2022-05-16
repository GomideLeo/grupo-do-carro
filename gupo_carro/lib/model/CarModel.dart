import 'dart:developer';

import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CarModel {
  String id;
  String nickname;
  String plate;
  String? modelo;
  String? photo;
  OdometerModel? odometer;
  List<GasStatsModel>? gasStats;

  CarModel(
      {required this.id,
      required this.nickname,
      required this.plate,
      this.modelo,
      this.photo,
      this.odometer,
      this.gasStats});

  Object toObject() {
    return {
      "id": id,
      "nickname": nickname,
      "plate": plate,
      "modelo": modelo,
      "photo": photo,
      "odometer": odometer?.toObject(),
      "gasStats": gasStats?.map((e) => e.toObject()).toList()
    };
  }

  @override
  String toString() {
    return jsonEncode(toObject());
  }

  void saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<CarModel> curr = (await getFromSharedPreferences()) ?? [];
    curr.add(this);
    prefs.setStringList("cars", curr.map((e) => e.toString()).toList());
  }
  
  static Future<List<CarModel>?> getFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var returnValue =  (prefs.getStringList("cars") ?? []).map((e) {
      dynamic car = jsonDecode(e);
      List<dynamic> gasList = car["gasStats"];
      return CarModel(
          id: car["id"],
          nickname: car["nickname"],
          plate: car["plate"],
          modelo: car["modelo"],
          photo: car["photo"],
          odometer: car["odometer"] != null ? OdometerModel(
              value: car["odometer"]["value"], unit: car["odometer"]["unit"]) : null,
          gasStats: gasList
              .map((e) => GasStatsModel(
                  gasType: e["gasType"],
                  rate: e["rate"],
                  distanceUnit: e["distanceUnit"],
                  volumeUnit: e["volumeUnit"]))
              .toList());
    }).toList();
    return returnValue;
  }
}
