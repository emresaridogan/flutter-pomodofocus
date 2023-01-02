import 'package:flutter/material.dart';

class IconConstants {
  static IconConstants? _instace;

  static IconConstants get instance => _instace ??= IconConstants._init();

  IconConstants._init();

  Icon get email => const Icon(Icons.email);
  Icon get lock => const Icon(Icons.lock);
  Icon get passwordHide => const Icon(Icons.remove_red_eye);
}
