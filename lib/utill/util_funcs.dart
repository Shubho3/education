import 'dart:io';

import 'package:Education/utill/appImports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motion_toast/motion_toast.dart';
import '../model/LoginResponse.dart';

Widget sbh(double height) {
  return SizedBox(height: (height));
}

Widget sbw(double width) {
  return SizedBox(width: (width));
}

const String version = "1.0.0";

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  print("hexToColorhexToColorhexToColor    code  ----" + code);
  print("hexToColorhexToColorhexToColor    code  ----" + code);
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

/// Construct a color from a hex code string, of the format #RRGGBB.
Color? hexToColor2(String code, Color colorc) {
  late var color;
  try {
    print("hexToColorhexToColorhexToColor    code  ----" + code);
    print("hexToColorhexToColorhexToColor    code  ----" + code);
    color = Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  } catch (e) {
    color = colorc;
  }
  return color;
}

String formatAmount(String ageString) {
  // Parse the age string to a double
  double age = double.tryParse(ageString) ?? 0.0;

  // Ensure there are always two decimal places
  String formattedAge = double.parse(age.toStringAsFixed(2)).toString();

  // Add a leading '0' if there is only one digit after the decimal point
  if (formattedAge.contains('.') && formattedAge.split('.')[1].length == 1) {
    formattedAge += '0';
  }

  return formattedAge;
}

MotionToast showSuccessToast(BuildContext context,
    {String? title, required String message}) {
  return MotionToast.success(
    title:
        title == null ? null : Text(title, style: TextStyle(fontSize: 16.sp)),
    description: Text(message, style: TextStyle(fontSize: 14.sp)),
    width: context.width - 40,
    height: 30.sp,
    position: MotionToastPosition.top,
    animationType: AnimationType.fromLeft,
    animationDuration: const Duration(milliseconds: 500),
  )..show(context);
}
MotionToast showFailedToast(BuildContext context,
    {String? title, required String message}) {
  return MotionToast.warning(
    title:
        title == null ? null : Text(title, style: TextStyle(fontSize: 16.sp)),
    description: Text(message, style: TextStyle(fontSize: 14.sp)),
    width: context.width - 40,
    height: 30.sp,
    position: MotionToastPosition.top,
    animationType: AnimationType.fromLeft,
    animationDuration: const Duration(milliseconds: 500),
  )..show(context);
}

User get appDetails => User.fromJson(GetStorage().read<String>('app_details') ??
    '{"id":"1","name":"orkiosk","logo":"https://wkreative.com/admin-orkiosk-com/uploads/images/Logo-white.png","icon":"https://wkreative.com/admin-orkiosk-com/uploads/images/logo_IMG20201019124244.jpeg","Takeout_button_visible":"true","OnTable_button_visible":"true","Takeout_button_text":"Take out","OnTable_button_text":"From Table","background_display":"https://wkreative.com/admin-orkiosk-com/uploads/images/","terminal":"123456","tax":"12","English":"true","French":"false","tip_percentages_amount1":"0","tip_percentages_amount2":"10","tip_percentages_amount3":"15","tip_percentages_amount4":"20","tip_fixed_amount1":"1","tip_fixed_amount2":"2","tip_fixed_amount3":"3","tip_fixed_amount4":"4","smart_tip":"10","menu_bg_color":"#e77e7e","menu_text_color":"#d42121","menu_bg_video":"https://wkreative.com/admin-orkiosk-com/uploads/images/menu_bg_video_20230406135407.mp4","menu_item_text_color":"#d00606","menu_item_bg_color":"#f61313","menu_order_bg_color":"#e51515","menu_order_text_color":"#f10909","menu_checkout_bg_color":"#ee5d5d","menu_checkout_text_color":"#927777"}');

set appDetails(User appDetails) =>
    GetStorage().write('app_details', appDetails.toJson());
