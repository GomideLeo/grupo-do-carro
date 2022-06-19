import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:gupo_carro/shared/SelecionarServico.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Car"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[SelecionarCarro()],
          ),
        ),
      ),
    );
  }
}
