import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;

  static ColorConstants get instance => _instance ??= ColorConstants._init();

  ColorConstants._init();

  get secondaryColor => const Color.fromRGBO(255, 100, 105, 1);
  get primaryColor => const Color.fromARGB(255, 31, 181, 192);
  get whiteColor => const Color.fromRGBO(255, 255, 255, 1);
  get blackColor => Colors.black;

  get secondButtonColor => const Color.fromRGBO(255, 238, 239, 1);

  get lightGrey => const Color.fromRGBO(245, 245, 245, 1);
  get medGrey => const Color.fromRGBO(170, 170, 170, 1);

  get darkGrey => const Color.fromRGBO(120, 120, 120, 1);
}
