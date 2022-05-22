import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/ManutencaoDB.dart';
import 'package:gupo_carro/model/ManutencaoModel.dart';

class MaintLista extends StatefulWidget{
  CarModel car;

  MaintLista(this.car);

  @override
  MaintListaState createState() => MaintListaState();
}

class MaintListaState extends State<MaintLista>{

  List<ManutencaoModel> items = [];
  ManutencaoDB mdb = ManutencaoDB();


  //Gera itens para preencher a lista. Será removido no futuro.
  Future<void> insertItems() async{

    for(int i=0; i<=50; i++){
      int id = -1;
      String idCarro = widget.car.id;
      int type = 1;
      DateTime data = DateTime.now();
      int preco = 12000;
      int odometro = Random().nextInt(1000000);
      DateTime dataProx = DateTime.now();
      int odometroProx = odometro + 50000;

      ManutencaoModel item = ManutencaoModel(
          id: id,
          idCarro: idCarro,
          type: type,
          typeName: "Troca de óleo",
          data: data,
          preco: preco,
          odometro: odometro,
          dataProximo: dataProx,
          odometroProximo: odometroProx);
      await mdb.insertManutencao(item);
    }
  }

  void loadItems() async{
    await insertItems();
    List<ManutencaoModel> _items = await mdb.manutencoesCarro(widget.car.id);
    setState((){
      items  = _items;
    });
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }


  //Constrói o Widget de lista de manutenção
  @override
  Widget build(BuildContext context){
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
                Text(items[index].typeName),
                Text(items[index].odometro.toString())
                ]
            ),
            subtitle: Text(items[index].preco.toString()),
            );
          },
          separatorBuilder: (context, index) => const Divider()
        ),
      ),
    );
  }
}