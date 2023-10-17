import 'package:notez/features/note/data/databases/local/providers/local_database_provider.dart';
import 'package:notez/features/note/data/repository/note_repository_impl.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_repository_provider.g.dart';

@riverpod
NoteRepository noteRepository(NoteRepositoryRef ref) {
  final localDatabase = ref.watch(localDatabaseProvider);
  return NoteRepositoryImpl(localDatabase);
}
