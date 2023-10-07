import 'package:notez/features/note/domain/use_cases/create_note.dart';

class NoteBloc {
  NoteBloc(
    this.createNote,
  );

  final CreateNote createNote;

  Future<int> create() async => await createNote();
}
