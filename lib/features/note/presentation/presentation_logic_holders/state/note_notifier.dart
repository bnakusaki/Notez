import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/state/note_state.dart';

class NoteNotifier extends StateNotifier<NoteState> {
  NoteNotifier(
    this.createNote,
    this.readNote,
    this.updateNote,
    this.deleteNote,
  ) : super(const NoteState.initial());

  final CreateNote createNote;
  final ReadNote readNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;
}
