import 'package:notez/features/note/data/repository/providers/note_repository_provider.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_note_provider.g.dart';

@riverpod
ReadNote readNote(ReadNoteRef ref) {
  final noteRepository = ref.watch(noteRepositoryProvider);
  return ReadNote(noteRepository);
}
