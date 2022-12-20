import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';
import 'package:pomodofocus/core/constants/image/image_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 100, 105, 1),
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
                  ImageConstants.instance.logo,
                  fit: BoxFit.contain,
                )),
                const Spacer(),
                CircularProgressIndicator(
                  backgroundColor: ColorConstants.instance.primaryTealColor,
                  valueColor: AlwaysStoppedAnimation(
                      ColorConstants.instance.whiteColor),
                ),
                const Spacer()
              ],
            ),
          ],
        ));
  }
}
