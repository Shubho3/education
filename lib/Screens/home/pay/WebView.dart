import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Apis/interceptor.dart';
import '../../../model/payment_methods.dart';
import '../../../utill/colors.dart';
import '../../../utill/util_funcs.dart';
import 'cart_item.dart';


class WebViewScreen extends StatefulWidget {
  final PaymentMethodModel model;
  final String total;
  final String user_id;
  final String order_id;
  final String name;
  final String des;
  final String quantity;
  final String sub_total;
  final String tax;
  final String StateTax;
  final String token;
  final String cart_id;
  final String item_id;
  final String app_order_status;
  final String type;
  final List<CartItem> cartItems;

  const WebViewScreen(
      {super.key,
      required this.model,
      required this.total,
      required this.user_id,
      required this.order_id,
      required this.name,
      required this.des,
      required this.quantity,
      required this.sub_total,
      required this.tax,
      required this.StateTax,
      required this.token,
      required this.cart_id,
      required this.item_id,
      required this.app_order_status,
      required this.type,
      required this.cartItems});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen>
    with WidgetsBindingObserver {
  bool loader = true;
  var orderStatus = "";


  String s(int length, [String c = ' ']) {
    return List.generate(length, (i) => c).join('');
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("111111111111111111111111111111111111111111111111111111111");
      postData();
    }
  }

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'https://orkiosk.com/admin/webservice/ATH?'
        'token=${widget.token}'
        '&user_id=${widget.user_id}'
        '&amount=${widget.total}'
        '&lat=&lon='
        '&cart_id=${widget.cart_id}'
        '&item_id=${widget.item_id}'
        '&type=FromTable'
        '&payment_type=ATH'
        '&app_order_status=FromTable';

    print(url);
    //_launchInBrowser(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CC.appBarBackground,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        debuggingEnabled: true,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains("success.php")) {
            postData();
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  Future<void> get_data() async {
    String url = 'https://orkiosk.com/admin/webservice/ATH?'
        'token=${widget.token}'
        '&user_id=${widget.user_id}'
        '&amount=${widget.total}'
        '&lat=&lon='
        '&cart_id=${widget.cart_id}'
        '&item_id=${widget.item_id}'
        '&type=FromTable'
        '&payment_type=ATH'
        '&app_order_status=FromTable';
    await launchUrl(
        Uri.parse(url)); //launch is from url_launcher package to launch URL
  }
/*
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: WebViewConfiguration(
            enableDomStorage: true, enableJavaScript: true),
        webOnlyWindowName: "Pay with ATH Movil")) {
      throw Exception('Could not launch $url');
    }
  }*/

