import 'package:flutter/material.dart';
import 'package:gupo_carro/oleo/InfoOleo.dart';

class _Opcao {
  String name;
  Widget? screen;

  _Opcao(this.name, this.screen);
}

class SelecionarServico extends StatefulWidget {
  final dropValue = ValueNotifier(_Opcao('Escolha', null));
  final dropOpcoes = [
    _Opcao("Óleo", InfoOleo()),
    _Opcao("Abastecimento", InfoOleo()),
    _Opcao("Manutencao", InfoOleo()),
  ];

  @override
  _SelecionarServicoState createState() => _SelecionarServicoState();
}

class _SelecionarServicoState extends State<SelecionarServico> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ValueListenableBuilder<_Opcao>(
        valueListenable: widget.dropValue,
        builder: (BuildContext context, _Opcao value, _) {
          return Column(
            children: [
              DropdownButton(
                hint: const Text('Escolha a opção desejada'),
                value: value.name,
                onChanged: (escolha) =>
                    widget.dropValue.value = widget.dropOpcoes[escolha as int],
                items: buildDropdown(),
              ),
              const InfoOleo(),
            ],
          );
        },
      )),
    );
  }
  
  List<DropdownMenuItem<int>> buildDropdown() {
    List<DropdownMenuItem<int>> output = [];

    widget.dropOpcoes.asMap().forEach((key, value) {
      output.add(
        DropdownMenuItem<int>(
          value: key,
          child: Text(value.name),
        ),
      );
    });

    return output;
  }
}
