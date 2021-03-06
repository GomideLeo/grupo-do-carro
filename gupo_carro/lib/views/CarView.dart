import 'package:flutter/material.dart';
import 'package:gupo_carro/gasolina/postosPerto.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/oleo/MaintLista.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/shared/AppData.dart';
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
    _telas = [
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarData(widget.car),
              const Text(
                "Abastecer Carro:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostosPerto(
                        car: widget.car,
                        gasTypes: widget.car.gasStats
                                ?.map((e) => e.gasType)
                                .toList() ??
                            [],
                      ),
                    ),
                  );
                },
                child: const Text("Descobrir postos perto"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 40),
                ),
              )
            ],
          ),
        ),
      ),
      SelecionarServico(widget.car),
      MaintLista(widget.car)
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
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Estat??sticas',
              backgroundColor: Colors.blue),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Manuten????o',
              backgroundColor: Colors.blue),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifica????es',
              backgroundColor: Colors.blue),
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
