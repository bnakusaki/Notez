import 'package:notez/features/note/data/repository/providers/note_repository_provider.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_note_provider.g.dart';

@riverpod
CreateNote createNote(CreateNoteRef ref) {
  final noteRepository = ref.watch(noteRepositoryProvider);
  return CreateNote(noteRepository);
}
