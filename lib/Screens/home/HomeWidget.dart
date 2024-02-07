import 'dart:developer';

import 'package:Education/Screens/home/fav/CourseContentScreen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/Screens/home/publication/PublicationDetailsScreen.dart';
import 'package:Education/Screens/home/publication/PublicationModel.dart'
    as pub;
import 'package:Education/utill/appImports.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

import '../../model/CategoryRes.dart';
import '../../model/ItemRes.dart';
import '../../utill/SDP.dart';
import '../My_Drawer.dart';
import '../loginauth/LoginScreen.dart';
import 'CheckOut.dart';
import 'notification/HomeNotificationScreen.dart';

final GlobalKey<ScaffoldState> _JBAPPScaffoldKey = GlobalKey<ScaffoldState>();

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  String selectCatID = "1";
  int selectedIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
    //getReport();
  }

  bool loading = true;
  bool user_name = true;
  bool data = true;
  CategoryRes? profileRes;
  User? user;

  getReport() async {
    user = await getUserDetails();
    print("getUserDetailsfhgffghgfghfhg" + user!.id.toString());
    print("getUserDetailsfhgffghgfghfhg" + user!.admin_id.toString());
    setState(() {
      user;
      user_name = false;
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
      if (res["message"] == "Auth Failed" ||
          res["message"] == "Your session has been expired.") {
        showFailedToast(context, message: "Session Expired Login Again");
        Timer.periodic(Duration(seconds: 2), (timer) {
          logout();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              ModalRoute.withName("/Foo"));
        });
      }
      if (res["status"] == "1" && res["result"].toString() != "[]") {
        profileRes = CategoryRes.fromJson(res);
        selectCatID = profileRes!.result![0].id.toString();
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

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning,';
    }
    if (hour < 17) {
      return 'Afternoon,';
    }
    return 'Evening,';
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: CC.themePurple));
    return GestureDetector(
      child: Scaffold(
        key: _JBAPPScaffoldKey,
        drawer: My_Drawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  sbh(20),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _JBAPPScaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(
                            child: Image.asset('assets/icons/menu.png',
                                width: 30, height: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                                child: Center(
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: SDP.width!)),
                              ))
                          .toList(),
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        animateToClosest: true,
                        viewportFraction: 1,
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imgList.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () async {
                            //  Navigator.push(context, createRoute(ProductDetails(product: data)));
                          },
                          child: Ribbon(
                            nearLength: 50,
                            farLength: 20,
                            title: 'Registered',
                            titleStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                            color: Colors.green,
                            location: RibbonLocation.topStart,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: SDP.width!,
                              decoration: BoxDecoration(
                                color: CC.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7, 7, 7, 0),
                                        child: Container(
                                          width: SDP.width! / 1.02,
                                          height: SDP.width! / 1.7,
                                          decoration: BoxDecoration(
                                            color: CC.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: CachedNetworkImageProvider(
                                                  "https://i0.wp.com/inglescomarennie.com.br/wp-content/uploads/2020/11/laptop-computer-browser-2562325.jpg?resize=600%2C400&ssl=1"),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 7, 7),
                                        child: SizedBox(
                                          child: Text(
                                            "Basic Course (Levels A1 and A2)",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: CC.black),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, createRoute(CourseContentScreen()));

                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF428BCA)),
                                          width: SDP.width,
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'Access',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: CC.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GFProgressBar(
                                              percentage: 0.1,
                                              lineHeight: 3,
                                              alignment: MainAxisAlignment
                                                  .spaceBetween,
                                              /* leading  : Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
                                              trailing: Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
                                            */
                                              backgroundColor: Colors.black26,
                                              progressBarColor:
                                                  GFColors.SUCCESS,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2, 5, 7, 12),
                                              child: SizedBox(
                                                child: Text(
                                                  "10 % Completed",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Color(0xFF59D600)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
