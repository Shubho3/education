import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Education/Screens/home/Cart/CartHomeScreen.dart';
import 'package:Education/Screens/home/fav/CourseContentScreen.dart';
import 'package:Education/utill/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'HomeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  void onTap(int index) {
    setState(() {
      _currentindex = index;
    });
    print(_currentindex);
  }

  final pages = [
    HomeWidget(),
    CartHomeScreen(),
    CourseContentScreen(),
  ];

  DateTime? currentBackPressTime;
  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      // Fluttertoast.showToast(msg: "Press again to exit");
      return Future.value(false);
    }
    return Future.value(exit(0)); //back all class & exit
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: pages[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          selectedLabelStyle: TextStyle(
              height: 1.8,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'),
          unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xd5ffffff),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Home.png"),
                  size: 20,
                ),
                label: 'Home',
                backgroundColor: Color(0xff000000)),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/cart.png"),
                  size: 20,
                ),
                label: 'Cart',
                backgroundColor: Color(0xff000000)),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/heart.png"),
                  size: 20,
                ),
                label: 'Favorites',
                backgroundColor: Color(0xff000000)),
          ],
          currentIndex: _currentindex,
          unselectedItemColor: const Color(0xffB3B3B3),
          selectedItemColor: CC.themePurple,
          selectedIconTheme: const IconThemeData(
            color: CC.themePurple,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Color(0xffB3B3B3),
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: onTap,
        ),
      ),
    );
  }
}
