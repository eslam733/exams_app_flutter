import 'package:flutter/material.dart';

const emojiRegex =
    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

bool validateEmailRegExp(
    {required String value, required BuildContext context}) {
  // This is just a regular expression for email addresses
  var p = "[a-zA-Z0-9+._%-+]{1,256}"
      """
\\@"""
      """
[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"""
      "("
      "\\."
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
      ")+";
  RegExp regExp = RegExp(p);
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    debugPrint('Email is not valid');

    return false;
  }
}

String? validateEmail({required String value, required BuildContext context}) {
  if (value.toString().isEmpty) {
    return 'Email Empty';
  } else if (!validateEmailRegExp(
    context: context,
    value: value.toString(),
  )) {
    return 'email Not Valid';
  }
  return null;
}

String? validateGenerail(
    {required String value, required BuildContext context}) {
  if (value.toString().isEmpty) {
    return 'Can\'t be Empty';
  }

  return null;
}

bool checkPasswordSymbols(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

String? validatePassword(
    {required String value, required BuildContext context}) {
  if (value.isEmpty) {
    return 'Password Empty';
  } else if (value.length < 8) {
    return 'Password Must 8 Characters';
  } else if (!checkPasswordSymbols(value)) {
    return 'Password Not Symbols';
  }

  return null;
}

String? validateConfirmPassword(
    {required String value1,
    required String value2,
    required BuildContext context}) {
  if (value1.isEmpty) {
    return 'Password Empty';
  } else if (value1.length < 8) {
    return 'Password Must 8 Characters';
  } else if (!checkPasswordSymbols(value1)) {
    return 'Password Not Symbols';
  } else if (value1 != value2) {
    return 'Passwords Not Matched';
  }

  return null;
}

String replaceEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}

bool checkTextEnglish(String text) {
  if (RegExp("[a-z]").hasMatch(text.toString())) {
    return true;
  }
  return false;
}

String? validateEmojiUserName(String value) {
  if (value.contains(emojiRegex)) {
    value = value.replaceAll(emojiRegex, '');
  }
  return value;
}

String? validateFirstName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return 'First Name Required';
  } else if (validateEmojiUserName(value).toString().trim().length < 3) {
    return 'Validate Name';
  }
  return null;
}

String? validateLastName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return 'Last Name Required';
  } else if (validateEmojiUserName(value).toString().trim().length < 3) {
    return 'Validate Name';
  }
  return null;
}

String? birthDateValidator(
    {required String value, required BuildContext context}) {
  if (value.isEmpty) {
    return 'Date Birth Validate';
  }
  return null;
}

String? validatePhoneNumber(
    {required String value,
    required int length,
    required BuildContext context}) {
  if (value.isEmpty) {
    return 'Phone Required';
  } else if (value.length != length) {
    return 'Invalid Phone Number';
  }
  return null;
}

bool isNumericUsingRegularExpression(String string) {
  final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
  return numericRegex.hasMatch(string);
}

String avatarFirstLastName({required String value}) {
  return value
      .trim()
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((s) => s[0])
      .take(2)
      .join();
}

bool checkStringIsLink({required String value}) {
  if (Uri.tryParse(value)!.hasAbsolutePath) {
    return true;
  } else {
    return false;
  }
}

String? countViewFormat(String price) {
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }
  return price;
}
