import 'package:flutter/material.dart';

class SelecionarServico extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = [
    'Óleo',
    'Gasolina',
    'Álcool',
    'Óleo',
    'Óleo',
  ];

  SelecionarServico({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'XXX 9999'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOpcoes = [
      'Óleo',
      'Gasolina',
      'Álcool',
      'Óleo',
      'Óleo',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: dropValue,
        builder: (BuildContext context, String value, _) {
          return DropdownButton(
            hint: const Text('Escolha a opção desejada'),
            value: (value.isEmpty) ? null : value,
            onChanged: (escolha) => dropValue.value = escolha.toString(),
            items: dropOpcoes
                .map(
                  (op) => DropdownMenuItem(
                    value: op,
                    child: Text(op),
                  ),
                )
                .toList(),
          );
        },
      )),
      bottomNavigationBar: BottomNavigationBar(
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
}
