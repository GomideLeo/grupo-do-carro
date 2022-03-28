import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/model/GasStatsModel.dart';

class CarStats extends StatefulWidget {
  List<GasStatsModel> stats;
  CarStats({required this.stats});
  
  @override
  _CarStatsState createState() => _CarStatsState();
}

class _CarStatsState extends State<CarStats> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: buildStats()
      ),
    );
  }
  
  List<Text> buildStats() => widget.stats.map((e) => Text(e.toString())).toList();
}

