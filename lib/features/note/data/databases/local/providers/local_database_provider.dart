import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

@riverpod
LocalDatabase localDatabase(LocalDatabaseRef ref) {
  return LocalDatabaseImpl();
}
