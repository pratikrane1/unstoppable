class Images {
  static const String logo = "assets/images/logo.png";
  static const String splash = "assets/splash.png";
  static const String bg = "assets/BG.png";
  // static const String logowebsite = "assets/images/tomato-website.png";

  ///Singleton factory
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();
}
