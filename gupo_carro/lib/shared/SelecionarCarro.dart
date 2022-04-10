import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/model/CarModel.dart';

class SelecionarCarro extends StatelessWidget {
  List<CarModel> carsList = [];

  SelecionarCarro();

  @override
  Widget build(BuildContext context) {
    AppData appData = AppData.of(context);
    carsList = appData.carList;
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: buildComponent(),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  List<Widget> buildComponent() {
    List<Widget> children = [];

    children.addAll(carsList.map((car) {
      return OutlinedButton(
        onPressed: (() => log(car.nickname)),
        child: CarData(car,
            showPhoto: true, showOdometer: true, showGasStats: false),
      );
    }));
    children.add(
      OutlinedButton(
        onPressed: (() => log("asdasdasd")),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16.0)),
        ),
        child: Text("Adicionar Carro"),
      ),
    );

    return children;
  }
}
