import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class GetNotes {
  GetNotes(this.repository);
  final NoteRepository repository;

  Future<List<Note>> call() => repository.getNotes();
}
