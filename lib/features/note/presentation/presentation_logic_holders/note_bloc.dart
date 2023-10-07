import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';

class NoteBloc {
  NoteBloc(this.createNote, this.readNote);

  final CreateNote createNote;
  final ReadNote readNote;

  Future<int> create() async => await createNote();
  Future<Note> read(int id) async => await readNote(id);
}
