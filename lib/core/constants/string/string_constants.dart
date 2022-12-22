import 'package:flutter/material.dart';

class StringConstants {
  static StringConstants? _instance;

  static StringConstants get instance => _instance ??= StringConstants._init();

  StringConstants._init();

  get onboard1 => "Easy task & work management with pomo";
  get onboard2 => "Track your productivity & gain insights";
  get next => "Next";
  get onboard3button => "Get Started";
  get onboard3 => "Boost your productivity now & be successful";
  get blackColor => Colors.black;

  get lightGrey => const Color.fromRGBO(245, 245, 245, 1);
  get medGrey => const Color.fromRGBO(170, 170, 170, 1);

  get darkGrey => const Color.fromRGBO(120, 120, 120, 1);
}
