import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/views/CarView.dart';

class SelecionarCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    children.add(getCarSelection(context));
    children.add(Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: ElevatedButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroVeiculo()),
          );
        }),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(240, 40),
        ),
        child: const Text("Adicionar Carro"),
      ),
    ));

    return children;
  }

  Widget getCarSelection(BuildContext context) {
    return FutureBuilder<List<CarModel>?>(
        future: CarModel.getFromSharedPreferences(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CarModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
                  children: snapshot.data
                          ?.map((e) => getCarWidget(context, e))
                          .toList() ??
                      []);
            } // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        });
  }

  Widget getCarWidget(BuildContext context, CarModel car) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: OutlinedButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarView(car)),
          );
        }),
        child: SizedBox(
          child: CarData(car,
              showPhoto: true, showOdometer: true, showGasStats: false),
          width: 200,
        ),
      ),
    );
  }
}