  Future<void> postData() async {
    try {
      var url =
          'https://orkiosk.com/admin/webservice/get_order_status?cart_id=${widget.cart_id.replaceAll(' ', '')}'; // Replace with your API endpoint
      final resp = await api().get(url);
      debugPrint('----------${resp.data}');
      debugPrint('----------${resp.data["message"]}');
      orderStatus = resp.data["message"];
      if (orderStatus == "successfull") {
        debugPrint('----------${resp.data["result"][0]["id"]}');
        showSuccessToast(context, message: "Order Placed Successfully");
       /* _startActivity(
            widget.cartItems, resp.data["result"][0]["id"].toString());
  */    } else {
        //      showError(context, "Waiting for Payment");
      }
    } catch (e) {
      showError(context, e);
      debugPrint('$e');
    }
  }
}
/*
import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:orkiosk/models/payment_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../apis/interceptor.dart';
import '../models/cart_item.dart';
import '../utils/colors.dart';
import '../utils/util_funcs.dart';
import '../widgets/app_buttons.dart';

class WebViewScreen extends StatefulWidget {
  final PaymentMethodModel model;
  final String total;
  final String user_id;
  final String order_id;
  final String name;
  final String des;
  final String quantity;
  final String sub_total;
  final String tax;
  final String StateTax;
  final String token;
  final String cart_id;
  final String item_id;
  final String app_order_status;
  final String type;
  final List<CartItem> cartItems;

  const WebViewScreen(
      {super.key,
      required this.model,
      required this.total,
      required this.user_id,
      required this.order_id,
      required this.name,
      required this.des,
      required this.quantity,
      required this.sub_total,
      required this.tax,
      required this.StateTax,
      required this.token,
      required this.cart_id,
      required this.item_id,
      required this.app_order_status,
      required this.type,
      required this.cartItems});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen>
    with WidgetsBindingObserver {
  bool loader = true;
  var orderStatus = "";

  static const platform = MethodChannel('printeractivity');

  String s(int length, [String c = ' ']) {
    return List.generate(length, (i) => c).join('');
  }

  Future<void> _startActivity(List<CartItem> cartItems, String? id) async {
    try {
      List<String> lines = [];
      lines.add('${s(20)}ORKIOSK');
      lines.add('');
      lines.add('Order ID :${s(12)}${id ?? '${Random().nextInt(100) + 100}'}');
      lines.add(
          'Time${s(5)}:${s(5)}${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now())}');
      lines.add('');
      lines.add(s(48, '-'));
      lines.add('');
      lines.add('Item${s(20)}Rate${s(4)}Qty${s(4)}Price');
      lines.add('');
      for (var i = 0; i < cartItems.length; i++) {
        final elem = cartItems[i];
        final rate = elem.item_price.toString();
        final qty = elem.quantity.toString();
        final price = (double.parse("0${elem.item_price}") *
                double.parse("0${elem.quantity}"))
            .toString();
        final afterName =
            '\$$rate${s(8 - rate.length - 1)}$qty${s(7 - qty.length)}\$$price';
        var itemName = elem.item_name;
        if (elem.options.isNotEmpty) {
          var opts = "";
          for (var els in elem.options) {
            if (els.statusType == "true") {
              if (opts == "") {
                opts = "" + els.name;
              } else {
                opts = opts + "," + els.name;
              }
            }
          }
          if (opts != "") itemName = '$itemName ($opts)';
        }
        if (itemName.length > 22) {
          lines.add(itemName);
          lines.add('${s(24)}$afterName');
        } else {
          lines.add('$itemName${s(24 - itemName.length)}$afterName');
        }
        lines.add('');
      }
      lines.add(s(48, '-'));
      lines.add('');
      final total = cartItems
          .fold(
              0.0,
              (previousValue, element) =>
                  double.parse(previousValue.toString()) +
                  (double.parse("0${element.quantity}") *
                      double.parse("0${element.item_price}")))
          .toStringAsFixed(2);
      double grandTotal;
      double per;
      double hh;
      hh = double.parse(appDetails.tax.split("%")[0]) / 100;
      per = double.parse(total) * hh;
      grandTotal = double.parse(total) + per;
      grandTotal = double.parse(widget.total);
      per = double.parse(widget.tax);
      print("grandTotalgrandTotal----------${grandTotal}");
      lines.add('Sub Total:${s(29)}\$${widget.sub_total}');
      lines.add('Mun. Tax :${s(29)}\$${widget.tax}');
      lines.add('State Tax :${s(28)}\$${widget.StateTax}');

      lines.add('Total    :${s(29)}\$${widget.total}');
      lines.add('');
      lines.add(s(48, '-'));
      lines.add('');
      lines.add('Payment Method:  ATH');
      lines.add('Payment ID    :  2');
      lines.add('');
      final type = '${GetStorage().read('type') ?? ""}';
      lines.add(
          '${s(((48 - type.length) / 2).floor())}$type${s(((48 - type.length) / 2).ceil())}');
      lines = lines.map((e) => "$e${s((48 - e.length).abs())}").toList();
      debugPrint("$lines.join('\n')");
      if (!kDebugMode) {
        final String result = await platform.invokeMethod(
          'start',
          {
            'data': json.encode(lines),
          },
        );

        debugPrint('Result:------------------- $result ');
        debugPrint("Error:------------------- '${result.toString()}'.");
      } else {
        final String result = await platform.invokeMethod(
          'start',
          {
            'data': json.encode(lines),
          },
        );
        debugPrint('Result:------------------- $result ');
        debugPrint("Error:------------------- '${result.toString()}'.");
        debugPrint("Error:------------------- result.toString()}'.");
      }
    } on PlatformException catch (e) {
      debugPrint("Error:----------- '${e.message}'.");
      debugPrint("Error:----------- '${e.details}'.");
      debugPrint("Error:----------- '${e.code}'.");
      debugPrint("Error:----------- '${e.stacktrace}'.");
      debugPrint("Error:----------- '${e.stacktrace}'.");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("111111111111111111111111111111111111111111111111111111111");
      postData();
    }
  }

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'https://orkiosk.com/admin/webservice/ATH?'
        'token=${widget.token}'
        '&user_id=${widget.user_id}'
        '&amount=${widget.total}'
        '&lat=&lon='
        '&cart_id=${widget.cart_id}'
        '&item_id=${widget.item_id}'
        '&type=FromTable'
        '&payment_type=ATH'
        '&app_order_status=FromTable';

    print(url);
    _launchInBrowser(Uri.parse(url));
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (25 / 3.75).w),
          child: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sbh((20 / 3.75).w),
                Text(" Waiting for Payment",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: CC.blackPurple)),
                sbh((8 / 3.75).w),
                Text("Complete Payment for placing your order...",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: CC.black)),
                sbh((20 / 3.75).w),
                Expanded(
                  child: Image.asset('assets/icons/atm_machine.png'),
                ),
                sbh((20 / 3.75).w),
                // if (receiptPrinting.value)
                AppButton(
                    padding: EdgeInsets.all(10),
                    onTap: () => _launchInBrowser(Uri.parse(url)),
                    text: 'Retry Payment'),
                sbh((30 / 3.75).w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> get_data() async {
    String url = 'https://orkiosk.com/admin/webservice/ATH?'
        'token=${widget.token}'
        '&user_id=${widget.user_id}'
        '&amount=${widget.total}'
        '&lat=&lon='
        '&cart_id=${widget.cart_id}'
        '&item_id=${widget.item_id}'
        '&type=FromTable'
        '&payment_type=ATH'
        '&app_order_status=FromTable';
    await launchUrl(
        Uri.parse(url)); //launch is from url_launcher package to launch URL
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: WebViewConfiguration(enableDomStorage: true,enableJavaScript: true)
        ,webOnlyWindowName: "Pay with ATH Movil"
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> postData() async {
    try {
      var url =
          'https://orkiosk.com/admin/webservice/get_order_status?cart_id=${widget.cart_id.replaceAll(' ', '')}'; // Replace with your API endpoint
      final resp = await api().get(url);
      debugPrint('----------${resp.data}');
      debugPrint('----------${resp.data["message"]}');
      orderStatus = resp.data["message"];
      if (orderStatus == "successfull") {
        debugPrint('----------${resp.data["result"][0]["id"]}');
        showSuccessToast(context, message: "Order Placed Successfully");
        _startActivity(
            widget.cartItems, resp.data["result"][0]["id"].toString());
      } else {
  //      showError(context, "Waiting for Payment");
      }
    } catch (e) {
      showError(context, e);
      debugPrint('$e');
    }
  }
}
*/
