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
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                Image.asset("assets/images/" + widget.posto.image,
                    width: 50, height: 50)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Column(children: buildPostoData(widget.posto.gasPrices))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  List<Text> buildPostoData(List<GasPriceModel> gasPrices) => gasPrices
      .where((e) => widget.gasTypes.contains(e.gasType))
      .map((e) => Text(e.toString()))
      .toList();
}
