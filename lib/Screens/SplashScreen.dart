import 'package:Education/Screens/loginauth/LoginScreen.dart';

import '../Apis/interceptor.dart';
import '../model/app_details.dart';
import '../utill/SDP.dart';
import '../utill/appImports.dart';
import 'flutterflow/OnboardingWidget.dart';
import 'home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => getData());
  }

  getData() async {
    var userLoggedIn = await isUserLoggedIn();
    try {
      if (userLoggedIn) {
        var userId = await getUserDetails();
        Navigator.of(context).pushReplacement(
            createRoute(HomeScreen(key: MyGlobalKeys.tabBarKey)));
      } else {
        Navigator.of(context)
            .pushReplacement(createRoute(const LoginScreen()));
      }
    } catch (err) {
      print('errr-------$err');
      Navigator.of(context)
          .pushReplacement(createRoute(const LoginScreen()));
    }
  }

  Future<void> get_settings(User user) async {
    final res =
        await api().get(ApiUrls.get_app_setting + '?admin_id=${user.admin_id}');
    AppDetails model = AppDetails.fromJson(res.data);
    updateRestDetails(model);
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
/*
    return Scaffold(
      backgroundColor: CC.white,
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          width: 250,
          height: 200,
        ),
      ),
    );
*/
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover,),
              ),
            ),
            Center(
              child:  Center(
    child: Image.asset(
    'assets/icons/logo.png',
    width: 200,
    height: 200,
    )
            ),
            ),
          ],
        )
    );
  }
}
