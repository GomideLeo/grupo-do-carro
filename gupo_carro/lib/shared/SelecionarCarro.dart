import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/model/CarModel.dart';

class SelecionarCarro extends StatelessWidget {
  List<CarModel>? carsList = null;

  SelecionarCarro({Key? key, List<CarModel>? cars}) : super(key: key);

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

    children.addAll(carsList!
        .map((car) => CarData(car, showPhoto: true, showOdometer: true, showGasStats: false)));
    children.add(Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: OutlinedButton(
        onPressed: (() {}),
        child: const Text("Adicionar Carro"),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(30.0)),
        ),
      ),
    ),
    );


    return children;
  }

}