import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:assignment_14_1/Models/Quotes.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper db = DBHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await iniDB();
      return _database;
    }
  }

  iniDB() async {
    Directory directory = await getExternalStorageDirectory();
    String path = join(directory.path, 'ProductDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 2,
      onUpgrade: _onUpgrade,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE IF NOT EXISTS Quote ("
          "id INTEGER PRIMARY KEY,"
          "category TEXT,"
          "shortName TEXT);",
        );
      },
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE Quote ADD COLUMN shortName TEXT;");
    }
  }

  Future<List<Quote>> getQuote() async {
    final db = await database;

    List<Map> result = await db.query("Quote");

    return result.map((record) => Quote.fromMap(record)).toList();
  }

  Future<Quote> getQuoteById(int id) async {
    final db = await database;

    var res = await db.query("Quote", where: "id = ?", whereArgs: [id]);

    return res.isNotEmpty ? Quote.fromMap(res.first) : Null;
  }

  Future insertQuote(Quote data) async {
    final db = await database;

    var result = await db.rawInsert(
        "INSERT INTO Quote(category,quotes,shortName) VALUES(?,?,?)",
        [data.category, data.quotes, data.shortName]);

    return result;
  }

  updateQuote(Quote data, int oldId) async {
    final db = await database;

    var res = await db
        .update('Quote', data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return res;
  }

  deleteQuote(int id) async {
    final db = await database;
    db.delete('Quote', where: 'id = ?', whereArgs: [id]);
  }
}
