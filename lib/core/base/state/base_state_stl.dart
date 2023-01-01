import 'package:pomodofocus/core/constants/app/app_constants.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';
import 'package:pomodofocus/core/constants/image/image_constants.dart';
import 'package:pomodofocus/core/constants/padding/padding_constants.dart';
import 'package:pomodofocus/core/constants/radius/radius_constants.dart';
import 'package:pomodofocus/core/constants/string/string_constants.dart';

import '../../constants/icon/icon_constants.dart';

abstract class BaseStateStl {
  ColorConstants colorConstants = ColorConstants.instance;
  ImageConstants imageConstants = ImageConstants.instance;
  ApplicationConstants applicationConstants = ApplicationConstants.instance;
  PaddingConstants paddingConstants = PaddingConstants.instance;
  RadiusConstants radiusConstants = RadiusConstants.instance;
  StringConstants stringConstants = StringConstants.instance;
  IconConstants iconConstants = IconConstants.instance;
}
