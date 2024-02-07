import 'package:google_fonts/google_fonts.dart';
import 'package:Education/Screens/home/profile/AboutUs.dart';
import 'package:Education/utill/appImports.dart';

import '../../../utill/SDP.dart';
import '../../../widgets/appbar2.dart';
import '../../loginauth/LoginScreen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = true;
  LoginResponse? profileRes;

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CC.white,
      appBar: appBar2(context: context, title: "Profile"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F8F8),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 30.sp,
                      color: CC.themePurple,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: loading
                                        ? Text(
                                            '...',
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black26),
                                          )
                                        : Text(
                                            profileRes!.user!.userName
                                                .toString(),
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black26),
                                          ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: loading
                                        ? Text(
                                            '...',
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black26),
                                          )
                                        : Text(
                                            profileRes!.user!.email.toString(),
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black26),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                      width: double.infinity,
                                      height: SDP.height! / 1.3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F7FA),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x320E151B),
                                            offset: Offset(0, -2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                      child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 1, 10, 1),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Generated code for this Row Widget...
/*
                                                          InkWell(
                                                            splashColor:
                                                            Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  createRoute(
                                                                      const ProfileScreen()));
                                                            },
                                                            child:
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5,
                                                                          5,
                                                                          12,
                                                                          5),
                                                                      child:
                                                                      Text(
                                                                        'Edit Profile',
                                                                        textAlign: TextAlign.start,
                                                                        style: TextStyle(color: CC.themePurple, fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        8),
                                                                    child:
                                                                    Icon(
                                                                      Icons.arrow_forward_ios,
                                                                      color:
                                                                      CC.themePurple,
                                                                      size:
                                                                      25,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
*/
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  createRoute(
                                                                      const AboutUs()));
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              5,
                                                                              12,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'About Us',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: TextStyle(
                                                                            color: CC
                                                                                .themePurple,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: CC
                                                                          .themePurple,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
/*
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(
                                                                8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        5,
                                                                        5,
                                                                        12,
                                                                        5),
                                                                    child:
                                                                    Text(
                                                                      'Orders',
                                                                      textAlign:
                                                                      TextAlign.start,
                                                                      style: TextStyle(
                                                                          color: CC.themePurple,
                                                                          fontFamily: 'Poppins',
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      8),
                                                                  child:
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color:
                                                                    CC.themePurple,
                                                                    size:
                                                                    25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
*/
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            5,
                                                                            12,
                                                                            5),
                                                                    child: Text(
                                                                      'Privacy Policies',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: TextStyle(
                                                                          color: CC
                                                                              .themePurple,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color: CC
                                                                        .themePurple,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
/*
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(
                                                                8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        5,
                                                                        5,
                                                                        12,
                                                                        5),
                                                                    child:
                                                                    Text(
                                                                      'Delete Account',
                                                                      textAlign:
                                                                      TextAlign.start,
                                                                      style: TextStyle(
                                                                          color: CC.themePurple,
                                                                          fontFamily: 'Poppins',
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      8),
                                                                  child:
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color:
                                                                    CC.themePurple,
                                                                    size:
                                                                    25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
*/
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            5,
                                                                            12,
                                                                            5),
                                                                    child: Text(
                                                                      'Rate Us',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: TextStyle(
                                                                          color: CC
                                                                              .themePurple,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color: CC
                                                                        .themePurple,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
/*
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(
                                                                8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        5,
                                                                        5,
                                                                        12,
                                                                        5),
                                                                    child:
                                                                    Text(
                                                                      'Talk to Support',
                                                                      textAlign:
                                                                      TextAlign.start,
                                                                      style: TextStyle(
                                                                          color: CC.themePurple,
                                                                          fontFamily: 'Poppins',
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      8),
                                                                  child:
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color:
                                                                    CC.themePurple,
                                                                    size:
                                                                    25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
*/
                                                          InkWell(
                                                            onTap: () {
                                                              showAlertDialog(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              5,
                                                                              12,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'Logout',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: TextStyle(
                                                                            color: CC
                                                                                .red,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child: Icon(
                                                                      Icons
                                                                          .exit_to_app,
                                                                      color: CC
                                                                          .red,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                //hererer
                                              ])))))
                        ])),
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
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

  getProfile() async {
    setState(() {
      loading = true;
    });
    User? user = await getUserDetails();
    var res = await Webservices.postDataWithToken(
      apiUrl: ApiUrls.get_profile,
      body: {
        "token": user.token,
        "user_id": user.id,
      },
      context: context,
    );
    LoginResponse model = LoginResponse.fromJson(res);
    print('get_client_detailget_client_detail ------------${model.toString()}');
    if (model.status == "1") {
      ShowToast.ShowT0astError(model.message.toString());
      profileRes = model;
      setState(() {
        profileRes;
        loading = false;
      });
    } else {
      ShowToast.ShowT0astError(model.message.toString());
      loading = false;
    }
  }
}
