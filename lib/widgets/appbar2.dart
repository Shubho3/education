import 'package:flutter/material.dart';
import 'package:Education/utill/appImports.dart';

import 'CustomTexts.dart';

AppBar appBar2(
    {String? title,
    String? image,
    Color? appBarColor = Colors.transparent,
    Color titleColor = Colors.black,
    Color? BackColor,
    bool implyLeading = true,
    required BuildContext context,
    List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: 70,
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: appBarColor,
    elevation: 0,
    title: title == null
        ? null
        : AppBarHeadingText(
            text: title,
            color: titleColor,
            fontSize: 18,
          ),
    leading: implyLeading
        ? IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    actions: actions,
  );
}

AppBar appBarProduct(
    {String? title,
      String? image,
      Color? appBarColor = Colors.transparent,
      Color titleColor = Colors.black,
      Color? BackColor,
      bool implyLeading = true,
      required BuildContext context,
      List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: 70,
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: CC.transparent,
    elevation: 0,
    title: title == null
        ? null
        : AppBarHeadingText(
      text: title,
      color: titleColor,
      fontSize: 18,
    ),
    leading: implyLeading
        ? IconButton(
      icon: Icon(
        Icons.chevron_left_outlined,
        color: Colors.black,
        size: 25,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    )
        : null,
    actions: actions,
  );
}
