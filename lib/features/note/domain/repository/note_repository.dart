import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Exception, void>> createNote();
  Future<Either<Exception, Note>> readNote(int id);
  Future<Either<Exception, int>> updateNote(Note note);
  Future<Either<Exception, int>> deleteNote(int id);
  Future<List<Note>> getNotes();
}
