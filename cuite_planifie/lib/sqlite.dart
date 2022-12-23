import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:cuite_planifie/models/party.dart';

class Sqlite {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE partys(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        lifts TEXT NOT NULL,
        participants TEXT NOT NULL,
        titre TEXT NOT NULL
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'cuitePlanifie.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //Insert
  static Future<int> createParty(String titre, String lifts, String participants, String date ) async {
    final db = await Sqlite.db();

    final data = {'titre': titre, 'lifts': lifts, 'participants': participants, 'date': date};
    final id = await db.insert('partys', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //Select all
  static Future<List<Party>> getPartys() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM partys ORDER BY date DESC");

    return List.generate(maps.length, (i) {
      return Party(
          id: maps[i]['id'],
          titre: maps[i]['titre'],
          date: DateTime.parse(maps[i]['date']),
          lifts: maps[i]['lifts'],
          participants: maps[i]['participants']
      );
    });
  }

  //Update
  static Future<int> updateParty( int id, String titre, String lifts, String participants, String date ) async {
    final db = await Sqlite.db();

    final data = {'titre': titre, 'lifts': lifts, 'participants': participants, 'date': date};

    final result =
    await db.update('partys', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  //Delete
  static Future<void> deleteParty(int id) async {
    final db = await Sqlite.db();
    try {
      await db.delete("partys", where: 'id=?', whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}