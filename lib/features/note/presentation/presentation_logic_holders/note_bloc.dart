import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';

class NoteBloc {
  NoteBloc(
    this.createNote,
    this.readNote,
    this.updateNote,
    this.deleteNote,
  );

  final CreateNote createNote;
  final ReadNote readNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  Future<int?>? create() async => await createNote();
  Future<Note?>? read(int id) async => await readNote(id);
  Future<int?>? update(Note note) async => await updateNote(note);
  Future<int?>? delete(int id) async => await deleteNote(id);
}
