import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../utill/appImports.dart';
import '../widgets/showSnackbar.dart';

class Webservices {
  static Future<http.Response> getData(String url) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    log('called $url');
    try {
      response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode != 200) {
        print('The response status for url $url is ${response.statusCode}');
      }
      // log(response.body);
    } catch (e) {
      // showSnackbar(context, text)
      log('Error in $url : ------ $e');
    }

    return response;
  }

  static Future<Map<String, dynamic>> postData(
      {required String apiUrl,
      required Map<String, dynamic> body,
      bool showSuccessMessage = false,
      required BuildContext context}) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    try {
      log('the request for $apiUrl is $body');
      response = await http.post(Uri.parse(apiUrl), body: body);
      log('123456789ssss-----333--------${response.statusCode}');
      log('123456789ssss-----333--------${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        if (jsonResponse['status'].toString() == '1' ||
            jsonResponse['status'].toString() == 'true') {
          print("if");
          if (showSuccessMessage)
            // showSnackbar(context, jsonResponse['message'].toString());
            return jsonResponse;
        } else {
          //  showSnackbar(context, jsonResponse['result'].toString());
        }
        return jsonResponse;
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        return jsonResponse;

        //  ShowToast.ShowT0astError(
        //  convert.jsonDecode(response.body)['error'].toString());
      }
    } catch (e) {
      log('Error in $apiUrl : ------ $e');
    }
    print(
        'Error in api failed of url $apiUrl with response code ${response.statusCode} and body ${response.body}');
    log(response.body);
    return {"status": 0, "message": "api failed"};
  }

  static Future<Map<String, dynamic>> postDataWithToken(
      {required String apiUrl,
      required Map<String, dynamic> body,
      bool showSuccessMessage = false,
      required BuildContext context}) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    try {
      log('the request for $apiUrl is $body');
      Map<String, String> header = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      response =
          await http.post(Uri.parse(apiUrl), body: body, headers: header);
      log('123456789ssss-----333--------${response.statusCode}');
      log('123456789ssss-----333--------${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        if (jsonResponse['status'].toString() == '1' ||
            jsonResponse['status'].toString() == 'true') {
          print("if");
          if (showSuccessMessage)
            // showSnackbar(context, jsonResponse['message'].toString());
            return jsonResponse;
        } else {
          //  showSnackbar(context, jsonResponse['result'].toString());
        }
        return jsonResponse;
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        return jsonResponse;

        //  ShowToast.ShowT0astError(
        //  convert.jsonDecode(response.body)['error'].toString());
      }
    } catch (e) {
      log('Error in $apiUrl : ------ $e');
    }
    print(
        'Error in api failed of url $apiUrl with response code ${response.statusCode} and body ${response.body}');
    log(response.body);
    return {"status": 0, "message": "api failed"};
  }

  static Future<Map<String, dynamic>> signuppostData(
      {required String apiUrl,
      required Map<String, dynamic> body,
      bool showSuccessMessage = false,
      required BuildContext context}) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    try {
      log('the request for $apiUrl is $body');
      response = await http.post(Uri.parse(apiUrl), body: body);
      log('123456789ssss-----333--------${response.statusCode}');
      log('123456789ssss-----333--------${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        if (jsonResponse['status'].toString() == '1' ||
            jsonResponse['status'].toString() == 'true') {
          print("if");
          if (showSuccessMessage)
            showSnackbar(context, jsonResponse['message'].toString());
          return jsonResponse;
        } else {
          showSnackbar(context, jsonResponse['result'].toString());
        }
        return jsonResponse;
      } else {
        ShowToast.ShowT0astError(
            convert.jsonDecode(response.body)['result'].toString());
      }
    } catch (e) {
      log('Error in $apiUrl : ------ $e');
    }
    print(
        'Error in api failed of url $apiUrl with response code ${response.statusCode} and body ${response.body}');
    log(response.body);
    return {"status": 0, "message": "api failed"};
  }

  static Future<Map<String, dynamic>> postRAWData(
      {required String apiUrl,
      required Map<String, dynamic> body,
      bool showSuccessMessage = false,
      required BuildContext context}) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    try {
      log('the request for $apiUrl is $body');
      String requestBody = jsonEncode(body);

      // Set the request headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      response = await http.post(Uri.parse(apiUrl),
          body: requestBody, headers: headers);
      log('123456789ssss-----333--------${response.body}');
      log('123456789ssss-----333--------${response.statusCode}');

      if (response.statusCode == 200) {
        print('123456789ssss-------------${response.body}');
        var jsonResponse = convert.jsonDecode(response.body);
        log('the response for $apiUrl is $jsonResponse');
        if (jsonResponse['status'].toString() == '1') {
          if (showSuccessMessage)
            // showSnackbar(context, jsonResponse['message']);
            return jsonResponse;
        } else {
          // showSnackbar(context, jsonResponse['message']);
        }
        return jsonResponse;
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      }
    } catch (e) {
      log('Error in $apiUrl : ------ $e');
    }
    print(
        'Error in api failed of url $apiUrl with response code ${response.statusCode} and body ${response.body}');
    log(response.body);
    return {"status": 0, "message": "api failed"};
  }

  static Future<List> postRAWDataGetList(
      {required String apiUrl,
      required Map<String, dynamic> body,
      bool showSuccessMessage = false,
      required BuildContext context}) async {
    http.Response response =
        http.Response('{"message":"failure","status":0}', 404);
    try {
      log('the request for $apiUrl is $body');
      String requestBody = jsonEncode(body);

      // Set the request headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      response = await http.post(Uri.parse(apiUrl),
          body: requestBody, headers: headers);
      log('123456789ssss-----333--------${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['status'] == "true") {
          log('the respognse for url: $apiUrl is ${jsonResponse}');
          return jsonResponse['data'] ?? [];
        } else {
          log('Error in response for url $apiUrl -----${response.body}');
        }
      } else {
        print('error in status code ${response.statusCode}');
        log(response.body);
      }
    } catch (e) {
      print(
          'inside catch block. Error in getting response for search doctors 564 $e');
    }

    return [];
  }

  static Future<Map<String, dynamic>> getMap(String url,
      {Map<String, dynamic>? request, bool allData = false}) async {
    Map<String, dynamic> tempRequest = {};
    if (request != null) {
      request.forEach((key, value) {
        if (value != null) {
          tempRequest['$key'] = value;
        }
      });
    }
    try {
      log('the request for url $url is $tempRequest');
      late http.Response response;
      if (request == null) {
        response = await http.get(Uri.parse(url));
      } else {
        response = await http.post(Uri.parse(url), body: tempRequest);
      }
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['status'].toString() == '1') {
          // log('the respognse for url: $url is ${jsonResponse}');
          if (allData != true) {
            return jsonResponse['result'] ?? jsonResponse ?? {};
          } else {
            return jsonResponse;
          }
        } else {
          log('Error in response for url $url -----${response.body}');
        }
      } else {
        print('error in status code ${response.statusCode}');
        log(response.body);
      }
    } catch (e) {
      print(
          'inside catch block. Error in getting response for search doctors 546745 $e');
    }

    return {};
  }

  static Future<List> getList(String url) async {
    var response = await getData(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse['status'].toString() == 'true') {
        log('the response for url: $url is ${jsonResponse}');
        return jsonResponse['result'] ?? [];
      } else {
        log('Error in response for url $url -----${response.body}');
      }
    }
    return [];
  }

  static Future<List> getListFromRequestParameters(
      String url, Map<String, dynamic> request) async {
    Map<String, dynamic> tempRequest = {};
    request.forEach((key, value) {
      if (value != null) {
        tempRequest['$key'] = value;
      }
    });
    try {
      log('the request for url $url is $tempRequest');
      var response = await http.post(Uri.parse(url), body: tempRequest);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['status'] == "true") {
          log('the respognse for url: $url is ${jsonResponse}');
          return jsonResponse['data'] ?? [];
        } else {
          log('Error in response for url $url -----${response.body}');
        }
      } else {
        print('error in status code ${response.statusCode}');
        log(response.body);
      }
    } catch (e) {
      print(
          'inside catch block. Error in getting response for search doctors 564 $e');
    }

    return [];
  }

  static Future<Map<String, dynamic>> postDataWithImageFunction({
    required Map<String, dynamic> body,
    required Map<String, dynamic> files,
    required BuildContext context,
    required String apiUrl,
    bool successAlert = false,
    bool errorAlert = true,
  }) async {
    print('the request is $body');
    var url = Uri.parse(apiUrl);
    //
    log(apiUrl);
    try {
      var request = new http.MultipartRequest("POST", url);
      body.forEach((key, value) {
        request.fields[key] = value;
        // log(value2);
      });

      if (files != null) {
        (files as Map<dynamic, dynamic>).forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path));
        });
      }

      log(request.fields.toString());
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      log(response.body);
      var jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['status'] == 1) {
        if (successAlert) {
          showSnackbar(context, jsonResponse['message']);
        }
      } else {
        if (errorAlert) {
          showSnackbar(context, jsonResponse['message']);
        }
      }
      return jsonResponse;
      // return response;
    } catch (e) {
      print(e);
      try {
        var response = await http.post(url, body: body);
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          return jsonResponse;
        }
      } catch (error) {
        print('inside double catch block $error');
      }
      return {'status': 0, 'message': "fail"};
      // return null;
    }
  }

  static Future<void> updateDeviceToken({
    required String userId,
    required String token,
  }) async {
    var request = {
      "user_id": userId,
      "device_id": token,
    };
    print(
        'the device token request for url ${ApiUrls.get_category} is $request');
    try {
      var response = await http.post(
        Uri.parse(ApiUrls.get_category),
        body: request,
      );
      if (response.statusCode == 200) {
        print('the device token is updated');
      } else {
        print('error in device token with status code ${response.statusCode}');
        log(response.body);
      }
    } catch (e) {
      print('error in device token:  $e');
    }
  }

  static Future<dynamic> getListModelFromUrl(String url) async {
    var response = await getData(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse['status'].toString() == '1') {
        log('the response for url: $url is ${jsonResponse}');
        return jsonResponse;
      } else {
        log('Error in response for url $url -----${response.body}');
      }
    }
    return null;
  }
}

class ApiUrls {
  static const baseUrl = 'https://orkiosk.com/admin/webservice/';

  static const login = '${baseUrl}login';
  static const register = '${baseUrl}register';
  static const get_admin_list = '${baseUrl}get_admin_list';
  static const get_category_new = '${baseUrl}get_category_new';
  static const add_favorite_item = '${baseUrl}add_favorite_item';
  static const get_about_us = '${baseUrl}api/user/get-about-us?';
  static const get_privacy_policy = '${baseUrl}api/user/get-privacy-policy?';
  static const get_category = '${baseUrl}get_category_new';
  static const get_publication = '${baseUrl}get_instractuion';
  static const get_item_new = '${baseUrl}get_item_new';
  static const get_favorite_item = '${baseUrl}get_favorite_item';
  static const add_to_card = '${baseUrl}add_to_card';
  static const get_cart = '${baseUrl}get_cart';
  static const get_profile = '${baseUrl}get_profile';
  static const get_app_setting = '${baseUrl}get_app_setting';
}
