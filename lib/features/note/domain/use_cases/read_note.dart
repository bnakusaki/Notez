import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class ReadNote {
  ReadNote(this.repository);

  final NoteRepository repository;

  Future<Note> call(int id) async => await repository.readNote(id);
}
