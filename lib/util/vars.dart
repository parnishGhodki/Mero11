import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

const String appName = 'Mero 11';
const String appUpDateDate = 'Release: 04-05-2020';

const String smtpEmail = '';
const String smtpPassword = '';

const String routeLogin = '/login';
const String routeMobile = '/mobile';
const String routeOTP = '/otp';
const String routeSignUp = '/signUp';
const String routeTab = '/tab';
const String routeContests = '/contests';
const String routeCreateTeam = '/create_team';
const String routeTeamPreview = '/team_preview';
const String routeMyProfile = '/my_profile';
const String routeTransactionHistory = '/transaction_history';

const String appIcon = 'assets/images/final_logo.png';
const String profileImage = 'assets/images/user_profile.png';

const String msgNoData = 'No Data';
const int ok200 = 200;
const int foundData302 = 302;
const int notFoundData404 = 404;

//TODO FONT NAME
const String quickFont = 'Quicksand';

const String quickBoldFont = 'quicksand_book.otf';
const String quickNormalFont = 'quicksand_book.otf';
const String quickLightFont = 'quicksand_light.otf';

//TODO ROUTE
const String SplashScreenRoute = '/splash';

//TODO COLOR
const Color veryLightGrey = Color(0xFFF7F7F7);
const Color lightestGrey = Color(0xFFEDEFF2);
const Color grey = Color(0xFFE7E7E7);
const Color mediumGrey = Color(0xFFE7E7E7);
const Color semiGrey = Color(0xFF9DA0A6);
const Color shadowColor = Color(0x1f0D0F10);

const Color colorProgressBar = Colors.black54;

const String colorBottomNavyBarInactive = '#140101';

Color colorIndicator = Colors.blue.withOpacity(0.6);
const Color colorSelectorIndicator = Colors.blue;

List<Color> gradientsClipper = [Colors.blue.shade200, Colors.white60];

List<Color> gradientsButton = [Colors.grey.shade200, Colors.white];

List<Color> gradientsButtonCheckOut = [Colors.deepOrange.shade200, Colors.grey];

List<Color> kitGradients = [
  Colors.white,
  Colors.white,
];

//VALIDATION
String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

String validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return 'Mobile is required';
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters';
  }
  return null;
}

String validateCurrentPassword(String value) {
  if (value.isEmpty) {
    return 'Current password required';
  } else if (value.length < 4) {
    return 'Current password must be at least 4 characters';
  }
  return null;
}

String validateNewPassword(String value) {
  if (value.isEmpty) {
    return 'New password required';
  } else if (value.length < 4) {
    return 'New password must be at least 4 characters';
  }
  return null;
}

String baseName(String image) {
  return extension(image);
}

String validateEditName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateEditEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

String validateCity(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'City must be a-z and A-Z';
  }
  return null;
}

String validateEditMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return null;
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

bool validationEqual(String currentValue, String checkValue) {
  if (currentValue == checkValue) {
    return true;
  } else {
    return false;
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Name is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Address is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}

String validateEditAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}
