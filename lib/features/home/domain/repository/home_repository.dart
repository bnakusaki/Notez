import 'package:notez/features/note/domain/entities/note.dart';

abstract class HomeRepository {
  /// Fetches all available notes from [LocalDatabase]
  Future<List<Note>?> getNotes();
}
