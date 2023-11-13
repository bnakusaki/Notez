import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Exception, bool>> createNote();
  Future<Either<Exception, Note>> readNote(String id);
  Future<void> updateNote(Note note);
  Future<Either<Exception, int>> deleteNote(int id);
  Future<List<Note>> getNotes();
}
