import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';
import 'package:gupo_carro/views/HomePage.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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

  final _formKey = GlobalKey<FormState>();

  var mascara = MaskTextInputFormatter(
    mask: "##.#"
  );

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
    'Fiat Toro',
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
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro de Veículo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    FormField(
                      builder: (FormFieldState<bool> state){
                        return Column(
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
                            state.hasError?
                            Text(
                              state.errorText!,
                              style: TextStyle(color: Colors.red),
                            ): Container()
                          ]
                        );
                      },
                      validator: (value) {
                        if (dropdownvalue.compareTo("Selecione o veículo") == 0){
                          return "Selecione o modelo do veículo";
                        }
                      }
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(labelText: "Apelido do carro"),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  controller:
                      _nicknameEditingController, //controlador do nosso campo de texto
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Placa"),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  inputFormatters: [UpperCaseFormat()],
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Preenchimento obrigatório";
                    }else if(!RegExp(r"^[A-Z]{3}\d(\d|[A-Z])\d{2}$").hasMatch(value)){
                      return "Placa não é válida";
                    }
                  },
                  controller:
                      _plateEditingController, //controlador do nosso campo de texto
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Km rodados"),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Preenchimento obrigatório";
                    }
                  },
                  controller:
                      _odometerEditingController, //controlador do nosso campo de texto
                ),
                SizedBox(height: 30),

                FormField(
                  builder: (FormFieldState<bool> state){
                    return Column(
                      children: [
                        const Text(
                          'Combustíveis Aceitos',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(height: 20),
                        Column(
                            children: _gasTypes
                                .map((type) => buildGasTypeThing(type))
                                .toList()
                        ),
                        state.hasError?
                          Text(
                          state.errorText!,
                          style: TextStyle(color: Colors.red),
                        ): Container()
                      ],
                    );
                  },
                    validator: (value){
                      if (_gasTypes.every((element) => element.accept == false)){
                        return "Marque pelo menos um tipo de combustível";
                      }
                    }
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Adicionar"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_nicknameEditingController.text.isEmpty){
                        _nicknameEditingController.text = dropdownvalue;
                      }
                      CarModel carModel = convertToCarModel();
                      carModel.saveToSharedPreferences();
                      Navigator.popUntil(context, (route) => false);

                      // Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarView(carModel)));
                      // CarModel.getFromSharedPreferences().then((value) => log(value![0].toString()));
                    }
                  },  //onPressed()
                ),
              ],
            ),
          ),
        ),
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
            inputFormatters: [mascara],
            // textDirection: TextDirection.RTLx,
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

class UpperCaseFormat extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(),
        selection: newValue.selection
    );
  }
}

/*class CheckboxFormField extends FormField<bool>{

  CheckboxFormField({
  });


}*/
