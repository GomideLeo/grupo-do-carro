import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarroStats extends StatefulWidget {
  @override
  _CarroStatsState createState() => _CarroStatsState();
}

class _CarroStatsState extends State<CarroStats> {
  List<CarStats> stats = [
    CarStats ("Gasolina", 10, "km", "L"),
    CarStats ("Etanol", 8, "km", "L")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: buildStats()
        ),
      ),
    );
  }
  
  List<Text> buildStats() => stats.map((e) => Text(e.toString())).toList();
}

class CarStats {
  String gasType;
  double rate;
  String distanceUnit;
  String volumeUnit;
  
  @override
  String toString() {
    return gasType+": "+rate.toStringAsFixed(2)+" "+distanceUnit+"/"+volumeUnit;
  }

  CarStats(this.gasType, this.rate, this.distanceUnit, this.volumeUnit);
}