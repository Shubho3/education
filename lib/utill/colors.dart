import 'package:flutter/material.dart';

MaterialColor colorToSwatch(Color color) => MaterialColor(
      0xFFC32321,
      <int, Color>{
        50: color.withOpacity(1),
        100: color.withOpacity(1),
        200: color.withOpacity(1),
        300: color.withOpacity(1),
        400: color.withOpacity(1),
        500: color.withOpacity(1),
        600: color.withOpacity(1),
        700: color.withOpacity(1),
        800: color.withOpacity(1),
        900: color.withOpacity(1),
      },
    );

class CC {
  static const themePurple = Color(0xFF01366B);
  static const accentOrange = Color(0xFFE78F22);
  static const red = Color(0xFFA10000);

  static const blackPurple = Color(0xFF09051C);
  static const screenBackground = Colors.white;
  static const appBarBackground = Colors.white;
  static const extraLightWhite = Color(0xFFF4F4F4);
  static const gray = Color(0xFF3B3B3B);
  static const gray1 = Color(0xFF4E4E4E);
  static const gray2 = Color(0xFF67666D);
  static const gray3 = Color(0xFF7E8392);
  static const gray4 = Color(0xFF828282);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;

  static const themeGradient = LinearGradient(
      colors: [themePurple, themePurple],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
}
