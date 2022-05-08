import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';
import 'package:gupo_carro/views/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../views/CarView.dart';

class _AcceptGas {
  String name;
  bool accept;
  final TextEditingController textEditingController = TextEditingController();

  double getRate() {
    return textEditingController.text != ""
        ? double.parse(textEditingController.text)
        : 0;
  }

  _AcceptGas(this.name, this.accept);
}

class CadastroVeiculo extends StatefulWidget {
  const CadastroVeiculo({Key? key}) : super(key: key);

  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {
  //instanciar o objeto para controlar o campo de texto
  final List<_AcceptGas> _gasTypes = [
    _AcceptGas("Gasolina", false),
    _AcceptGas("Etanol", false),
    _AcceptGas("Diesel", false)
  ];

  final TextEditingController _nicknameEditingController =
      TextEditingController();
  final TextEditingController _plateEditingController = TextEditingController();
  final TextEditingController _odometerEditingController =
      TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'Selecione o veículo';

  // List of items in our dropdown menu
  var items = [
    'Selecione o veículo',
    'Fiat Palio',
    'Fiat Uno',
    'Fiat Strada',
    'Fiat Touro',
    'Fiat Argos',
    'Fiat Mobi',
    'Chevrolet Onix',
    'Chevrolet Cruze',
    'Chevrolet Prisma',
    'Chevrolet Celta',
    'Chevrolet Corsa',
    'Chevrolet Astra',
    'Volkswagen Gol',
    'Volkswagen Voyage',
    'Volkswagen Fox',
    'Volkswagen Jetta',
    'Volkswagen Polo',
    'Volkswagen Saveiro',
    'Ford Ka',
    'Ford EcoSport',
    'Ford Edge',
    'Ford Focus',
    'Toyota Corolla',
    'Toyota Etios',
    'Toyota Hilux',
    'Honda City',
    'Honda Fit',
    'Honda Civic',
    'Hyundai HB20',
    'Hyundai Creta',
    'Outro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Veículo"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue ?? "Selecione o veículo";
                  });
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: "Apelido do carro"),
            style: const TextStyle(
              fontSize: 18,
            ),
            controller:
                _nicknameEditingController, //controlador do nosso campo de texto
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: "Placa"),
            style: const TextStyle(
              fontSize: 18,
            ),
            controller:
                _plateEditingController, //controlador do nosso campo de texto
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Km rodados"),
            style: const TextStyle(
              fontSize: 18,
            ),
            controller:
                _odometerEditingController, //controlador do nosso campo de texto
          ),
          Column(
            children: [
              const Text(
                'Combustíveis Aceitos',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Column(
                  children:
                      _gasTypes.map((type) => buildGasTypeThing(type)).toList())
            ],
          ),
          ElevatedButton(
            child: const Text("Adicionar"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {
              CarModel carModel = convertToCarModel();
              carModel.saveToSharedPreferences();
              Navigator.popUntil(context, (route) => false);

              // Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarView(carModel)));
              // CarModel.getFromSharedPreferences().then((value) => log(value![0].toString()));
            },
          ),
        ],
      ),
    );
  }

  Widget buildGasTypeThing(_AcceptGas gasType) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
              title: Text(gasType.name),
              value: gasType.accept,
              onChanged: (bool? valor) {
                setState(() {
                  gasType.accept = valor ?? false;
                });
              }),
        ),
        Expanded(
          child: TextField(
            readOnly: !gasType.accept,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: "Quantidade de Km/L: "),
            style: const TextStyle(
              fontSize: 18,
            ),
            controller: gasType
                .textEditingController, //controlador do nosso campo de texto
          ),
        )
      ],
    );
  }

  CarModel convertToCarModel() {
    var uuid = Uuid();
    List<GasStatsModel> gasStats = [];

    for (var t in _gasTypes) {
      if (t.accept) {
        gasStats.add(GasStatsModel(gasType: t.name, rate: t.getRate()));
      }
    }

    return CarModel(
        id: uuid.v4(),
        nickname: _nicknameEditingController.text,
        plate: _plateEditingController.text,
        modelo: dropdownvalue,
        odometer: _odometerEditingController.text != ""
            ? OdometerModel(value: int.parse(_odometerEditingController.text))
            : null,
        gasStats: gasStats);
  }
}
