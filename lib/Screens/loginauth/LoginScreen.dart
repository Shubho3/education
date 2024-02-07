import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../utill/SDP.dart';
import '../../utill/appImports.dart';
import '../home/HomeScreen.dart';
import '../home/HomeWidget.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  var formKey = GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    SDP.init(context);
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              height: SDP.height,
              width: SDP.width,
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          sbh(200),
                      Image.asset(
                          'assets/icons/logo.png', width: SDP.width! / 1.5,
                          height: SDP.width! / 6),
                      sbh(100),
                      Text('Entrar',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: CC.blackPurple)),
                      sbh(30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                        child: Column(
                          children: [
                            AppTextFormField(
                              controller: emailCon,
                              floatingLabel: 'Nome de usuário ou e-mail *',
                              keyboardType: TextInputType.emailAddress,
                              validator: (text) =>
                              validateEmail(text) == null
                                  ? null
                                  : "Digite um endereço de e-mail válido",
                              onSaved: (text) => email = text ?? "",
                            ),
                            sbh(30),
                            PasswordField(
                              controller: passwordCon,
                              floatingLabel: 'Senha *',
                              // obscureText: true,
                              validator: (text) =>
                              text?.isNotEmpty == true
                                  ? null
                                  : "Obrigatório",
                              onSaved: (text) => password = text ?? "",
                            ),
                          ],
                        ),
                      ),
                      sbh(20),
                      /*  GestureDetector(
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: CC.themePurple),
                            ),
                          ),
                          sbh(20),*/
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                      AppButton(
                      padding: EdgeInsets.symmetric(horizontal: 34,
                          vertical: 12),

                      onTap: () => login(),
              text: "Acessar",

            ),
          ],
        ),
        sbh(20),
        sbh(20),
        ],
      ),
    ),
    ),
    ),
    ],
    ),
    bottomNavigationBar: GestureDetector(
    onTap: () {
    //   Navigator.push(context, createRoute(const SignupScreen()));
    },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(
    'Perdeu sua senha?',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    decoration: TextDecoration.underline,
    color: CC.red),
    ),
    ),
    ],
    ),
    )
    ,
    );
  }

  login() async {
    Navigator.push(
        context, createRoute(HomeWidget
      (key: MyGlobalKeys.tabBarKey)));

    /* if (formKey.currentState?.validate() == true) {
      ShowLoader.loadingShow(context);
        String? registerId = " NotificationServices.instance().getToken()";

      log("------------------------------" + registerId!);
      Map<String, dynamic> data = {
        'email': emailCon.text.toString(),
        'type': "Real_user",
        'password': passwordCon.text.toString(),
        'register_id': registerId ?? "register_id",
      };
      var res = await Webservices.postData(
          apiUrl: ApiUrls.login, body: data, context: context);
      ShowLoader.loadingHide(context);
      if (res['status'] == "1") {
        try {
          final signUp = LoginResponse.fromJson(res);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', signUp.user!.id.toString());
          await prefs.setString('token', signUp.user!.token.toString());
          updateUserDetails(signUp.user!);
          ShowToast.ShowT0astSuccess("Login Successful");
          Navigator.push(
              context, createRoute(HomeScreen(key: MyGlobalKeys.tabBarKey)));
        } catch (e) {
          ShowLoader.loadingHide(context);
        }
      } else {
        ShowToast.ShowT0astError(res['message']);
      }
    } else {
      ShowToast.ShowT0astError("Fields Can't be Empty");
    }*/
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty | !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}
