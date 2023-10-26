import 'package:dartz/dartz.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/shared/database.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future<Either<Exception, int>> createNote();
  Future<Either<Exception, NoteModel>> readNote(int id);
  Future<Either<Exception, int>> updateNote(NoteModel noteModel);
  Future<Either<Exception, int>> deleteNote(int id);
}

class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<Either<Exception, int>> createNote() async {
    try {
      final database = await NotezDatabase.database();
      final response = await database.insert(
        'notes',
        NoteModel.newNote().toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, NoteModel>> readNote(int id) async {
    try {
      final database = await NotezDatabase.database();
      final response = await database.query(
        'notes',
        where: 'id = $id',
      );
      final fResponse = NoteModel.fromJson(response[0]);
      return Right(fResponse);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> updateNote(NoteModel noteModel) async {
    try {
      final database = await NotezDatabase.database();
      final response = await database.update(
        'notes',
        noteModel.toJson(),
        where: 'id = ${noteModel.id}',
      );
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> deleteNote(int id) async {
    try {
      final database = await NotezDatabase.database();

      final response = await database.delete('notes', where: 'id = $id');
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
