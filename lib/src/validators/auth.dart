class AuthValidation {
  late String _email;
  late String _phone;
  AuthValidation(String email, String phone) {
    _email = email;
    _phone = phone;
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
    }
    return "Success";
  }
}
