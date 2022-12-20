class ApplicationConstants {
  static ApplicationConstants? _instance;

  static ApplicationConstants get instance =>
      _instance ??= ApplicationConstants._init();

  ApplicationConstants._init();

  String get appName => "Pomodofocus";

  String get assetPath => 'assets/';
  String get imagesPath => '${assetPath}images/';
}
