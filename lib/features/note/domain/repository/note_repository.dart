import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/repository/note_repository_Impl.dart';
import 'package:notez/features/note/domain/entities/note.dart';

/// An interface representing [NoteRepositoryImpl].
abstract class NoteRepository {
  /// Creates a new note object in the [LocalDatabase].
  ///
  /// [Note] created has required fields filled with default values.
  /// To set new values, use [updateNote].
  Future<int?>? createNote();

  /// Reads a note from the [LocalDatabase].
  ///
  /// Takes the id of a [Note] and returns all info about the note.
  Future<Note?>? readNote(int id);

  /// Updates a [Note].
  Future<int?>? updateNote(Note note);

  /// Deletes a [Note] from the database.
  Future<int?>? deleteNote(int id);
}
