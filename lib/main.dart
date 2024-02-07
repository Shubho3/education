import 'dart:async';
import 'dart:developer';
import 'package:Education/utill/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:Education/Screens/loginauth/LoginScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/home/HomeScreen.dart';
String OrderType = 'Take Out';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    runApp(ProviderScope(child: MyApp()));
  }, (Object error, StackTrace stackTrace) {});
}


class MyGlobalKeys {
  static GlobalKey<HomeScreenState> tabBarKey = GlobalKey<HomeScreenState>();
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static GlobalKey mtAppKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        locale: Locale(GetStorage().read('locale') ??
            'en'), // translations will be displayed in that locale
        key: mtAppKey,
        title: 'OrKiosk User',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: CC.themePurple,
          fontFamily: 'Poppins',
          appBarTheme: AppBarTheme(
            backgroundColor: CC.appBarBackground,
            elevation: 0,
            titleTextStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: CC.black),
            foregroundColor: CC.black,
            toolbarHeight: 30.sp,
            iconTheme: IconThemeData(size: 24.sp),
            centerTitle: true,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: CC.extraLightWhite,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: CC.extraLightWhite),
                borderRadius: BorderRadius.circular(15.sp)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CC.extraLightWhite),
                borderRadius: BorderRadius.circular(15.sp)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CC.themePurple, width: 2),
                borderRadius: BorderRadius.circular(15.sp)),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(CC.themePurple),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          scaffoldBackgroundColor: CC.screenBackground,
        ),
        //       home: const SplashScreen(),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const SplashScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/Foo': (context) => const LoginScreen(),
          '/Home': (context) => HomeScreen(key: MyGlobalKeys.tabBarKey),
        },
        //    home: const TerminalScreen(),
      );
    });
  }
}
