import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:gupo_carro/views/HomePage.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: 'Meus Carros',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/car/select': (context) => SelecionarCarro(),
        '/car/register': (context) => const CadastroVeiculo(),
      },
    );
  }
}
