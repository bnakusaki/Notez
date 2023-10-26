import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';

class NoteBloc {
  NoteBloc(
    this._createNote,
    this._readNote,
    this._updateNote,
    this._deleteNote,
  );

  final CreateNote _createNote;
  final ReadNote _readNote;
  final UpdateNote _updateNote;
  final DeleteNote _deleteNote;

  Future<Either<Exception, int>> createNote() async => await _createNote();
  Future<Either<Exception, Note>> readNote(int id) async => await _readNote(id);
  Future<Either<Exception, int>> updateNote(Note note) async => await _updateNote(note);
  Future<Either<Exception, int>> deleteNote(int id) async => await _deleteNote(id);
}
