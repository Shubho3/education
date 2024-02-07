import 'package:flutter/cupertino.dart';

class SDP {
  static int? dimen;
  static double? width;
  static double? height;
  static BuildContext? contex;

  static void init(BuildContext context) {
    contex = context;
    width = MediaQuery.of(contex!).size.width;
    height = MediaQuery.of(contex!).size.height;
  }

  static double sdp(double dp) {
    return (dp / 300) * width!;
  }

  static double sdph(double dp) {
    return (dp / 300) * height!;
  }
}
