import 'package:notez/features/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<int> createNote();
  Future<Note> readNote(int id);
}
