import 'package:flutter/material.dart';


class InfoOleo extends StatefulWidget{
  const InfoOleo({Key? key}) : super(key: key);

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

  @override
  State<StatefulWidget> createState() {

    throw UnimplementedError();
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
        Text('\n\n\n\n\n\n\n\n\n\r\r\rTipo de manutencao',
          style: TextStyle(fontSize: 18, color: Colors.black38),),

        Padding(padding: EdgeInsets.fromLTRB(10, 4, 5, 10),
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
                backgroundColor: Colors.lightBlueAccent,
                elevation: 8,
                shadowColor: Colors.white12),
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
