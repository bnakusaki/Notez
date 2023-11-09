import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class UpdateNote {
  UpdateNote(this.repository);
  final NoteRepository repository;

  Future<void> call(Note note) async => await repository.updateNote(note);
}
