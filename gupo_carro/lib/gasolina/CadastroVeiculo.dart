import 'package:flutter/material.dart';
class CadastroVeiculo extends StatefulWidget {
  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {
  TextEditingController _textEditingController = TextEditingController(); //instanciar o objeto para controlar o campo de texto
  bool _gasolina = false;
  bool _alcool = false;
  bool _diesel = false;

  // Initial Selected Value
  String dropdownvalue = 'Selecione o veículo';

  // List of items in our dropdown menu
  var items = [
    'Selecione o veículo',
    'Fiat Palio',
    'Fiat Uno',
    'Fiat Strada',
    'Fiat Touro',
    'Fiat Argos',
    'Fiat Mobi',
    'Chevrolet Onix',
    'Chevrolet Cruze',
    'Chevrolet Prisma',
    'Chevrolet Celta',
    'Chevrolet Corsa',
    'Chevrolet Astra',
    'Volkswagen Gol',
    'Volkswagen Voyage',
    'Volkswagen Fox',
    'Volkswagen Jetta',
    'Volkswagen Polo',
    'Volkswagen Saveiro',
    'Ford Ka',
    'Ford EcoSport',
    'Ford Edge',
    'Ford Focus',
    'Toyota Corolla',
    'Toyota Etios',
    'Toyota Hilux',
    'Honda City',
    'Honda Fit',
    'Honda Civic',
    'Hyundai HB20',
    'Hyundai Creta',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Veículo"),
      ),
      body: Column(
        children: <Widget>[
          DropdownButton(

            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            },
          ),


          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: "Quantidade de Km/L: "
              ),
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
              controller: _textEditingController, //controlador do nosso campo de texto
            ),
          ),


          Text(
            'Combustíveis Aceitos',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                        ),
          CheckboxListTile(
              title: Text("Gasolina"),

              value: _gasolina,
              onChanged: (bool valor){
                setState(() {
                  _gasolina = valor;
                });
              }
          ),
          CheckboxListTile(
              title: Text("Alcool"),

              value: _alcool,
              onChanged: (bool valor){
                setState(() {
                  _alcool = valor;
                });
              }
          ),
          CheckboxListTile(
              title: Text("Diesel"),

              value: _diesel,
              onChanged: (bool valor){
                setState(() {
                  _diesel = valor;
                });
              }
          ),

          ElevatedButton(
            child: Text("Adicionar"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: (){
              print("Texto digitado: " + _textEditingController.text);
              " Gasolina: " +_gasolina.toString() +
                  " Alcool: " +_alcool.toString() +
                  " Diesel: " +_diesel.toString();
            },
          ),
        ],
      ),
    );
  }
}

//
// class EntradaCheckBox extends StatefulWidget {
//   @override
//   _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
// }
//
// class _EntradaCheckBoxState extends State<EntradaCheckBox> {
//   bool _gasolina = false;
//   bool _alcool = false;
//   bool _diesel = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cadastro de veículo:"),
//       ),
//       body: Container(
//         child: Row(
//           children: <Widget>[
//             CheckboxListTile(
//                 title: Text("Gasolina"),
//
//                 value: _gasolina,
//                 onChanged: (bool valor){
//                   setState(() {
//                     _gasolina = valor;
//                   });
//                 }
//             ),
//             CheckboxListTile(
//                 title: Text("Alcool"),
//
//                 value: _alcool,
//                 onChanged: (bool valor){
//                   setState(() {
//                     _alcool = valor;
//                   });
//                 }
//             ),
//             CheckboxListTile(
//                 title: Text("Diesel"),
//
//                 value: _diesel,
//                 onChanged: (bool valor){
//                   setState(() {
//                     _diesel = valor;
//                   });
//                 }
//             ),
//             ElevatedButton(
//                 child: Text("Salvar"),
//                 onPressed: (){
//                   print(
//                       " Gasolina: " +_gasolina.toString() +
//                           " Alcool: " +_alcool.toString() +
//                           " Diesel: " +_diesel.toString()
//                   );
//                 }
//             ),
//
//           ],
//         ),
//
//       ),
//     );
//   }
// }
