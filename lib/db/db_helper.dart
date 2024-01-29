import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const _dbPath = "notes_db.db";
  static late String _dir;
  static Database? _db;

  static Future<void> initDb() async {
    _dir = await getDatabasesPath();
    _db = await openDatabase("$_dir/$_dbPath",
      onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE Notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT 
          );
        """);
      },
      version: 1
    );
  }

  static Database getDb() {
    if(_db == null) {
      throw Error();
    }
    return _db!;
  }
}