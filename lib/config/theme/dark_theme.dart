import 'package:flutter/material.dart';

import '../../constants.dart';
import 'appbar_theme.dart';
import 'button_theme.dart';
import 'checkbox_themedata.dart';
import 'input_decoration_theme.dart';

class CustomDarkTheme{

  ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF26242e),
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),

      brightness: Brightness.dark,
      // fontFamily: "Plus Jakarta",
      primarySwatch: primaryMaterialColor,
     // primaryColor: primaryColor,
    //  scaffoldBackgroundColor: Colors.white,
    // iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyText2: TextStyle(color: whiteColor),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      textButtonTheme: textButtonThemeData,
      inputDecorationTheme: darkInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarDarkTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,

    );
  }
}
