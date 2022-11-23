import 'package:flutter/material.dart';


class CustomThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(0xFF1F1F1F),
      scaffoldBackgroundColor: const Color(0xFF1F1F1F),


      // app bar styling
      appBarTheme:const AppBarTheme(
        color: Color(0xFFC20430),
      ),

      // buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D3D3D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7)
          )
        )
      ),

      // text theme
      textTheme: Typography().white,
      fontFamily: 'Roboto'
    );
  }
}



class CustomTextStyles {
  static TextStyle get headerTwo {
    return const TextStyle(
      fontSize: 25
    );
  }

  static TextStyle get subHeading {
    return const TextStyle(
      fontSize: 15,
      color: Colors.white,
    );
  }

}

