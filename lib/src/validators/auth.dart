import 'package:connectivity_plus/connectivity_plus.dart';

class AuthValidation {
  late String _email;
  late String _phone;
  AuthValidation(String email, String phone) {
    _email = email;
    _phone = phone;
  }
  Future<String> validation() async{
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
   return "Please check your internet connection";
  } 
    if (_email.isEmpty) {
      return "Please enter your email address";
    } else if (!_email.contains("@")) {
      return "Please enter valid email address";
    } else if (_phone.isEmpty) {
      return "Please enter your phone number";
    } else if (_phone.length < 10) {
      return "Please enter valid phone number";
    }
    return "Success";
  }
}
