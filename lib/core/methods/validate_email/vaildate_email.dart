bool isEmailValid(String email) {
  if (email.contains('@') && email.contains('.') && email.endsWith('.com')) {
    return true;
  } else {
    return false;
  }
}
