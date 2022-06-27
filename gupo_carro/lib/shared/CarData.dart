// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/CarStats.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarData extends StatefulWidget {
  CarModel car;
  bool showPhoto;
  bool showOdometer;
  bool showGasStats;
  
  CarData(this.car,
      {this.showOdometer = true,
      this.showPhoto = true,
      this.showGasStats = true});

  @override
  _CarDataState createState() => _CarDataState();
}

class _CarDataState extends State<CarData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: buildColumn(),
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }

  List<Widget> buildColumn() {
    List<Widget> children = [];

    children.add(
      Row(
        children: buildRow(),
        mainAxisSize: MainAxisSize.min,
      ),
    );

    if (widget.showGasStats && widget.car.gasStats != null) {
      children.add(CarStats(stats: widget.car.gasStats ?? []));
    }

    return children;
  }

  List<Widget> buildRow() {
    List<Widget> children = [];
    TextStyle titleStyle =
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    if (widget.showPhoto) {
      if (widget.car.photo != null) {
        children.add(
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(widget.car.photo ?? "", width: 70, height: 70),
          ),
        );
      } else {
        children.add(
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset("assets/images/carroDefault.svg",
                width: 70, height: 70),
          ),
        );
      }
    }
    List<Widget> carData = [
      Text(
        widget.car.nickname,
        style: titleStyle,
      ),
      Text(widget.car.plate, style: titleStyle)
    ];
    if (widget.showOdometer) {
      carData.add(Text(widget.car.odometer.toString()));
    }

    children.add(Column(children: carData));

    return children;
  }
}
