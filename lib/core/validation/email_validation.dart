class EmailValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validateEmailOrMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or mobile number';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value) &&
        !RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
      return 'Please enter a valid email or mobile number';
    }
    return null;
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidMobile(String mobile) {
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(mobile);
  }
}
