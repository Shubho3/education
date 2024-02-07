import 'package:google_fonts/google_fonts.dart';
import 'package:Education/utill/colors.dart';

import '../utill/appImports.dart';

showSnackbar(BuildContext context, String text, {int seconds = 4}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: seconds),
  ));
}

showSnackbar2(BuildContext context, String text, double dist,
    {int seconds = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: CC.themePurple,
    content: Container(
      child: Text(
        text,
        style: GoogleFonts.josefinSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: CC.white),
      ),
    ),
    margin: EdgeInsets.only(bottom: dist),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(15),
    duration: Duration(seconds: seconds),
  ));
}showSnackBarError(BuildContext context, String text, double dist,
    {int seconds = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: CC.red,
    content: Container(
      child: Text(
        text,
        style: GoogleFonts.josefinSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: CC.white),
      ),
    ),
    margin: EdgeInsets.only(bottom: dist),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(15),
    duration: Duration(seconds: seconds),
  ));
}
