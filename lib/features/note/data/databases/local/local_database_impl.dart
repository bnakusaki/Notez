import 'package:notez/core/database.dart';
import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/models/note_model.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'local_database_impl.g.dart';

@riverpod
class LocalDatabaseImpl extends _$LocalDatabaseImpl implements LocalDatabase {
  @override
  void build() {}

  @override
  Future<int?>? createNote() async {
    final AsyncValue<Database> database = ref.watch(databaseProvider);

    switch (database) {
      case AsyncError(:final error):
        throw error;
      case AsyncData(:final value):
        return value.insert(
          'notes',
          NoteModel.newNote().toJson(),
          conflictAlgorithm: ConflictAlgorithm.abort,
        );
    }
    return null;
  }

  @override
  Future<NoteModel?>? readNote(int id) async {
    final AsyncValue<Database> database = ref.watch(databaseProvider);

    switch (database) {
      case AsyncError(:final error):
        throw error;
      case AsyncData(:final value):
        final response = await value.query(
          'notes',
          where: 'id = $id',
        );
        final fResponse = NoteModel.fromJson(response[0]);
        ref.read(noteStateProvider.notifier).state = fResponse;
        return fResponse;
    }
    return null;
  }

  @override
  Future<int?>? updateNote(NoteModel noteModel) async {
    final AsyncValue<Database> database = ref.watch(databaseProvider);

    switch (database) {
      case AsyncError(:final error):
        throw error;
      case AsyncData(:final value):
        return await value.update(
          'notes',
          noteModel.toJson(),
          where: 'id = ${noteModel.id}',
        );
    }
    return null;
  }

  @override
  Future<int?>? deleteNote(int id) async {
    final AsyncValue<Database> database = ref.watch(databaseProvider);

    switch (database) {
      case AsyncError(:final error):
        throw error;
      case AsyncData(:final value):
        return await value.delete('notes', where: 'id = $id');
    }
    return null;
  }
}
