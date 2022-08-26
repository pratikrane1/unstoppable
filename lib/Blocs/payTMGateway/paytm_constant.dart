import 'dart:convert';

class PaytmConfig {
  final String _mid = "...";
  final String _mKey = "...";
  final String _website = "DEFAULT"; // or "WEBSTAGING" in Testing
  final String _url =
      'https://flutter-paytm-backend.herokuapp.com/generateTxnToken'; // Add your own backend URL

  String get mid => _mid;
  String get mKey => _mKey;
  String get website => _website;
  String get url => _url;

  String getMap(double amount, String callbackUrl, String orderId) {
    return json.encode({
      "mid": mid,
      "key_secret": mKey,
      "website": website,
      "orderId": orderId,
      "amount": amount.toString(),
      "callbackUrl": callbackUrl,
      "custId": "122", // Pass users Customer ID here
    });
  }
}