import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gupo_carro/gasolina/Abastecimento.dart';
import 'package:gupo_carro/gasolina/postosPerto.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/oleo/InfoOleo.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';
import 'package:gupo_carro/shared/CarStats.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:path/path.dart';

class _Opcao {
  String name;
  Widget? screen;

  _Opcao(this.name, this.screen);
}

class SelecionarServico extends StatefulWidget {
  CarModel car;
  bool showChoice;
  String service;

  var dropOpcoes = [
    _Opcao('Escolha', null),
  ];

  SelecionarServico(this.car,
      {this.showChoice = true, this.service = "", Key? key})
      : super(key: key);

  @override
  _SelecionarServicoState createState() => _SelecionarServicoState();
}

class _SelecionarServicoState extends State<SelecionarServico> {
  @override
  Widget build(BuildContext context) {
    widget.dropOpcoes.addAll([
      _Opcao("Óleo", InfoOleo()),
      _Opcao("Abastecimento", Abastecimento(widget.car)),
      _Opcao("Manutencao", InfoOleo())
    ]);

    int idx = widget.dropOpcoes.indexWhere((el) => el.name == widget.service);
    int _selectedValue = idx == -1 ? 0 : idx;
    
    ValueNotifier<_Opcao> _dropValue =
        ValueNotifier(widget.dropOpcoes.elementAt(_selectedValue));
    
    return Center(
      child: ValueListenableBuilder<_Opcao>(
        valueListenable: _dropValue,
        builder: (BuildContext context, _Opcao chosenOption, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (widget.showChoice) DropdownButton(
                  hint: const Text('Escolha a opção desejada'),
                  value: _selectedValue,
                  onChanged: (escolha) {
                    _selectedValue = escolha as int;
                    _dropValue.value =
                        widget.dropOpcoes.elementAt(_selectedValue);
                  },
                  items: buildDropdown(),
                ),
                Container(
                    child: _dropValue.value.screen ??
                        const Text("Escolha uma opção")),
              ],
            ),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<int>> buildDropdown() {
    List<DropdownMenuItem<int>> output = [];

    for (int i = 0; i < widget.dropOpcoes.length; i++) {
      output.add(
        DropdownMenuItem<int>(
          value: i,
          child: Text(widget.dropOpcoes.elementAt(i).name),
        ),
      );
    }

    return output;
  }
}
