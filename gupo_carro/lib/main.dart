import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/CadastroVeiculo.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:gupo_carro/views/HomePage.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int selected = 0;
  List<CarModel> carList = List<CarModel>.empty();

  _get() async {
    var res = 'Resposta do back end';//await http.get('request URL');
    // tratamento dados back end
    // seta dados para serem utilizados
    setState(() => selected = 0);
    setState(() => carList = List<CarModel>.empty());
  }

  @override
  void initState() {
    super.initState();
    _get();
  }

  @override
  Widget build(BuildContext context) {
    return AppData(
      selected: -1,
      carList: List<CarModel>.empty(),
      child: const IntermediateApp(),
    );
  }
}

class IntermediateApp extends StatelessWidget {
  const IntermediateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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