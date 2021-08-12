import 'package:test_project/res/app_strings.dart';

abstract class Validator {

  static String? nickname(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return AppStrings.msg_enter_nickname;
    } else {
      final alphanumeric = RegExp(r'[a-zA-Z_]+');
      if (!alphanumeric.hasMatch(nickname) ||
          (alphanumeric.hasMatch(nickname) &&
              alphanumeric.stringMatch(nickname) != nickname)) {
        return AppStrings.msg_invalid_nickname;
      }
      return null;
    }
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.msg_enter_password;
    } else if (password.length < 3 || password.length > 9) {
      return AppStrings.msg_invalid_password;
    }
    return null;
  }
}