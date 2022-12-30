import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state_stl.dart';
import 'package:pomodofocus/view/splash/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseStateStl {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: applicationConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashView(),
    );
  }
}
