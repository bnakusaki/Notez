import 'package:get_it/get_it.dart';
import 'package:notez/features/home/data/database/local/local_database.dart';
import 'package:notez/features/home/data/database/local/local_database_impl.dart';
import 'package:notez/features/home/data/repository/home_repository_impl.dart';
import 'package:notez/features/home/domain/repository/home_repository.dart';
import 'package:notez/features/home/domain/use_cases/get_notes.dart';
import 'package:notez/features/home/presentation/presentation_logic_holders/home_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl
    ..registerFactory(() => HomeBloc(sl()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    ..registerLazySingleton<LocalDatabase>(() => LocalDatabaseImpl())
    ..registerLazySingleton(() => GetNotes(sl()));
}
