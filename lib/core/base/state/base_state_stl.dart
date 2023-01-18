import '../../constants/app/app_constants.dart';
import '../../constants/color/color_constants.dart';
import '../../constants/icon/icon_constants.dart';
import '../../constants/image/image_constants.dart';
import '../../constants/padding/padding_constants.dart';
import '../../constants/radius/radius_constants.dart';
import '../../constants/string/string_constants.dart';

abstract class BaseStateStl {
  ColorConstants colorConstants = ColorConstants.instance;
  ImageConstants imageConstants = ImageConstants.instance;
  ApplicationConstants applicationConstants = ApplicationConstants.instance;
  PaddingConstants paddingConstants = PaddingConstants.instance;
  RadiusConstants radiusConstants = RadiusConstants.instance;
  StringConstants stringConstants = StringConstants.instance;
  IconConstants iconConstants = IconConstants.instance;
}
