import 'package:flutter/material.dart';
import 'package:gupo_carro/gasolina/postosPerto.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/oleo/MaintLista.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/SelecionarCarro.dart';
import 'package:gupo_carro/shared/SelecionarServico.dart';
import '../model/CarModel.dart';

class CarView extends StatefulWidget {
  CarModel car;

  CarView(this.car);

  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  int _indiceAtual = 0;
  List<Widget> _telas = [];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppData appData = AppData.of(context);

    _telas = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarData(widget.car),
            Text("Abastecer Carro:"),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostosPerto(
                          car: widget.car,
                          gasTypes: widget.car.gasStats
                                  ?.map((e) => e.gasType)
                                  .toList() ??
                              [])),
                  );
                },
                child: Text("Descobrir postos Perto"))
          ],
        ),
      ),
      SelecionarServico(),
      MaintLista()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.nickname),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Estatísticas',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notificações',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Manutenção',
              backgroundColor: Colors.blue)
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
