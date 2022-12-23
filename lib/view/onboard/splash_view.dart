import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/view/onboard/onboard1_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra diğer sayfaya geçiş yapılacak
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Onboard1View())));
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldBody;
  }

  Widget get scaffoldBody => Scaffold(
      backgroundColor: colorConstants.secondaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  child: Image.asset(
                imageConstants.logo,
                fit: BoxFit.contain,
              )),
              const Spacer(),
              CircularProgressIndicator(
                backgroundColor: colorConstants.primaryColor,
                valueColor: AlwaysStoppedAnimation(colorConstants.whiteColor),
              ),
              const Spacer()
            ],
          ),
        ],
      ));
}
