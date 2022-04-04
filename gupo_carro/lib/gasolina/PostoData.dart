import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/model/GasPriceModel.dart';
import 'package:gupo_carro/model/PostoModel.dart';

class PostoData extends StatefulWidget {
  PostoModel posto;
  List<String> gasTypes;

  PostoData({required this.posto, required this.gasTypes});

  @override
  _PostoDataState createState() => _PostoDataState();
}

class _PostoDataState extends State<PostoData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
          Column(children: [Image.asset("assets/images/" + widget.posto.image)]),
          Column(children: buildPostoData(widget.posto.gasPrices))
        ]));
  }

  List<Text> buildPostoData(List<GasPriceModel> gasPrices) => gasPrices
      .where((e) => widget.gasTypes.contains(e.gasType))
      .map((e) => Text(e.toString()))
      .toList();
}
