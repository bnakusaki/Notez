import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

/// This creates a new table in the database created from [database].
///
/// id - Primary key, autoincremented, integer.
String get _query =>
    'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdOn TEXT, lastUpdated TEXT, kind TEXT, todo TEXT, folder INTEGER, location TEXT)';

/// Creates a new databasd for the entire app.
@riverpod
Future<Database> database(DatabaseRef ref) async {
  return await openDatabase(
    join(await getDatabasesPath(), 'notez'),
    onCreate: (db, version) {
      return db.execute(_query);
    },
    version: 1,
  );
}
