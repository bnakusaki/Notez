import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/get_notes.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';

class NoteBloc {
  NoteBloc(
    this._createNote,
    this._readNote,
    this._updateNote,
    this._deleteNote,
    this._getNotes,
  );

  final CreateNote _createNote;
  final ReadNote _readNote;
  final UpdateNote _updateNote;
  final DeleteNote _deleteNote;
  final GetNotes _getNotes;

  Future<Either<Exception, bool>> createNote() async => await _createNote();
  Future<Note> readNote(String id) async {
    final response = await _readNote(id);
    return response.fold((l) {
      throw '';
    }, (r) => r);
  }

  Future<void> updateNote(Note note) async => await _updateNote(note);
  Future<Either<Exception, int>> deleteNote(int id) async => await _deleteNote(id);
  Future<List<Note>> getNotes() async => await _getNotes();
}
