import 'package:notez/features/note/data/models/note_model.dart';

/// Interface for the [LocalDatabaseImpl]
abstract class LocalDatabase {
  /// Creates a new note in the local database.
  Future<int?>? createNote();

  /// Reads a note from the local database.
  Future<NoteModel?>? readNote(int id);

  /// Stores a new update of a note in the local database.
  Future<int?>? updateNote(NoteModel noteModel);

  /// Deletes a note from the local database.
  Future<int?>? deleteNote(int id);
}
