import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/gasolina/PostoData.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/GasPriceModel.dart';
import 'package:gupo_carro/model/PostoModel.dart';

class SelecionarCarro extends StatefulWidget {
  List<CarModel> cars;

  SelecionarCarro({required this.cars});

  @override
  _SelecionarCarroState createState() => _SelecionarCarroState();
}

class _SelecionarCarroState extends State<SelecionarCarro> {
  @override
  Widget build(BuildContext context) {
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

    children.addAll(widget.cars
        .map((car) => CarData(car, showPhoto: true, showOdometer: true, showGasStats: false)));
    children.add(Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: OutlinedButton(
        onPressed: (() {}),
        child: const Text("Adicionar Carro"),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.all(30.0)),
        ),
      ),
    ),
    );


    return children;
  }

}