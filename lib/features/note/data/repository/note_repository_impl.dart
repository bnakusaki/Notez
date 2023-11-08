import 'package:dartz/dartz.dart';
import 'package:notez/features/note/data/databases/local_database.dart';
import 'package:notez/features/note/data/databases/remote_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

/// The implementation of the [NoteRepository] interface.
class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(
    this.localDatabase,
    this.remoteDatabase,
  );
  final LocalDatabase localDatabase;
  final RemoteDatabase remoteDatabase;

  @override
  Future<Either<Exception, void>> createNote() async => await remoteDatabase.createNote();

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
  Future<List<NoteModel>> getNotes() => remoteDatabase.getNotes();
}
