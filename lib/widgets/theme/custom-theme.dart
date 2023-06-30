import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: "Rubik",
    // scaffoldBackgroundColor: Colors.grey.shade900,
    // primaryColor: Colors.white.withOpacity(0.12),
    colorScheme: ColorScheme.dark(background: backgroundColor), // bgColor
    iconTheme: IconThemeData(color: white), // text color
    // appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
    canvasColor: Colors.white,
    focusColor: Colors.grey.withOpacity(0.12),
    hoverColor: Colors.white,
    shadowColor: grey.withOpacity(0.12),
    cardColor: darkGrey,
    hintColor: greyDark,
  );

  static final lightTheme = ThemeData(
      hintColor: grey,
      fontFamily: "Rubik",
      shadowColor: Colors.grey.withOpacity(0.5),
      splashColor: red,
      dividerColor: red,
      // scaffoldBackgroundColor: Colors.white,
      // primaryColor: Colors.black.withOpacity(0.12),
      colorScheme: ColorScheme.light(background: white), // bgColor
      iconTheme: IconThemeData(color: black), // text
      // appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      canvasColor: Colors.black.withOpacity(0.6),
      focusColor: Colors.grey.withOpacity(0.24),
      hoverColor: Colors.black,
      textTheme: TextTheme(bodySmall: TextStyle(color: red)));
}
