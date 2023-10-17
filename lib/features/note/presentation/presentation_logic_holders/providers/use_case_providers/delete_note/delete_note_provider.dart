import 'package:notez/features/note/data/repository/providers/note_repository_provider.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_note_provider.g.dart';

@riverpod
DeleteNote deleteNote(DeleteNoteRef ref) {
  final noteRepository = ref.watch(noteRepositoryProvider);
  return DeleteNote(noteRepository);
}
