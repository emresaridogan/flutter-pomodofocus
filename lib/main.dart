import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pomodofocus/core/base/state/base_state_stl.dart';
import 'package:pomodofocus/features/presentation/bloc/task/task_bloc.dart';
import 'package:pomodofocus/features/presentation/bloc/user/user_bloc.dart';
import 'package:pomodofocus/features/presentation/view/splash/splash_view.dart';

import 'features/presentation/bloc/auth/authentication_bloc.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseStateStl {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => di.locator<AuthenticationBloc>(),
          ),
          BlocProvider<TaskBloc>(
            create: (context) => di.locator<TaskBloc>(),
          ),
          BlocProvider<UserBloc>(
            create: (context) => di.locator<UserBloc>(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('tr')],
          debugShowCheckedModeBanner: false,
          title: applicationConstants.appName,
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: const SplashView(),
        ));
  }
}
