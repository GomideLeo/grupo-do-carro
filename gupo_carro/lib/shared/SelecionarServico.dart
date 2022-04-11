import 'package:flutter/material.dart';
import 'package:gupo_carro/oleo/InfoOleo.dart';

class SelecionarServico extends StatefulWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = [
    'Óleo',
    'Gasolina',
    'Álcool',
  ];

  @override
  _SelecionarServicoState createState() => _SelecionarServicoState();
}

class _SelecionarServicoState extends State<SelecionarServico> {
  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOpcoes = [
      'Óleo',
      'Gasolina',
      'Álcool',
    ];

    return Container(
      child: Center(
          child: ValueListenableBuilder(
        valueListenable: dropValue,
        builder: (BuildContext context, String value, _) {
          return Column(
            children: [
              DropdownButton(
                hint: const Text('Escolha a opção desejada'),
                value: (value.isEmpty) ? null : value,
                onChanged: (escolha) => dropValue.value = escolha.toString(),
                items: dropOpcoes
                    .map(
                      (op) => DropdownMenuItem(
                        value: op,
                        child: Text(op),
                      ),
                    )
                    .toList(),
              ),
              const InfoOleo(),
            ],
          );
        },
      )),
    );
  }
}
