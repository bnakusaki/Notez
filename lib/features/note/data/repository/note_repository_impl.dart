import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

/// The implementation of the [NoteRepository] interface.
class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this.localDatabase);
  final LocalDatabase localDatabase;

  /// Creates a new object in the local storage.
  @override
  Future<int?>? createNote() async {
    final response = await localDatabase.createNote();
    return response;
  }

  @override
  Future<Note?>? readNote(int id) async {
    final response = await localDatabase.readNote(id);
    return response;
  }

  @override
  Future<int?>? updateNote(Note note) async {
    final response = await localDatabase.updateNote(NoteModel.fromNote(note));
    return response;
  }

  @override
  Future<int?>? deleteNote(int id) async {
    final response = await localDatabase.deleteNote(id);
    return response;
  }
}
