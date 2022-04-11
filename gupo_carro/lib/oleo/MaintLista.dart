import 'dart:math';

import 'package:flutter/material.dart';

class MaintLista extends StatefulWidget{
  @override
  MaintListaState createState() => MaintListaState();
}

class MaintListaState extends State<MaintLista>{

  List items = [];

  //Gera itens para preencher a lista. Será removido no futuro.
  void loadItems(){
    items = [];
    for(int i=0; i<=50; i++){
      Map<String, dynamic> item = Map();
      item["MaintType"] = "Troca de óleo";
      item["Odometer"]=Random().nextInt(100000).toString()+" KM";
      item["Description"] = "Descrição da troca de óleo no. ${i}";
      items.add(item);
    }
  }

  //Constrói o Widget de lista de manutenção
  @override
  Widget build(BuildContext context){
    loadItems();
    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index){
          return ListTile(
            //color: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Text(items[index]["MaintType"]),
                Text(items[index]["Odometer"])
                ]
            ),
            subtitle: Text(items[index]["Description"]),
            );
          },
          separatorBuilder: (context, index) => const Divider()
        ),
      ),
    );
  }
}