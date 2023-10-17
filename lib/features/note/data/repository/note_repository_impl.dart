import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

/// The implementation of the [NoteRepository] interface.
class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this.localDatabase);
  final LocalDatabase localDatabase;

  @override
  Future<int?>? createNote() async => await localDatabase.createNote();

  @override
  Future<Note?>? readNote(int id) async => await localDatabase.readNote(id);

  @override
  Future<int?>? updateNote(Note note) async {
    final noteModel = NoteModel.fromNote(note);
    final response = await localDatabase.updateNote(noteModel);
    return response;
  }

  @override
  Future<int?>? deleteNote(int id) async => await localDatabase.deleteNote(id);
}
