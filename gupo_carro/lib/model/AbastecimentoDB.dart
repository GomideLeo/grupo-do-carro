import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import 'package:gupo_carro/model/AbastecimentoModel.dart';
import 'package:gupo_carro/model/TypeModel.dart';

class AbastecimentoDB {
  // Get a reference to the database.
  final abastecimentoDB = DBOpener.getDatabase();

  Future<void> insertAbastecimento(AbastecimentoModel abastecimento) async {
    final db = await abastecimentoDB;

    await db.insert(
      'Abastecimento',
      abastecimento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AbastecimentoModel>> abastecimentos() async {
    final db = await abastecimentoDB;

    final List<Map<String, dynamic>> maps = await db.query('Abastecimento');
    final List<Map<String, dynamic>> mapsType =
        await db.query('CombustivelType');

    return List.generate(maps.length, (i) {
      return AbastecimentoModel(
        id: maps[i]['id'],
        idCarro: maps[i]['idCarro'],
        data: maps[i]['data'],
        combustivelType: maps[i]['combustivelType'],
        combustivel: mapsType[maps[i]['type']]['name'],
        quantidadeLitros: maps[i]['quantidadeLitros']/100.0,
        preco: maps[i]['preco']/100.0,
        odometro: maps[i]['odometro'],
      );
    });
  }

  Future<List<TypeModel>> combustivelTypes() async {
    final db = await abastecimentoDB;

    final List<Map<String, dynamic>> maps = await db.query('CombustivelType');

    return List.generate(maps.length, (i) {
      return TypeModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }
}

class DBOpener {
  static Future<Database> getDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'MeusCarros.db'),
      // When the database is first created, create a table.
      onCreate: (db, version) {
        db.execute("""CREATE TABLE CombustivelType (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          );""");

        db.insert(
          'CombustivelType',
          {'name': 'Gasolina'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        db.insert(
          'CombustivelType',
          {'name': 'Alcool'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        db.insert(
          'CombustivelType',
          {'name': 'Diesel'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        return db.execute("""CREATE TABLE Abastecimento (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            idCarro TEXT NOT NULL,
            data TEXT NOT NULL,
            combustivelType INTEGER NOT NULL,
            quantidadeLitros INTEGER NOT NULL,
            preco REAL NOT NULL,
            odometro INTEGER NOT NULL
            FOREIGN KEY(combustivelType) REFERENCES CombustivelType(id)
          );""");
      },
      version: 6,
    );
  }
}
