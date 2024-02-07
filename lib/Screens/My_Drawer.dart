// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Education/Screens/home/profile/AboutUs.dart';
import 'package:Education/utill/appImports.dart';

import '../utill/SDP.dart';
import 'home/publication/PublicationListScreen.dart';
import 'loginauth/LoginScreen.dart';

class My_Drawer extends StatefulWidget {
  My_Drawer({
    Key? key,
  }) : super(key: key);

  @override
  State<My_Drawer> createState() => _My_DrawerState();
}

class _My_DrawerState extends State<My_Drawer> {
  User? Data;
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    loading = true;
    setState(() {});
    Data = await getUserDetails();
    if (Data!.id != null) {
      loading = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: CC.themePurple));
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            // topRight: Radius.circular(10), bottomRight: Radius.circular(10)
            ),
        child: Drawer(
            backgroundColor: CC.white,
            width: SDP.width! / 1.5,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.push(context, createRoute(ProfileScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset('assets/icons/logo.png',
                                      width: SDP.width! / 1.8,
                                      height: SDP.width! / 6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Cursos Online",
                            style: TextStyle(
                                color: CC.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, createRoute(AboutUs()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Suporte",
                            style: TextStyle(
                                color: CC.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: CC.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Container(
                        margin: EdgeInsets.all(5),
                        child:Image.asset('assets/images/ig.png',
                            width: 30,
                            height: 30),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset('assets/images/fb.png',
                            width: 30,
                            height: 30),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: SvgPicture.asset('assets/icons/youtube.svg',
                            height: 30),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Text(
                        "     V 1.0.1",
                        style: TextStyle(
                            color: CC.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ))
        //Drawer
        );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
      Navigator.pop(context);
      logout();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          ModalRoute.withName("/Foo"));
      //    Navigator.pushReplacement(context, createRoute(const LoginScreen()));
      //  Navigator.popUntil(context, MAte.withName('/'));
      //   Navigator.popUntil(context, ModalRoute.withName("/Foo"));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are You Sure  You Want to Logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future push({
  required BuildContext context,
  required Widget screen,
}) async {
  print('presse kjhn d');
  Navigator.push(context, createRoute(screen));
}

Future pushReplacement({
  required BuildContext context,
  required Widget screen,
}) async {
  return Navigator.pushReplacement(context, createRoute(screen));
}
