import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

/// A use case for updating a note.
class UpdateNote {
  UpdateNote(this.repository);
  final NoteRepository repository;

  Future<int?>? call(Note note) async => await repository.updateNote(note);
}
