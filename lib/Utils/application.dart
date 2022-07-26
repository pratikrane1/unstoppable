import 'package:shared_preferences/shared_preferences.dart';
import 'package:unstoppable/Models/vendor_login.dart';

class Application {
  static bool debug = false;
  static String version = '2.0.3';
  static String Iosversion = '2.0.3';
  static String publishableKey="pk_test_51KGJyKSHMcdDIkB864XwME4MINAjLPUDi8jkT1OubzhTczywcrnQiqWFiToYYJ6er2hJOstRtwhE3bCr49jzci7y00cbqfDLBl";
  static String googleMapsKey="AIzaSyC08LZ461W_8xfd0alHTiPz8iLcYYrUdps";
  static SharedPreferences? preferences;


  static VendorLogin? vendorLogin;

  static String? token;


  //added on 7/01/2021 for firebase chat
  static const String androidGoogleAppId="1:616488191042:android:2af79d85760b61597e99db"; //mobilesdk_app_id
  static const String androidApiKey="AIzaSyAubWzDXwdeJcnqGp6rwIDytnbS3Up0cDk";
  static const String androidDatabaseUrl="https://medical-demo-d243d.firebaseio.com";
  static const String ProjectId="medical-demo-d243d";
  static const String senderId="616488191042";

  //for ios
  static const String iosGoogleAppId = '1:616488191042:android:2af79d85760b61597e99db';
  static const String iosGcmSenderId = '616488191042';
  static const String iosDatabaseUrl = 'https://medical-demo-d243d.firebaseio.com';
  static const String iosApiKey = 'AIzaSyAubWzDXwdeJcnqGp6rwIDytnbS3Up0cDk';


  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
