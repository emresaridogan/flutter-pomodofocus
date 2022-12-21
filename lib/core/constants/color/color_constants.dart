import 'dart:ui';

class ColorConstants {
  static ColorConstants? _instance;

  static ColorConstants get instance => _instance ??= ColorConstants._init();

  ColorConstants._init();

  get secondaryColor => const Color.fromRGBO(255, 100, 105, 1);
  get primaryColor => const Color.fromARGB(255, 31, 181, 192);
  get whiteColor => const Color.fromRGBO(255, 255, 255, 1);
}
