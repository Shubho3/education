// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/Apis/auth.dart';
import 'package:Education/Screens/home/HomeScreen.dart';
import 'package:Education/model/LoginResponse.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Apis/interceptor.dart';
import '../../../main.dart';
import '../../../model/payment_methods.dart';
import '../../../utill/colors.dart';
import '../../../utill/util_funcs.dart';
import '../../../widgets/app_buttons.dart';
import 'cart_item.dart';

class PaymentWaitingScreen extends StatefulHookConsumerWidget {
  final PaymentMethodModel type;
  final String total;
  final String subtotal;
  final String StateTax;
  final String IuvTax;

  const PaymentWaitingScreen(
      {super.key,
      required this.type,
      required this.total,
      required this.IuvTax,
      required this.StateTax,
      required this.subtotal});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaymentWaitingScreenState();
}

class _PaymentWaitingScreenState extends ConsumerState<PaymentWaitingScreen> {
  static const platform = MethodChannel('printeractivity');
  String restaurant_name = "", restaurant_address = "";

  get appkey => null;

  String s(int length, [String c = ' ']) {
    return List.generate(length, (i) => c).join('');
  }

  @override
  Widget build(BuildContext context) {
    final receiptPrinting = useState(false);
    final loading = useState(true);
    final user = useRef<User?>(null);
    final cartItems = useState(<CartItem>[]);
    final totalAmount = useState(0.0);
    final anim = useState("assets/loding.json");

    Future<void> getCart() async {
      loading.value = true;
      user.value = await getUserDetails();
      final resp1 = await api().post(
        'get_cart',
        data: {
          "token": user.value?.token,
          "user_id": user.value?.id,
        },
      );
      restaurant_name = resp1.data['restaurant_name'].toString();
      restaurant_address = resp1.data['restaurant_address'].toString();
      cartItems.value = (resp1.data['result'] as List? ?? [])
          .map((e) => CartItem.fromMap(e))
          .toList();
      totalAmount.value = double.parse(widget.total);
      try {
        final resp = await api().post(
          'place_order',
          data: {
            "admin_id": user.value?.admin_id,
            "token": user.value?.token,
            "user_id": user.value?.id,
            'amount': totalAmount.value,
            'lat': user.value?.lon,
            'lon': user.value?.lat,
            'cart_id': cartItems.value.map((e) => e.cart_id).join(','),
            'item_id': cartItems.value.map((e) => e.item_id).join(','),
            'type': GetStorage().read('type') ?? '',
            'payment_type': widget.type.name,
            'app_order_status': "User",
            'order_mobile_no': "12234"
          },
        );
        debugPrint(
            '-------------------------------------------------${resp.data?['result']?['id']}');
        // showSuccessToast(context, message: "Order Placed Successfully");
        receiptPrinting.value = true;
        loading.value = false;
        anim.value = "assets/success.json";
        /*  if (Platform.isAndroid) {
          String? deviceToken = await notificationServices.getToken();
          await notificationServices.sendPushNotification(
              title: 'Order Placed',
              body: 'Your Order Has Placed Successfully',
              payload: 'testPayload',
              token: deviceToken!);
        }*/
        Timer.periodic(Duration(seconds: 3), (timer) async {
          Navigator.pop(context);
          Navigator.pop(context);
          final dynamic navBarState = MyGlobalKeys.tabBarKey.currentState;
          // Remember to use 'dynamic', instead of 'CurvedNavigationBarState'
          navBarState.setPage(0);
        });
      } catch (e) {
        loading.value = false;
        Get.back();
        showError(context, e);
        debugPrint('errrrr$e');
        debugPrint('errrrr${e.runtimeType}');
        debugPrint('errrrr${e.toString()}');
      }
    }

    useEffect(() {
      getCart();
      return;
    }, []);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (25 / 3.75).w),
          child: GestureDetector(
            onTap: () => receiptPrinting.value
                ? /* Get.to(() => ImageScreen()) */
                Get.offUntil(
                    MaterialPageRoute(
                        builder: (ctx) =>
                            HomeScreen(key: MyGlobalKeys.tabBarKey)),
                    (route) => route.isFirst)
                : receiptPrinting.value = true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sbh((20 / 3.75).w),
                Text("Payment",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: CC.blackPurple)),
                sbh((8 / 3.75).w),
                Text(
                    receiptPrinting.value
                        ? "Order placed successfully"
                        : "Placing your order...",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: CC.black)),
                sbh((20 / 3.75).w),
                Expanded(
                  child: Lottie.asset(anim.value ?? "assets/loding.json"),
                ),
                sbh((20 / 3.75).w),
                // if (receiptPrinting.value)
                Opacity(
                  opacity: !receiptPrinting.value ? 0 : 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          key: appkey,
                          onTap: () {
                            // MyGlobalKeys.tabBarKey.currentState!.onTap(0);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            final dynamic navBarState =
                                MyGlobalKeys.tabBarKey.currentState;
                            // Remember to use 'dynamic', instead of 'CurvedNavigationBarState'
                            navBarState.setPage(0);
                            /*   Get.offUntil(
                                MaterialPageRoute(builder: (ctx) =>  HomeScreen(key: MyGlobalKeys.tabBarKey)),
                                    (route) => route.isFirst);*/
                          },

                          /*Get.offUntil(
                              MaterialPageRoute(builder: (ctx) =>  HomeScreen(key: MyGlobalKeys.tabBarKey)),
                                  (route) => route.isFirst)*/
                          /* Get.offUntil(MaterialPageRoute(builder: (ctx) => const OrderNow())
                                  , (route) => route.isFirst)*/

                          text: 'Done')
                    ],
                  ),
                ),
                sbh((30 / 3.75).w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
