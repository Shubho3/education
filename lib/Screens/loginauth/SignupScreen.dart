import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/ResturentRes.dart';
import '../../utill/SDP.dart';
import '../../utill/appImports.dart';
import '../home/HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String user_name = "";
  String email = "";
  String password = "";
  String password2 = "";
  TextEditingController user_nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController password2Con = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getReport("");
    super.initState();
  }

  bool loading = true;
  bool data = true;
  ResturentRes? profileRes;
  String selectedType = "Select Restaurant";
  String selectedID = "";
  var eventValue;

  getReport(String year) async {
    setState(() {
      loading = true;
      data = true;
    });

    var res =
        await Webservices.getListModelFromUrl("${ApiUrls.get_admin_list}");
    try {
      if (res["status"] == "1" && res["years"].toString() != "[]") {
        profileRes = ResturentRes.fromJson(res);
        log("-------------------$profileRes");
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
    return kIsWeb?Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sbh(10),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                    color: Colors.brown,
                  ),
                  sbh(40),
                  Text('Sign Up ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: CC.blackPurple)),
                  sbh(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        loading
                            ? Center(
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: LinearProgressIndicator(
                                backgroundColor: CC.themePurple,
                                color: CC.themePurple,
                                minHeight: 2,
                              ),
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
                                      style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CC.themePurple),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                            : Wrap(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Result selectedValue =
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          20)),
                                  backgroundColor:
                                  Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return BottomSheetContent(
                                      data: profileRes!.result!,
                                    );
                                  },
                                );
                                log("--------" +
                                    selectedValue.toString());
                                if (selectedValue != null) {
                                  setState(() {
                                    selectedType =
                                    selectedValue.rest_name!;
                                    selectedID = selectedValue.id!;
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 1, bottom: 20),
                                height: 60,
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CC.red,
                                    ),
                                    borderRadius:
                                    const BorderRadius.only(
                                        topLeft:
                                        Radius.circular(15),
                                        topRight:
                                        Radius.circular(15),
                                        bottomLeft:
                                        Radius.circular(15),
                                        bottomRight:
                                        Radius.circular(
                                            15)),
                                    color: CC.white),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 25, right: 5),
                                      child: Text.rich(
                                        TextSpan(
                                          children: <InlineSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontFamily:
                                                    'Poppins',
                                                    fontWeight:
                                                    FontWeight
                                                        .w400,
                                                    fontSize: 16.sp,
                                                    color: CC
                                                        .blackPurple),
                                                text: selectedType),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          5, 0, 15, 5),
                                      child: Icon(
                                          Icons.arrow_drop_down,
                                          size: 30,
                                          color: CC.themePurple),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppTextFormField(
                          controller: user_nameCon,
                          floatingLabel: 'User Name',
                          keyboardType: TextInputType.name,
                          validator: (text) =>
                          text?.isNotEmpty == true ? null : "Required",
                          onSaved: (text) => user_name = text ?? "",
                        ),
                        sbh(30),
                        AppTextFormField(
                          controller: emailCon,
                          floatingLabel: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) => validateEmail(text) == null
                              ? null
                              : "Enter a valid email address",
                          onSaved: (text) => email = text ?? "",
                        ),
                        sbh(30),
                        PasswordField(
                          controller: passwordCon,
                          floatingLabel: 'Password',
                          // obscureText: true,
                          validator: (text) =>
                          text?.isNotEmpty == true ? null : "Required",
                          onSaved: (text) => password = text ?? "",
                        ),
                        sbh(30),
                        PasswordField(
                          controller: password2Con,
                          floatingLabel: 'Confirm Password',
                          // obscureText: true,
                          validator: (text) =>
                          text?.isNotEmpty == true ? null : "Required",
                          onSaved: (p0) {
                            log("----$password2");
                            password2 = p0 ?? "";
                          },
                        ),
                      ],
                    ),
                  ),
                  sbh(30),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          onTap: () => signup(),
                          text: "Sign UP",
                          //    loading: loading.value,
                        ),
                      ],
                    ),
                  ),

                  sbh(20),
                  sbh(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Already have an account? SIGN IN',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.underline,
                          color: CC.themePurple),
                    ),
                  ),
                  sbh(20),
                ],
              ),
            ),
          ),
        ),
      ),
    ):
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
                    sbh(100),
                    Image.asset(
                      'assets/images/logo.png',
                      width: SDP.width! / 1.5,
                      color: Colors.brown,
                    ),
                    sbh(40),
                    Text('Sign Up ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: CC.blackPurple)),
                    sbh(30.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                      child: Column(
                        children: [
                          loading
                              ? Center(
                                  child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: LinearProgressIndicator(
                                    backgroundColor: CC.themePurple,
                                    color: CC.themePurple,
                                    minHeight: 2,
                                  ),
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
                                              style: GoogleFonts.josefinSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: CC.themePurple),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                  : Wrap(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Result selectedValue =
                                                await showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              builder: (BuildContext context) {
                                                return BottomSheetContent(
                                                  data: profileRes!.result!,
                                                );
                                              },
                                            );
                                            log("--------" +
                                                selectedValue.toString());
                                            if (selectedValue != null) {
                                              setState(() {
                                                selectedType =
                                                    selectedValue.rest_name!;
                                                selectedID = selectedValue.id!;
                                              });
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 1, bottom: 20),
                                            height: SDP.sdp(35),
                                            width: SDP.sdp(300),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: CC.red,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15)),
                                                color: CC.white),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 5),
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: <InlineSpan>[
                                                        TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16.sp,
                                                                color: CC
                                                                    .blackPurple),
                                                            text: selectedType),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 0, 15, 5),
                                                  child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 30,
                                                      color: CC.themePurple),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                          AppTextFormField(
                            controller: user_nameCon,
                            floatingLabel: 'User Name',
                            keyboardType: TextInputType.name,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (text) => user_name = text ?? "",
                          ),
                          sbh(30),
                          AppTextFormField(
                            controller: emailCon,
                            floatingLabel: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) =>
                            validateEmail(text) == null
                                ? null
                                : "Enter a valid email address",
                            onSaved: (text) => email = text ?? "",
                          ),
                          sbh(30),
                          PasswordField(
                            controller: passwordCon,
                            floatingLabel: 'Password',
                            // obscureText: true,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (text) => password = text ?? "",
                          ),
                          sbh(30),
                          PasswordField(
                            controller: password2Con,
                            floatingLabel: 'Confirm Password',
                            // obscureText: true,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (p0) {
                              log("----$password2");
                              password2 = p0 ?? "";
                            },
                          ),
                        ],
                      ),
                    ),
                    sbh(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          onTap: () => signup(),
                          text: "Sign UP",
                        ),
                      ],
                    ),
                    sbh(20),
                    sbh(20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Already have an account? SIGN IN',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                            color: CC.themePurple),
                      ),
                    ),
                    sbh(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  signup() async {
    if (formKey.currentState?.validate() == true&& selectedID != "") {
      log("------------------$email");
      log("------------------$password");
      log("------------------$password2");
      if (passwordCon.text == password2Con.text) {
        ShowLoader.loadingShow(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, dynamic> data = {
          'user_name': user_nameCon.text.toString(),
          'email': emailCon.text.toString(),
          'mobile': "1111",
          'type': "Real_user",
          'password': passwordCon.text.toString(),
          'register_id': "register_id" ?? "register_id",
          'admin_id': selectedID ?? "register_id",
        };
        var res = await Webservices.signuppostData(
            apiUrl: ApiUrls.register, body: data, context: context);
        if (res['status'].toString() == "1") {
          final signUp = LoginResponse.fromJson(res);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', signUp.user!.id.toString());
          await prefs.setString('token', signUp.user!.token.toString());
          updateUserDetails(signUp.user!);
          ShowToast.ShowT0astSuccess("Signup Successful");
          ShowLoader.loadingHide(context);
          Navigator.push(
              context, createRoute(HomeScreen(key: MyGlobalKeys.tabBarKey)));
        } else {
          ShowLoader.loadingHide(context);
          ShowToast.ShowT0astError(res['error']);
        }
      } else {
        ShowToast.ShowT0astError("Password don't match");
      }
    } else {
      ShowToast.ShowT0astError("Fields Can't be Empty");
    }
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

class BottomSheetContent extends StatefulWidget {
  final List<Result> data;

  const BottomSheetContent({super.key, required this.data});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController _searchController = TextEditingController();
  final List<Result> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(widget.data);
  }

  void _filterList(String searchText) {
    _filteredItems.clear();
    if (searchText.isEmpty) {
      _filteredItems.addAll(widget.data);
    } else {
      _filteredItems.addAll(widget.data.where((item) => item.rest_name
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase())));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, SDP.height! / 3, 0, 0),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F7FA),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: SDP.sdp(40),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: CC.red,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: CC.white),
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                _filterList(value);
                              },
                              decoration: InputDecoration(
                                hintText: 'Search...',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _filteredItems.length,
                            itemBuilder: (context, index) {
                              Result innerdata = _filteredItems[index];
                              return ListTile(
                                title: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Name : " + innerdata.rest_name!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: CC.themePurple),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Address : " + innerdata.address!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: CC.themePurple),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context, innerdata);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )))),
    );
  }
}
/*
import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/ResturentRes.dart';
import '../../utill/appImports.dart';
import '../home/HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String user_name = "";
  String email = "";
  String password = "";
  String password2 = "";
  TextEditingController user_nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController password2Con = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getReport("");
    super.initState();
  }

  bool loading = true;
  bool data = true;
  ResturentRes? profileRes;
  String selectedType = "Select Restaurant";
  String selectedID = "";
  var eventValue;

  getReport(String year) async {
    setState(() {
      loading = true;
      data = true;
    });

    var res =
        await Webservices.getListModelFromUrl("${ApiUrls.get_admin_list}");
    try {
      if (res["status"] == "1" && res["years"].toString() != "[]") {
        profileRes = ResturentRes.fromJson(res);
        log("-------------------$profileRes");
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
                    sbh(100),
                    Image.asset(
                      'assets/images/logo.png',
                      width: SDP.width! / 1.5,
                      color: Colors.brown,
                    ),
                    sbh(40),
                    Text('Sign Up ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: CC.blackPurple)),
                    sbh(30.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                      child: Column(
                        children: [
                          loading
                              ? Center(
                                  child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: LinearProgressIndicator(
                                    backgroundColor: CC.themePurple,
                                    color: CC.themePurple,
                                    minHeight: 2,
                                  ),
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
                                              style: GoogleFonts.josefinSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: CC.themePurple),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 2,
                                              left: 2,
                                              bottom: 15,
                                              top: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: CC.red,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomLeft:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15)),
                                              color: CC.white),
                                          child: DropdownSearch<Result>(
                                            asyncItems: (filter) =>
                                                getData(filter),
                                            compareFn: (i, s) => i.isEqual(s),
                                            popupProps: PopupPropsMultiSelection
                                                .modalBottomSheet(
                                              isFilterOnline: false,
                                              showSelectedItems: false,
                                              showSearchBox: true,
                                              itemBuilder:
                                                  _customPopupItemBuilderExample2,
                                              favoriteItemProps:
                                                  FavoriteItemProps(
                                                showFavoriteItems: true,
                                                favoriteItems: (us) {
                                                  return us
                                                      .where((e) => e.name!
                                                          .contains("Mrs"))
                                                      .toList();
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
*/
/*
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 2,
                                              left: 2,
                                              bottom: 15,
                                              top: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: CC.red,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomLeft:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15)),
                                              color: CC.white),
                                          child: DropdownSearch<Result>(
                                            popupProps: PopupProps.menu(
                                              itemBuilder:
                                                  (context, item, isSelected) {
                                                return Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Text(
                                                            "Name :-" +
                                                                item.rest_name!,
                                                            style: GoogleFonts
                                                                .josefinSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: CC
                                                                        .themePurple)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Text(
                                                            "Address :-" +
                                                                item.rest_name!,
                                                            style: GoogleFonts
                                                                .josefinSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14.sp,
                                                                    color: CC
                                                                        .themePurple)),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: CC.red,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.sp),
                                                ),
                                                labelText: "Restaurant",
                                                hintText:
                                                    "Select an Restaurant",
                                                filled: false,
                                              ),
                                            ),
                                            asyncItems: (String filter) =>
                                                getData(filter),
                                            itemAsString: (Result u) =>
                                                u.userAsString(),
                                            onChanged: (Result? data) =>
                                                print(data),
                                          ),
                                        ),
*/ /*

                                      ],
                                    ),
                          AppTextFormField(
                            controller: user_nameCon,
                            floatingLabel: 'User Name',
                            keyboardType: TextInputType.name,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (text) => user_name = text ?? "",
                          ),
                          sbh(30),
                          AppTextFormField(
                            controller: emailCon,
                            floatingLabel: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) => validateEmail(text) == null
                                ? null
                                : "Enter a valid email address",
                            onSaved: (text) => email = text ?? "",
                          ),
                          sbh(30),
                          PasswordField(
                            controller: passwordCon,
                            floatingLabel: 'Password',
                            // obscureText: true,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (text) => password = text ?? "",
                          ),
                          sbh(30),
                          PasswordField(
                            controller: password2Con,
                            floatingLabel: 'Confirm Password',
                            // obscureText: true,
                            validator: (text) =>
                                text?.isNotEmpty == true ? null : "Required",
                            onSaved: (p0) {
                              log("----$password2");
                              password2 = p0 ?? "";
                            },
                          ),
                        ],
                      ),
                    ),
                    sbh(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          onTap: () => signup(),
                          text: "Sign UP",
                        ),
                      ],
                    ),
                    sbh(20),
                    sbh(20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Already have an account? SIGN IN',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                            color: CC.themePurple),
                      ),
                    ),
                    sbh(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, Result item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      color: CC.white,
      child: ListTile(
        selected: isSelected,
        title: Text(item.name!),
        subtitle: Text(item.address.toString()),
      ),
    );
  }

  Future<List<Result>> getData(filter) async {
    return profileRes!.result!;
  }

  signup() async {
    if (formKey.currentState?.validate() == true || selectedID != "") {
      log("------------------$email");
      log("------------------$password");
      log("------------------$password2");
      if (passwordCon.text == password2Con.text) {
        ShowLoader.loadingShow(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, dynamic> data = {
          'user_name': user_nameCon.text.toString(),
          'email': emailCon.text.toString(),
          'mobile': "1111",
          'type': "Real_user",
          'password': passwordCon.text.toString(),
          'register_id': "register_id" ?? "register_id",
          'admin_id': selectedID ?? "register_id",
        };
        var res = await Webservices.signuppostData(
            apiUrl: ApiUrls.register, body: data, context: context);
        if (res['status'].toString() == "1") {
          final signUp = LoginResponse.fromJson(res);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', signUp.user!.id.toString());
          await prefs.setString('token', signUp.user!.token.toString());
          updateUserDetails(signUp.user!);
          ShowToast.ShowT0astSuccess("Signup Successful");
          ShowLoader.loadingHide(context);
          Navigator.push(
              context, createRoute(HomeScreen(key: MyGlobalKeys.tabBarKey)));
        } else {
          ShowLoader.loadingHide(context);
          ShowToast.ShowT0astError(res['error']);
        }
      } else {
        ShowToast.ShowT0astError("Password don't match");
      }
    } else {
      ShowToast.ShowT0astError("Fields Can't be Empty");
    }
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

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  TextEditingController _searchController = TextEditingController();
  List<String> _items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CC.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                  onTap: () {
                    // Handle item tap
                    Navigator.pop(context, _items[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
