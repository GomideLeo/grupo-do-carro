import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/views/CarView.dart';

class SelecionarCarro extends StatelessWidget {
  List<CarModel> carsList = [];

  @override
  Widget build(BuildContext context) {
    AppData appData = AppData.of(context);
    carsList = appData.carList;
    return Container(
      child: Row(
        children: [
          Column(
            children: buildComponent(context),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  List<Widget> buildComponent(BuildContext context) {
    List<Widget> children = [];

    children.addAll(carsList.map((car) {
      return OutlinedButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarView(car)),
          );
        }),
        child: CarData(car,
            showPhoto: true, showOdometer: true, showGasStats: false),
      );
    }));
    children.add(
      OutlinedButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroVeiculo()),
          );
        }),
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
