import 'package:notez/features/home/data/database/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/main.dart';

class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<List<Note>?> getNotes() async {
    final response = (await database.query('notes'))
        .map(
          (json) => NoteModel.fromJson(json),
        )
        .toList();

    return response;
  }
}
