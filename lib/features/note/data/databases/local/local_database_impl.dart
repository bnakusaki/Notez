import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/main.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<int> createNote() async {
    // Inserting note.
    database.insert(
      'notes',
      NoteModel.newNote().toJson(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );

    // Query.
    final response = await database.query(
      'notes',
      columns: ['id'],
      orderBy: 'id DESC',
      limit: 1,
    );
    return response[0]['id'] as int;
  }

  @override
  Future<NoteModel> readNote(int id) async {
    final response = await database.query(
      'notes',
      where: 'id = $id',
    );

    return NoteModel.fromJson(response[0]);
  }
}
