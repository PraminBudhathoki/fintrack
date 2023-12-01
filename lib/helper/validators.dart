import '../constants/string_manager.dart';

class AppValidators {
  AppValidators._();

  static String? text(String text, String error) {
    return text.isEmpty ? error : null;
  }

  static String? fieldValidator(String input) {
    if (input.isEmpty) {
      return StringManager.requiredField;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? input) {
    if (input!.isEmpty) {
      return StringManager.requiredField;
    } else if (input.length < 8) {
      return StringManager.passwordShouldBe;
    } else {
      return null;
    }
  }

  static String? mailValidator(String? input) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (input!.trim().isEmpty) {
      return StringManager.requiredField;
    } else if (!regex.hasMatch(input)) {
      return StringManager.validEmail;
    }
    return null;
  }

  static String? phoneValidator(String? input) {
    String? pattern = r'^\+977[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (input!.trim().isEmpty) {
      return 'Please enter mobile number';
    } else if (!regex.hasMatch(input)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
