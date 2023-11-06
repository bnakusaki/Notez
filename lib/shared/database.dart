import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotezDatabase {
  static Database? _database;
  static Future<Database> database() async {
    if (_database != null) return Future.value(_database);
    String query =
        'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdOn TEXT, lastUpdated TEXT, kind TEXT, todo TEXT, folder INTEGER, location TEXT)';

    final response = await openDatabase(
      join(await getDatabasesPath(), 'notez'),
      onCreate: (db, version) {
        return db.execute(query);
      },
      version: 1,
    );
    _database = response;
    return response;
  }
}
