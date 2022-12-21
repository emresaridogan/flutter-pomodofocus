import '../app/app_constants.dart';

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('logo');
  String get onboard1 => toPng('onboard1');

  String toPng(String name) =>
      '${ApplicationConstants.instance.imagesPath}$name.png';
}
