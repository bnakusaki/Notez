import 'package:notez/features/home/data/database/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_impl.g.dart';

@riverpod
class LocalDatabaseImpl extends _$LocalDatabaseImpl implements LocalDatabase {
  late dynamic database;
  @override
  build() {
    switch (database) {
      case AsyncError(:final error):
        return error;
      case AsyncData(:final value):
        database = value;
    }
    return null;
  }

  @override
  Future<List<Note>?> getNotes() async {
    final response = (await database.query('notes'))
        .map(
          (json) => NoteModel.fromJson(json),
        )
        .toList();

    return response;
  }
}
