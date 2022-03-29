import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/gasolina/CarStats.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarData extends StatefulWidget {
  CarModel car;
  bool showPhoto;
  bool showOdometer;
  bool showGasStats;
  
  CarData({required this.car, this.showOdometer = true, this.showPhoto = true, this.showGasStats = true});
  
  @override
  _CarDataState createState() => _CarDataState();
}

class _CarDataState extends State<CarData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: buildColumn()),
    );
  }
  
  List<Widget> buildColumn() {
    List<Widget> children = [];

    children.add(Row(children: buildRow()));
    
    if (widget.showGasStats && widget.car.gasStats != null) {
      children.add(CarStats(stats: widget.car.gasStats ?? []));
    }

    return children;
  }
  
  List<Widget> buildRow() {
    List<Widget> children = [];
    
    if (widget.showPhoto) {
      if (widget.car.photo != null) {
        children.add(Image.asset(widget.car.photo ?? ""));
      } else {
        children.add(SvgPicture.asset("assets/images/carroDefault.svg", width: 50, height: 50));
      }
    } 
    
    List<Widget> carData = [Text(widget.car.nickname), Text(widget.car.plate)];
    if (widget.showOdometer) {
      carData.add(Text(widget.car.odometer.toString()));
    }
    
    children.add(
      Column(
        children: carData
      )
    );
    
    
    
    return children;
  }
}

