
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
    final List<Map<String, dynamic>> mapsType = await db.query('CombustivelType');

    return List.generate(maps.length, (i) {
      return AbastecimentoModel(
        id: maps[i]['id'],
        idCarro: maps[i]['idCarro'],
        data: maps[i]['data'],
        combustivelType: maps[i]['combustivelType'],
        combustivel: mapsType[maps[i]['type']]['name'],
        quantidadeLitros: maps[i]['quantidadeLitros'],
        preco: maps[i]['preco'],
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
        db.execute(
            """CREATE TABLE IF NOT EXISTS CombustivelType (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          );"""
        );

        db.insert(
          'GasType',
          {'name': 'Gasolina'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        db.insert(
          'GasType',
          {'name': 'Alcool'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        db.insert(
          'GasType',
          {'name': 'Diesel'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        return db.execute(
          """CREATE TABLE IF NOT EXISTS Abastecimento (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            idCarro INTEGER NOT NULL,
            data DATE NOT NULL,
            combustivelType INTEGER NOT NULL,
            quantidadeLitros INTEGER NOT NULL,
            preco INTEGER NOT NULL
            FOREIGN KEY(combustivelType) REFERENCES CombustivelType(id)
          );"""
        );
      },
      version: 1,
    );
  }
}