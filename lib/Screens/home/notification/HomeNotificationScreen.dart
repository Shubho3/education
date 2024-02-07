import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/utill/colors.dart';

import '../../../Apis/Webservices.dart';
import '../../../Apis/auth.dart';
import '../../../model/CategoryRes.dart';
import '../../../model/LoginResponse.dart';
import '../../../utill/SDP.dart';
import '../../../widgets/appbar.dart';

class HomeNotificationScreen extends StatefulWidget {
  const HomeNotificationScreen({super.key});

  @override
  State<HomeNotificationScreen> createState() => _HomeNotificationScreenState();
}

class _HomeNotificationScreenState extends State<HomeNotificationScreen> {
  bool loading = true;
  bool data = true;
  CategoryRes? profileRes;
  User? user;

  @override
  void initState() {
    getReport();
    super.initState();
  }

  getReport() async {
    user = await getUserDetails();
    print("getUserDetailsfhgffghgfghfhg" + user!.id.toString());
    print("getUserDetailsfhgffghgfghfhg" + user!.admin_id.toString());
    setState(() {
      user;
      loading = true;
      data = true;
    });

    var res = await Webservices.postDataWithToken(
        apiUrl: ApiUrls.get_category,
        body: {
          "token": user!.token,
          "user_id": user!.id,
          "admin_id": user!.admin_id,
        },
        context: context);
    try {
      if (res["status"] == "1" && res["result"].toString() != "[]") {
        profileRes = CategoryRes.fromJson(res);
        setState(() {
          profileRes;
          data = false;
          loading = false;
        });
      } else {
        loading = false;
        data = true;
        setState(() {});
      }
    } catch (e) {
      loading = false;
      data = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: CC.white,
      appBar: appBar(
        context: context,
        title: "Notification",
        BackColor: CC.themePurple,
        image: "notification.png",
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            loading
                ? Center(
                    child: Container(
                    margin: EdgeInsets.all(10),
                    child: Lottie.asset('assets/loding.json',
                        width: 50, height: 50),
                  ))
                : data
                    ? Center(
                        child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "No Data Found",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF070707),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                    : Container(
                        width: SDP.width!,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: profileRes!.result!.length,
                          itemBuilder: (BuildContext context, int index) {
                            Result datax = profileRes!.result![index];
                            return Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 10, 16, 10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: CC.appBarBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: CC.themePurple,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: CC.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: CC.themePurple,
                                                width: 2,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.fastfood_rounded,
                                              color: CC.themePurple,
                                              size: 16,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 4, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    datax.categoryName!,
                                                    maxLines: 1,
                                                    style:
                                                        GoogleFonts.josefinSans(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: CC.themePurple,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      'Order has been placed Successfully.',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: CC.themePurple,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
/*
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 44,
                                                          height: 44,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: CC.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                              color: CC
                                                                  .themePurple,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child: Icon(
                                                                Icons
                                                                    .shopping_bag_outlined,
                                                                color: CC
                                                                    .themePurple,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                datax
                                                                    .categoryName!,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: CC
                                                                      .blackPurple,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  "\$ ${datax.id!}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: CC
                                                                        .blackPurple,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
*/
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 4),
                                                    child: Text(
                                                      '2 hours ago',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: CC.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          //    separatorBuilder:
                          //       (BuildContext context, int index) =>
                          //           const Divider(),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
