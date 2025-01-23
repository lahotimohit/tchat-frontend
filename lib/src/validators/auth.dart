class AuthValidation {
  late String _email;
  late String _phone;
  late String _code;
  AuthValidation(String email, String phone, String code) {
    _email = email;
    _phone = phone;
    _code = code;
  }
  String validation() {
    if (_email.isEmpty) {
      return "Please enter your email address";
    } else if (!_email.contains("@")) {
      return "Please enter valid email address";
    } else if (_phone.isEmpty) {
      return "Please enter your phone number";
    } else if (_phone.length < 10) {
      return "Please enter valid phone number";
    } else if (_code.isEmpty) {
      return "Please enter your country code";
    } else if (_code.length < 2) {
      return "Please enter valid country code";
    }
    return "Success";
  }
}
