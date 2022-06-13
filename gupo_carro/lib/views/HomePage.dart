import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:gupo_carro/shared/SelecionarServico.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppData appData = AppData.of(context);

    // verificação de primeiro login
    // if (appData!.carList.isEmpty) {
    //   Navigator.pushNamed(context, '/car/register');
    // }
    // else if (appData!.selected < 0) {
    //   Navigator.pushNamed(context, '/car/select');
    // }

    // CarModel selectedCar = appData.carList![appData.selected];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Car"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelecionarCarro()
              // Text('selected: ${appData.selected}\ncarName: ${selectedCar.nickname}\ncarPlate: ${selectedCar.plate}'),
              // // SelecionarServico(),
              // OutlinedButton(
              //   onPressed: (() {
              //     int newSelection = appData.selected-1;
              //     appData.chooseCar(newSelection);
              //     selectedCar = appData.carList[newSelection];
              //   }),
              //   child: const Text("Selecionar anterior"),
              //   style: ButtonStyle(
              //     padding: MaterialStateProperty.all<EdgeInsets>(
              //         const EdgeInsets.all(30.0)),
              //   ),
              // ),
              // OutlinedButton(
              //   onPressed: (() {
              //     int newSelection = appData.selected+1;
              //     appData.chooseCar(newSelection);
              //     selectedCar = appData.carList[newSelection];
              //   }),
              //   child: const Text("Selecionar proximo"),
              //   style: ButtonStyle(
              //     padding: MaterialStateProperty.all<EdgeInsets>(
              //         const EdgeInsets.all(30.0)),
              //   ),
              // ),
              // CarData(selectedCar),
            ],
          ),
        ),
      ),
    );
  }
}
