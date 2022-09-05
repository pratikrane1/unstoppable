class Preferences {

  static String user = 'user';
  static String language = 'language';
  static String notification = 'notification';
  static String theme = 'theme';
  static String darkOption = 'darkOption';
  static String font = 'font';
  //updated on 5/08/2021 for token
  static String fcmToken = 'token';
  static String deviceId='device_id';




  ///Singleton factory
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();
}
