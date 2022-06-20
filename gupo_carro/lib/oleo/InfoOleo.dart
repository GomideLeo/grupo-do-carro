import 'package:flutter/material.dart';
import 'package:gupo_carro/model/ManutencaoDB.dart';
import 'package:gupo_carro/model/TypeModel.dart';

//import 'package:gupo_carro/model/ManutencaoDB.dart';
//import 'package:gupo_carro/model/ManutencaoModel.dart';
//import 'package:gupo_carro/model/ManutencaoTypeModel.dart';

class InfoOleo extends StatefulWidget {
  const InfoOleo({Key? key}) : super(key: key);

  @override
  _InfoOleoState createState() => _InfoOleoState();
}

class _InfoOleoState extends State<InfoOleo> {
  List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(child: Text('LOADING'), value: '-1')
  ];
  String selectedValue = "-1";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // READ FROM MANUTENCAO TYPE
    ManutencaoDB mdb = ManutencaoDB();
    List<TypeModel> lmtm = await mdb.manutencaoTypes();

    if (lmtm.length > 1) {
      List<DropdownMenuItem<String>> menuItems =
          List.generate(lmtm.length, (i) {
        return DropdownMenuItem(
            child: Text(lmtm[i].name), value: lmtm[i].id.toString());
      });

      setState(() {
        dropdownItems = menuItems;
        selectedValue = '1';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "\r\r\rTipo de manutencao",
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
            keyboardType: TextInputType.datetime,
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
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 50),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 8, 145, 208),
                elevation: 8,
                shadowColor: Colors.white12),
            child: const Text(
              'Confirmar',
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            onPressed: () {
              // open database
              //final DAO = ManutencaoDB();
              // get data

              // add data
              //DAO.insertManutencao(ManutencaoModel(
              //    id: -1, // placeholder for adding
              //    idCarro: idCarro,
              //    type: type,
              //    typeName: "", // placeholder for adding
              //    data: data,
              //    odometro: odometro,
              //    dataProximo: dataProximo,
              //    odometroProximo: odometroProximo,
              //)
              //);
            },
          ),
        )
      ],
    );
  }
}
