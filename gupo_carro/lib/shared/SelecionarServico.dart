import 'package:flutter/material.dart';
import 'package:gupo_carro/oleo/InfoOleo.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';

class _Opcao {
  String name;
  Widget? screen;

  _Opcao(this.name, this.screen);
}

class SelecionarServico extends StatefulWidget {
  final dropOpcoes = [
    _Opcao('Escolha', null),
    _Opcao("Óleo", InfoOleo()),
    _Opcao("Abastecimento", CadastroVeiculo()),
    _Opcao("Manutencao", InfoOleo()),
  ];

  @override
  _SelecionarServicoState createState() => _SelecionarServicoState();
}

class _SelecionarServicoState extends State<SelecionarServico> {
  @override
  Widget build(BuildContext context) {
  ValueNotifier<_Opcao> _dropValue = ValueNotifier(widget.dropOpcoes.elementAt(0));

    return Container(
      child: Center(
        child: ValueListenableBuilder<_Opcao>(
          valueListenable: _dropValue,
          builder: (BuildContext context, _Opcao chosenOption, _) {
            return Column(
              children: [
                DropdownButton(
                  hint: const Text('Escolha a opção desejada'),
                  value: 0,
                  onChanged: (escolha) => _dropValue.value =
                      widget.dropOpcoes.elementAt(escolha as int),
                  items: buildDropdown(),
                ),
                _dropValue.value.screen ?? Container(child: Text("Escolha uma opção")),
              ],
            );
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> buildDropdown() {
    List<DropdownMenuItem<int>> output = [];
    
    for (int i = 0; i < widget.dropOpcoes.length; i++ ){
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
