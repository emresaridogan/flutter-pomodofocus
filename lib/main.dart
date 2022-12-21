import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/app/app_constants.dart';

import 'view/onboard/onboard3_view.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const Onboard3View(),
    );
  }
}
