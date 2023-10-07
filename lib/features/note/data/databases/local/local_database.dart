import 'package:notez/features/note/data/models/note_model.dart';

abstract class LocalDatabase {
  Future<int> createNote();
  Future<NoteModel> readNote(int id);
  Future<int> updateNote(NoteModel noteModel);
  Future<int> deleteNote(int id);
}
