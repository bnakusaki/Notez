import 'package:notez/features/note/domain/entities/note.dart';

abstract class LocalDatabase {
  Future<List<Note>?> getNotes();
}
