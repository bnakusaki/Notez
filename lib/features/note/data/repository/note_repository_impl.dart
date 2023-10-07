import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this.localDatabase);

  final LocalDatabase localDatabase;
  @override
  Future<int> createNote() async {
    return await localDatabase.createNote();
  }

  @override
  Future<Note> readNote(int id) async {
    final response = await localDatabase.readNote(id);
    return response.toNote();
  }
}
