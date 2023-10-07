import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/main.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<int> createNote() async {
    database.insert(
      'notes',
      NoteModel.newNote().toJson(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );

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

  @override
  Future<int> updateNote(NoteModel noteModel) async {
    final response =
        await database.update('notes', noteModel.toJson(), where: 'id = ${noteModel.id}');
    return response;
  }

  @override
  Future<int> deleteNote(int id) async {
    final response = await database.delete('notes', where: 'id = $id');
    return response;
  }
}
