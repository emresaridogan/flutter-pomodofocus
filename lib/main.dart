import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/app/app_constants.dart';
import 'package:pomodofocus/view/onboard/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.instance.appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashView(),
    );
  }
}
