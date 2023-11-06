import 'package:dartz/dartz.dart';
import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

/// The implementation of the [NoteRepository] interface.
class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this.localDatabase);
  final LocalDatabase localDatabase;

  @override
  Future<Either<Exception, int>> createNote() async => await localDatabase.createNote();

  @override
  Future<Either<Exception, Note>> readNote(int id) async => await localDatabase.readNote(id);

  @override
  Future<Either<Exception, int>> updateNote(Note note) async {
    final noteModel = NoteModel.fromNote(note);
    final response = await localDatabase.updateNote(noteModel);
    return response;
  }

  @override
  Future<Either<Exception, int>> deleteNote(int id) async => await localDatabase.deleteNote(id);

  @override
  Future<Either<Exception, List<Note>>> getNotes() async => await localDatabase.getNotes();
}
