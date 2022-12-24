import 'package:flutter/material.dart';

class PaddingConstants {
  static PaddingConstants? _instance;

  static PaddingConstants get instance =>
      _instance ??= PaddingConstants._init();

  PaddingConstants._init();

  get paddingAll20 => const EdgeInsets.all(20.0);
  get paddingAll10 => const EdgeInsets.all(10.0);
}
