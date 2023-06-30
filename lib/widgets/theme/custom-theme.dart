import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: "Rubik",
    colorScheme: ColorScheme.dark(
        background: backgroundColor, onBackground: mainColor), // bgColor
    iconTheme: IconThemeData(color: white), // text color
    canvasColor: Colors.white,
    focusColor: Colors.grey.withOpacity(0.12),
    hoverColor: Colors.white,
    shadowColor: grey.withOpacity(0.12),
    cardColor: darkGrey,
    hintColor: greyDark,
    // scaffoldBackgroundColor: Colors.grey.shade900,
    // primaryColor: Colors.white.withOpacity(0.12),
    // appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
  );

  static final lightTheme = ThemeData(
    fontFamily: "Rubik",
    colorScheme:
        ColorScheme.light(background: white, onBackground: darkGrey), // bgColor
    iconTheme: IconThemeData(color: black), // text
    canvasColor: Colors.black.withOpacity(0.6),
    focusColor: Colors.grey.withOpacity(0.24),
    hoverColor: Colors.black,
    shadowColor: Colors.grey.withOpacity(0.5),
    hintColor: grey,
    // scaffoldBackgroundColor: Colors.white,
    // primaryColor: Colors.black.withOpacity(0.12),
    // appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );
}
