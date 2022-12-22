import 'package:flutter/material.dart';

class RadiusConstants {
  static RadiusConstants? _instance;

  static RadiusConstants get instance => _instance ??= RadiusConstants._init();

  RadiusConstants._init();

  get circular20 => BorderRadius.circular(20.0);
}
