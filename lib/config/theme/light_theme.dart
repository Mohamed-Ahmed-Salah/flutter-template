import 'package:flutter/material.dart';

import '../../constants.dart';
import 'appbar_theme.dart';
import 'button_theme.dart';
import 'checkbox_themedata.dart';
import 'input_decoration_theme.dart';

class CustomLightTheme{

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      // fontFamily: "Plus Jakarta",
      primarySwatch: primaryMaterialColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
        textTheme: const TextTheme(
        bodyText2: TextStyle(color: blackColor),

      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      textButtonTheme: textButtonThemeData,
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,

    );
  }
}
