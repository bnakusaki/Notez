import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<int> createNote() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'notez'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdOn TEXT, lastUpdated TEXT, kind TEXT, todo TEXT, folder INTEGER, location TEXT)');
      },
      version: 1,
    );

    final db = await database;

    // Inserting note.
    db.insert(
      'notes',
      NoteModel.newNote().toJson(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );

    // Query.
    final response = await db.query(
      'notes',
      columns: ['id'],
      orderBy: 'id DESC',
      limit: 1,
    );
    return response[0]['id'] as int;
  }
}
