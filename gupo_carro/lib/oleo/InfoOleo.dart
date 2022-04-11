import 'package:flutter/material.dart';

class InfoOleo extends StatefulWidget {
  const InfoOleo({Key? key}) : super(key: key);

  @override
  _InfoOleoState createState() => _InfoOleoState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Manutencao 1"), value: "Manutencao 1"),
    const DropdownMenuItem(
        child: const Text("Manutencao 2"), value: "Manutencao 2"),
    const DropdownMenuItem(
        child: const Text("Manutencao 3"), value: "Manutencao 3"),
    const DropdownMenuItem(child: Text("Manutencao 4"), value: "Manutencao 4"),
  ];
  return menuItems;
}

String selectedValue = "Manutencao 1";

class _InfoOleoState extends State<InfoOleo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Tipo de manutencao",
          style: const TextStyle(fontSize: 18, color: Colors.black38),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 5, 10),
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white54,
                ),
                dropdownColor: Colors.white,
                value: selectedValue,
                onChanged: (String? newValue) {},
                items: dropdownItems)),
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tempo',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Distancia',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                elevation: 8,
                shadowColor: Colors.white12),
            child: const Text(
              'Confirmar',
              style: const TextStyle(
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
