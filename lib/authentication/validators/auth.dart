String emailValidate(String email) {
  if (email.isEmpty) {
    return "Please enter your email address";
  } else if (!email.contains("@")) {
    return "Please enter valid email address";
  }
  return "Success";
}
