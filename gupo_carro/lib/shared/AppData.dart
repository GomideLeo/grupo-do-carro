
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/model/GasStatsModel.dart';
import 'package:gupo_carro/model/OdometerModel.dart';
// import 'package:gupo_carro/views/HomePage.dart';

class AppData extends InheritedWidget {
   int selected = 0;
  final List<CarModel> carList = [CarModel(
      id: 1,
      nickname: "teste01",
      photo: "https://source.unsplash.com/collection/31212027",
      plate: "ABC1234",
      odometer: OdometerModel(value: 50000),
      gasStats: [
        GasStatsModel(gasType: "Gasolina", rate: 10),
        GasStatsModel(gasType: "Etanol", rate: 8.5)
      ]),
      CarModel(
        id: 2,
        nickname: "teste02",
        photo: "https://source.unsplash.com/collection/31212027",
        plate: "DEF5678",
        odometer: OdometerModel(value: 32600),
        gasStats: [
          GasStatsModel(gasType: "Gasolina", rate: 9),
          GasStatsModel(gasType: "Etanol", rate: 7.8)
      ]),
      CarModel(
        id: 3,
        nickname: "teste03",
        photo: "https://source.unsplash.com/collection/31212027",
        plate: "GHI3456",
        odometer: OdometerModel(value: 22500),
        gasStats: [
          GasStatsModel(gasType: "Gasolina", rate: 12),
          GasStatsModel(gasType: "Etanol", rate: 9)
      ]),
  ];

  AppData({
    Key? key,
    required child,
    required selected,
    required carList,
  }) : super(key: key, child: child);

  void chooseCar(int selection) {
    if (selection < 0 || selection >= carList.length) {
      selected = selection;
    }
  }

  static AppData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppData>()!;
  }

  @override
  bool updateShouldNotify(AppData oldWidget) {
    if (carList.length != oldWidget.carList.length) return true;
    for (int i = 0 ; i < carList.length; i++) {
      if (carList[i] != oldWidget.carList[i]) return true;
    }
    return selected != oldWidget.selected;
  }
}

// class App extends StatefulWidget {
//   @override
//   AppState createState() => AppState();
// }
//
// class AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return const AppData(
//       child: IntermediateApp(),
//     );
//   }
// }
//
// class IntermediateApp extends StatelessWidget {
//   const IntermediateApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final AppData? appData = AppData.of(context);
//     return Scaffold(
//         body: HomePage()
//     );
//   }
// }