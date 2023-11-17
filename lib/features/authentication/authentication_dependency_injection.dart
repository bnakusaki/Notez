import 'package:get_it/get_it.dart';
import 'package:notez/features/authentication/data/data_source/remote/remote_authentication_database.dart';
import 'package:notez/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';
import 'package:notez/features/authentication/domain/use_cases/current_user.dart';
import 'package:notez/features/authentication/domain/use_cases/sign_out.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl
    ..registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(sl()))
    ..registerLazySingleton<RemoteAuthenticationDatabase>(() => RemoteAuthenticationDatabaseImpl())
    ..registerLazySingleton(() => AuthenticateWithGoogle(sl()))
    ..registerLazySingleton(() => AuthenticateWithApple(sl()))
    ..registerLazySingleton(() => AuthenticateAnonymously(sl()))
    ..registerLazySingleton(() => SignOut(sl()))
    ..registerLazySingleton(() => CurrentUser(sl()));
}
