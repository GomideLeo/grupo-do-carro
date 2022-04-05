import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/gasolina/PostoData.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/PostoModel.dart';

class PostosPerto extends StatefulWidget {
  List<PostoModel> postos;
  List<String> gasTypes;
  CarModel car;

  PostosPerto(
      {required this.postos, required this.gasTypes, required this.car});

  @override
  _PostosPertoState createState() => _PostosPertoState();
}

class _PostosPertoState extends State<PostosPerto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: buildComponent(),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
    children.addAll(widget.postos
        .map((e) => PostoData(posto: e, gasTypes: widget.gasTypes)));
    // children.add(Butt)
    children.add(Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: OutlinedButton(
        onPressed: (() {}),
        child: const Text("Inserir Manualmente")),
      ),
    );
    return children;
  }
}
