import 'package:flutter/material.dart';

import '../constants/strings.dart';

class EmailValidator {
  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Uh oh! Invalid email try again';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static bool validateStructure(String? value) {
    //allows _ as part of special character
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[a-zA-Z0-9_\-=@,\.;]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value!);
  }

  static String? validatePassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }

      if (!validateStructure(value)) {
        return "Please enter valid password. (Min. 1 upper case \nMin. 1 lowercase \nMin. 1 Numeric Number \nMinimum 1 Special Character( ! @ # \$ & * ~ )";
      }
    } else {
      return null;
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }
    } else {
      return null;
    }
    return null;
  }
}

class UsernameValidator {
  static String? validateUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUsernameField;
      }

      if (value.length < 6) {
        return usernameLengthError;
      }
    } else {
      return null;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    } else {
      return null;
    }

    return null;
  }
}

class PhoneValidator {
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final clean = value.replaceAll(RegExp(r'[\s\-()+]'), '');
    if (!RegExp(r'^\d+$').hasMatch(clean)) {
      return 'Phone number must contain only digits';
    }
    if (clean.length < 10 || clean.length > 15) {
      return 'Enter a valid phone number (10-15 digits)';
    }
    return null;
  }
}

abstract class Validate {
  static void offKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }

  static String? validateEmail(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Enter Valid Email';
    } else if (value.trim().isEmpty) {
      return 'Please enter your email!';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Password cannot be empty!';
    // } else if (value.length < 6) {
    //   return "Password must be up to 6 characters";
    } else if (!regExp.hasMatch(value.trim())) {
      return 'Password requires characters or numbers';
    } else {
      return null;
    }
  }

  static String? validateCode(String value) {
    if (value.isEmpty) {
      return "Enter confirmation code";
    } else if (value.contains(RegExp(r'[a-z, A-Z]'))) {
      return 'enter number only';
    }
    return null;
  }
}
