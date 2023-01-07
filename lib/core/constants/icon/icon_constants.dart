import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';

class IconConstants {
  static IconConstants? _instance;

  static IconConstants get instance => _instance ??= IconConstants._init();

  IconConstants._init();

  Icon get email => const Icon(Icons.email);
  Icon get lock => const Icon(Icons.lock);
  Icon get passwordHide => const Icon(Icons.remove_red_eye);
  Icon get arrowBack => Icon(
        Icons.arrow_back,
        color: ColorConstants.instance.blackColor,
      );
}
