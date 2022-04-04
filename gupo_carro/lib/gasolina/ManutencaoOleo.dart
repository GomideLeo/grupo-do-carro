import 'package:flutter/material.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body:const InfoOLeo(),
      ),
    );
  }
}


List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Manutencao 1"),value: "Manutencao 1"),
    DropdownMenuItem(child: Text("Manutencao 2"),value: "Manutencao 2"),
    DropdownMenuItem(child: Text("Manutencao 3"),value: "Manutencao 3"),
    DropdownMenuItem(child: Text("Manutencao 4"),value: "Manutencao 4"),
  ];
  return menuItems;
}

String selectedValue = "Manutencao 1";

class InfoOLeo extends StatelessWidget {
  const InfoOLeo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('\n\n\n\r\r\rTipo de manutencao',
        style: TextStyle(fontSize: 18, color: Colors.black38),),

        Padding(padding: EdgeInsets.fromLTRB(10, 3, 5, 10),
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white54,
              ),
              dropdownColor: Colors.white,
              value: selectedValue,
              onChanged: (String? newValue) {
              },
              items: dropdownItems)
          ),
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tempo',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Distancia',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
          child:  TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.greenAccent),
            child: Text(
              'Confirmar',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}