import '../app/app_constants.dart';

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('logo');
  String get onboard1 => toPng('onboard1');
  String get onboard2 => toPng('onboard2');
  String get onboard3 => toPng('onboard3');
  String get person => toPng('person');

  String get facebook => toSvg('facebook');
  String get apple => toSvg('apple');
  String get google => toSvg('google');

  String get home => toPng('home');

  String get homeSvg => toSvg('home');
  String get profileSvg => toSvg('profile');
  String get taskSvg => toSvg('task');
  String get chartSvg => toSvg('chart');
  String get addSvg => toSvg('add');

  String toSvg(String name) =>
      '${ApplicationConstants.instance.imagesPath}$name.svg';

  String toPng(String name) =>
      '${ApplicationConstants.instance.imagesPath}$name.png';
}
