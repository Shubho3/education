import 'dart:convert';
import 'dart:developer';

import 'package:Education/utill/appImports.dart';

import '../model/app_details.dart';
import 'interceptor.dart';

void updateUserDetails(details) async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  // user_data=details;
  String user = jsonEncode(details);
  shared_User.setString('user_details', user);
  log("useruseruser" + user);
}

Future<User> getUserDetails() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String userMap = await shared_User.getString('user_details')!;
  String userS = (userMap == null) ? '' : userMap;
  Map<String, dynamic> user = jsonDecode(userS) as Map<String, dynamic>;
  print("getUserDetails" + user.toString());
  return User.fromJson(jsonDecode(userS)); //.toString();
  // }
}

void updateRestDetails(details) async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  // user_data=details;
  String user = jsonEncode(details);
  shared_User.setString('rest_details', user);
  log("useruseruser" + user);
}

Future<AppDetails> getRestDetails() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String userMap = await shared_User.getString('rest_details')!;
  String userS = (userMap == null) ? '' : userMap;
  Map<String, dynamic> user = jsonDecode(userS) as Map<String, dynamic>;
  print("AppDetailsAppDetailsAppDetails" + user.toString());
  return AppDetails.fromJson(jsonDecode(userS)); //.toString();
  // }
}

Future getCurrentUserId() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String? userMap = await shared_User.getString('user_details');
  String userS = (userMap == null) ? '' : userMap;
  Map<String, dynamic> user = jsonDecode(userS) as Map<String, dynamic>;
  //log('this is ' + user['id']);
  return user["id"].toString(); //.toString();
  // }
}

Future getRestaId() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String? userMap = await shared_User.getString('user_details');
  String userS = (userMap == null) ? '' : userMap;
  Map<String, dynamic> user = jsonDecode(userS) as Map<String, dynamic>;
  // log('this is '+user['user_id']);
  return user['restaurant_id'].toString(); //.toString();
  // }
}

void updateUserId(id) async {
  // await FlutterSession().set("user_id", id);
}

void updateToken(id) async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  await shared_User.setString('firebase_token', id);
}

Future getUpdatedToken() async {
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  return "${shared_User.getString('firebase_token')}";
}

Future isUserLoggedIn() async {
  final sharedUser = await SharedPreferences.getInstance();

  String? user = await sharedUser.getString('user_details');
  log(user.toString());

  if (user == null) {
    return false;
  } else {
    return true;
    log('user is already logged in ' + user);
  }
  // await FlutterSession().get("user_details", details);
}

Future logout() async {
  print('logout-----');
  // FirebasePushNotifications.update_device_token(false);
  new Future.delayed(const Duration(milliseconds: 5), () async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    await shared_User.clear();

    return true;
  });
}
