import 'package:get_it/get_it.dart';
import 'package:notez/features/note/data/databases/local/local_database.dart';
import 'package:notez/features/note/data/databases/local/local_database_impl.dart';
import 'package:notez/features/note/data/repository/note_repository_impl.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl
    ..registerFactory(() => NoteBloc(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()))
    ..registerLazySingleton<LocalDatabase>(() => LocalDatabaseImpl())

    // Use cases.
    ..registerLazySingleton(() => CreateNote(sl()))
    ..registerLazySingleton(() => ReadNote(sl()))
    ..registerLazySingleton(() => UpdateNote(sl()))
    ..registerLazySingleton(() => DeleteNote(sl()));
}
