import 'package:flutter/material.dart';
import '../constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: contentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    inputDecorationTheme: inputDecorationTheme.copyWith(
        fillColor: kPrimaryColor.withOpacity(0.05)),
  );
}
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: contentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    inputDecorationTheme: inputDecorationTheme,
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: contentColorDarkTheme.withOpacity(0.08),
  contentPadding: EdgeInsets.symmetric(
      horizontal: defaultPadding * 1.5, vertical: defaultPadding),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: const BorderRadius.all(Radius.circular(50)),
  ),
);
