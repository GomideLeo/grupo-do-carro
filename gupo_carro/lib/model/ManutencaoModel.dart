import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class ManutencaoModel {
  int id;
  int idCarro;
  int type;
  String typeName;
  DateTime data;
  int preco;
  int odometro;
  DateTime dataProximo;
  int odometroProximo;

  ManutencaoModel({
    required this.id,
    required this.idCarro,
    required this.type,
    required this.typeName,
    required this.data,
    this.preco,
    this.odometro,
    this.dataProximo,
    this.odometroProximo
  });

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'MeusCarros.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      await db.execute(
        """CREATE TABLE ManutencaoType {
          INT id NOT NULL PRIMARY KEY AUTOINCREMENT,
          CHAR(255) name NOT NULL
        };"""
      );

      db.insert(
        'ManutencaoType',
        {'name': 'Troca de Oleo'},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      db.insert(
        'ManutencaoType',
        {'name': 'Agua do radiador'},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // Run the CREATE TABLE statement on the database.
      return db.execute(
        """CREATE TABLE Manutencao {
          INT id NOT NULL PRIMARY KEY AUTOINCREMENT,
          INT idCarro NOT NULL,
          DATE data NOT NULL,
          INT manType NOT NULL,
          INT odometro,
          INT preco,
          DATE dataProximo,
          INT odometroProximo,
          FOREIGN KEY(manType) REFERENCES ManutencaoType(id)
        };"""
      );
    },
    version: 1,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCarro': idCarro,
      'type': type,
      'data': data,
      'preco': preco,
      'odometro': odometro,
      'dataProximo': dataProximo,
      'odometroProximo': odometroProximo,
    };
  }

  Future<void> insertManutencao(ManutencaoModel manutencao) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'Manutencao',
      manutencao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> manutencoes() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('Manutencao');
    final List<Map<String, dynamic>> mapsType = await db.query('ManutencaoType');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Manutencao(
        id: maps[i]['id'],
        idCarro: maps[i]['idCarro'],
        type: maps[i]['type'],
        typeName: mapsType[maps[i]['type']]['name'],
        data: maps[i]['data'],
        preco: maps[i]['preco'],
        odometro: maps[i]['odometro'],
        dataProximo: maps[i]['dataProximo'],
        odometroProximo: maps[i]['odometroProximo'],
      );
    });
  }

  Future<void> updateManutencao(ManutencaoModel manutencao) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'Manutencao',
      manutencao.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [manutencao.id],
    );
  }
}