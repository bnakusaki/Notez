import 'package:notez/features/note/domain/repository/note_repository.dart';

/// A use case for deleting a note from the local database.
class DeleteNote {
  DeleteNote(this.repository);
  final NoteRepository repository;

  Future<int?>? call(int id) async {
    final response = await repository.deleteNote(id);
    return response;
  }
}
