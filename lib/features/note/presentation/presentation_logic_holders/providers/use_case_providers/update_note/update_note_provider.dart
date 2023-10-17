import 'package:notez/features/note/data/repository/providers/note_repository_provider.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_note_provider.g.dart';

@riverpod
UpdateNote updateNote(UpdateNoteRef ref) {
  final noteRepository = ref.watch(noteRepositoryProvider);
  return UpdateNote(noteRepository);
}
