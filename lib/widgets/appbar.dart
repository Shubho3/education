import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utill/SDP.dart';

AppBar appBar(
    {String? title,
    String? image,
    Color? appBarColor = Colors.transparent,
    Color titleColor = Colors.black,
    Color? BackColor,
    bool implyLeading = true,
    required BuildContext context,
    List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Padding(
      padding: EdgeInsets.only(right: SDP.sdp(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/" + image!,
            height: SDP.sdp(20),
            width: SDP.sdp(20),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 2),
            child: Text(
              title!,
              style: GoogleFonts.josefinSans(
                  fontSize: SDP.sdp(15),
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000)),
            ),
          ),
        ],
      ),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: SDP.sdp(14),
      ),
    ),
  );

  //   AppBar(
  //   toolbarHeight: 70,
  //   automaticallyImplyLeading: false,
  //   centerTitle: true,
  //   backgroundColor: appBarColor,
  //   elevation: 0,
  //   title: title == null
  //       ? null
  //       : AppBarHeadingText(
  //           text: title,
  //           color: titleColor,
  //           fontSize: 18,
  //         ),
  //   leading: implyLeading
  //       ? IconButton(
  //           icon: Icon(
  //             Icons.chevron_left_outlined,
  //             color: Colors.black,
  //             size: 25,
  //           ),
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //         )
  //       : null,
  //   actions: actions,
  // );
}
