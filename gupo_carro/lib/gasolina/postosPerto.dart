import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/gasolina/PostoData.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/PostoModel.dart';
import 'package:gupo_carro/shared/SelecionarServico.dart';

import '../model/GasPriceModel.dart';

class PostosPerto extends StatefulWidget {
  List<PostoModel> postos = [
    PostoModel(image: "ipiranga.jpg", gasPrices: [
      GasPriceModel(gasType: "Gasolina", value: 5.7),
      GasPriceModel(gasType: "Etanol", value: 5.2)
    ]),
    PostoModel(image: "petrobras.jpg", gasPrices: [
      GasPriceModel(gasType: "Gasolina", value: 5.8),
      GasPriceModel(gasType: "Etanol", value: 5.4)
    ])
  ];
  List<String> gasTypes;
  CarModel car;

  PostosPerto({required this.gasTypes, required this.car});

  @override
  _PostosPertoState createState() => _PostosPertoState();
}

class _PostosPertoState extends State<PostosPerto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.nickname),
      ),
      body: Row(
        children: [
          Column(
            children: buildComponent(),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  List<Widget> buildComponent() {
    List<Widget> children = [];

    children.add(CarData(widget.car));
    children.add(const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "PostosPerto:",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
    children.addAll(widget.postos.map(
      (e) => Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(widget.car.nickname),
                      ),
                      body: SelecionarServico(
                        widget.car,
                        showChoice: false,
                        service: "Abastecimento",
                      ),
                    ),
                  ),
                );
              }),
              child: PostoData(posto: e, gasTypes: widget.gasTypes))),
    ));
    // children.add(Butt)
    children.add(
      Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: ElevatedButton(
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(widget.car.nickname),
                  ),
                  body: SelecionarServico(
                        widget.car,
                        showChoice: false,
                        service: "Abastecimento",
                      ),
                ),
              ),
            );
          }),
          child: const Text("Inserir Manualmente"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(210, 40),
          ),
        ),
      ),
    );
    return children;
  }
}
