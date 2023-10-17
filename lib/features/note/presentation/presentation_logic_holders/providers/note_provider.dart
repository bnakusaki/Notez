import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/providers/use_case_providers/create_note/create_note_provider.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/providers/use_case_providers/delete_note/delete_note_provider.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/providers/use_case_providers/read_note/read_note_provider.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/providers/use_case_providers/update_note/update_note_provider.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/state/note_notifier.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/state/note_state.dart';

final noteStateNotifierProvider = StateNotifierProvider.autoDispose<NoteNotifier, NoteState>((ref) {
  final CreateNote createNote = ref.watch(createNoteProvider);
  final ReadNote readNote = ref.watch(readNoteProvider);
  final UpdateNote updateNote = ref.watch(updateNoteProvider);
  final DeleteNote deleteNote = ref.watch(deleteNoteProvider);

  return NoteNotifier(createNote, readNote, updateNote, deleteNote);
});
