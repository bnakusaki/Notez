import 'package:get_it/get_it.dart';
import 'package:notez/features/note/data/databases/local_database.dart';
import 'package:notez/features/note/data/databases/remote_database.dart';
import 'package:notez/features/note/data/repository/note_repository_impl.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/get_notes.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:notez/features/note/presentation/bloc/note_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl
    ..registerFactory<NoteBloc>(() => NoteBloc(sl(), sl(), sl(), sl(), sl()))
    ..registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<LocalDatabase>(() => LocalDatabaseImpl())
    ..registerLazySingleton<RemoteDatabase>(() => RemoteDatabaseImpl())
    ..registerLazySingleton(() => CreateNote(sl()))
    ..registerLazySingleton(() => ReadNote(sl()))
    ..registerLazySingleton(() => UpdateNote(sl()))
    ..registerLazySingleton(() => DeleteNote(sl()))
    ..registerLazySingleton(() => GetNotes(sl()));
}
