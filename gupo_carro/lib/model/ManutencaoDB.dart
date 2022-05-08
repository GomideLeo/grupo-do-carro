
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import 'package:gupo_carro/model/ManutencaoModel.dart';
import 'package:gupo_carro/model/TypeModel.dart';

class ManutencaoDB {
  // Get a reference to the database.
  final manutencaoDB = DBOpener.getDatabase();

  Future<void> insertManutencao(ManutencaoModel manutencao) async {
    final db = await manutencaoDB;

    await db.insert(
      'Manutencao',
      manutencao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertManutencaoType(TypeModel manutencaoTM) async {
    final db = await manutencaoDB;

    await db.insert(
      'ManutencaoType',
      manutencaoTM.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ManutencaoModel>> manutencoes() async {
    final db = await manutencaoDB;

    final List<Map<String, dynamic>> maps = await db.query('Manutencao');
    final List<Map<String, dynamic>> mapsType = await db.query('ManutencaoType');

    return List.generate(maps.length, (i) {
      return ManutencaoModel(
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

  Future<List<TypeModel>> manutencaoTypes() async {
    final db = await manutencaoDB;

    final List<Map<String, dynamic>> maps = await db.query('ManutencaoType');

    return List.generate(maps.length, (i) {
      return TypeModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> updateManutencao(ManutencaoModel manutencao) async {
    final db = await manutencaoDB;

    await db.update(
      'Manutencao',
      manutencao.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Prevent SQL injection.
      whereArgs: [manutencao.id],
    );
  }

  Future<void> updateManutencaoType(TypeModel mtm) async {
    final db = await manutencaoDB;

    await db.update(
      'ManutencaoType',
      mtm.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Prevent SQL injection.
      whereArgs: [mtm.id],
    );
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
            """CREATE TABLE IF NOT EXISTS ManutencaoType (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          );"""
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
            """CREATE TABLE IF NOT EXISTS Manutencao (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            idCarro INTEGER NOT NULL,
            data DATE NOT NULL,
            manType INTEGER NOT NULL,
            odometro INTEGER,
            preco INTEGER,
            dataProximo DATE,
            odometroProximo INTEGER,
            FOREIGN KEY(manType) REFERENCES ManutencaoType(id)
          );"""
        );
      },
      version: 1,
    );
  }
}