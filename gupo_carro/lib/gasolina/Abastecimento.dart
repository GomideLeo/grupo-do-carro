import 'package:flutter/material.dart';
import 'package:gupo_carro/model/AbastecimentoModel.dart';
import 'package:gupo_carro/model/AbastecimentoDB.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/TypeModel.dart';

class Abastecimento extends StatefulWidget {
  CarModel car;

  Abastecimento(this.car, {Key? key}) : super(key: key);

  @override
  _AbastecimentoState createState() => _AbastecimentoState();
}

class _AbastecimentoState extends State<Abastecimento> {
  String _selecionado = "-1";
  List<RadioListTile<String>> buttonItems = [
    RadioListTile<String>(
      title: const Text("Loading "),
      groupValue: " ",
      value: "-1",
      onChanged: (String? escolha) {},
    )
  ];

  final TextEditingController textEditingController = TextEditingController();

  double getRate() {
    return double.parse(textEditingController.text);
  }

  @override
  void initState() {
    super.initState();
    // loadData();
  }

  void loadData() async {
    // READ FROM MANUTENCAO TYPE
    AbastecimentoDB adb = AbastecimentoDB();
    List<TypeModel> latm = await adb.combustivelTypes();

    if (latm.length > 1) {
      List<RadioListTile<String>> menuItems = List.generate(latm.length, (i) {
        return RadioListTile<String>(
          title: Text(latm[i].name),
          value: latm[i].id.toString(),
          groupValue: _selecionado,
          onChanged: (String? escolha) {
            setState(() {
              _selecionado = escolha!;
            });
          },
        );
      });

      setState(() {
        buttonItems = menuItems;
        _selecionado = '1';
      });
    }
  }

  final TextEditingController _litrosEditingController =
      TextEditingController();
  final TextEditingController _precoEditingController = TextEditingController();
  final TextEditingController _odometroEditingController =
      TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Litros: "),
              
              controller:
                  _litrosEditingController, //controlador do nosso campo de texto
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Preço por litro: "),

              controller:
                  _precoEditingController, //controlador do nosso campo de texto
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text("Combustível atual do abastecimento "),
          RadioListTile<String>(
            title: const Text("Gasolina"),
            value: "1",
            groupValue: _selecionado,
            onChanged: (String? escolha) {
              setState(() {
                _selecionado = escolha!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text("Álcool"),
            value: "2",
            groupValue: _selecionado,
            onChanged: (String? escolha) {
              setState(() {
                _selecionado = escolha!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text("Diesel"),
            value: "3",
            groupValue: _selecionado,
            onChanged: (String? escolha) {
              setState(() {
                _selecionado = escolha!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Odômetro: "),

              controller:
                  _odometroEditingController, //controlador do nosso campo de texto
            ),
          ),
          ElevatedButton(
            child: const Text("Adicionar"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {
              //open database
              final DAO = AbastecimentoDB();
              //get data
              int valor = int.parse(_selecionado);
              // add data
              DAO.insertAbastecimento(AbastecimentoModel(
                id: -1, // placeholder for adding
                idCarro: widget.car.id,
                data: DateTime.now(),
                combustivelType: valor,
                combustivel: " ",
                preco: double.parse(_precoEditingController.text),
                quantidadeLitros: double.parse(_litrosEditingController.text),
                odometro: int.parse(_odometroEditingController.text),
              ));
              print("Item selecionado: " + _selecionado);
            },
          ),
        ],
      ),
    );
  }
}
