import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodofocus/features/data/datasource/firebase/firebase_service.dart';
import 'package:pomodofocus/features/data/repository/auth/authentication_repository_impl.dart';
import 'package:pomodofocus/features/data/repository/firebase/firebase_repository_iml.dart';
import 'package:pomodofocus/features/domain/repository/auth/authentication_repository.dart';
import 'package:pomodofocus/features/domain/repository/firebase/firebase_repository.dart';
import 'package:pomodofocus/features/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/auth/sign_in_with_facebook_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/auth/sign_in_with_google_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/auth/update_user_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/task/create_task_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/task/read_tasks_usecase.dart';
import 'package:pomodofocus/features/presentation/bloc/auth/authentication_bloc.dart';
import 'package:pomodofocus/features/presentation/bloc/task/task_bloc.dart';
import 'package:pomodofocus/features/presentation/bloc/user/user_bloc.dart';

import 'features/data/datasource/auth/authentication_service.dart';
import 'features/domain/usecases/auth/sign_in_usecase.dart';
import 'features/domain/usecases/auth/sign_out_usecase.dart';
import 'features/domain/usecases/auth/sign_up_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Blocs
  locator.registerFactory(() => AuthenticationBloc(
        signOutUseCase: locator.call(),
        getCurrentUserUseCase: locator.call(),
        signInUseCase: locator.call(),
        signInWithFacebookUseCase: locator.call(),
        signInWithGoogleUseCase: locator.call(),
        signUpUseCase: locator.call(),
      ));

  locator.registerFactory(() => UserBloc(
        updateUserUseCase: locator.call(),
      ));

  locator.registerFactory(() => TaskBloc(
      createTaskUseCase: locator.call(), readTasksUseCase: locator.call()));

  // Use Cases

  locator.registerLazySingleton(
      () => ReadTasksUseCase(repository: locator.call()));

  locator.registerLazySingleton(
      () => CreateTaskUseCase(firebaseRepository: locator.call()));

  locator.registerLazySingleton(() => UpdateUserUseCase(
        authenticationRepository: locator.call(),
      ));

  locator.registerLazySingleton(() => GetCurrentUserUseCase(
        authenticationRepository: locator.call(),
      ));

  locator.registerLazySingleton(() => SignOutUseCase(
        authenticationRepository: locator.call(),
      ));

  locator.registerLazySingleton(() => SignInUseCase(
        authenticationRepository: locator.call(),
      ));
  locator.registerLazySingleton(() => SignUpUseCase(
        authenticationRepository: locator.call(),
      ));
  locator.registerLazySingleton(() => SignInWithFacebookUseCase(
        authenticationRepository: locator.call(),
      ));
  locator.registerLazySingleton(() => SignInWithGoogleUseCase(
        authenticationRepository: locator.call(),
      ));

  // Externals
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  locator.registerLazySingleton(() => firebaseFirestore);
  locator.registerLazySingleton(() => firebaseAuth);
  locator.registerLazySingleton(() => firebaseStorage);

  // Remote Data Source
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl(
            firebaseAuth: firebaseAuth,
            firebaseFirestore: firebaseFirestore,
          ));

  locator.registerLazySingleton<FirebaseService>(
      () => FirebaseServiceImpl(firebaseFirestore: firebaseFirestore));

  // Repository
  locator.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseService: locator.call()));

  locator.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(authenticationService: locator.call()));
}
