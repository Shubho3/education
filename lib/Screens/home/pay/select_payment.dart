import 'dart:developer';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:Education/Screens/home/pay/payment_waiting_screen.dart';
import 'package:Education/Screens/home/pay/web_view_payment.dart';
import 'package:Education/utill/appImports.dart';

import '../../../Apis/interceptor.dart';
import '../../../model/payment_methods.dart';
import '../../../utill/SDP.dart';
import 'WebView.dart';
import 'add_card.dart';
import 'cart_item.dart';

class SelectPayment extends StatefulHookConsumerWidget {
  final String totalAmount;
  final String subTotal;
  final String StateTax;
  final String IUVTax;

  const SelectPayment(
      {super.key,
      required this.totalAmount,
      required this.IUVTax,
      required this.StateTax,
      required this.subTotal});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends ConsumerState<SelectPayment> {
  @override
  Widget build(BuildContext context) {
    print("Payment failed  ---------- ${widget.totalAmount}");

    final loading = useState(true);
    final user = useRef<User?>(null);
    final paymentMethods = useState(<PaymentMethodModel>[]);
    final cartLoading = useState(false);
    final totalAmount = useState(double.parse(widget.totalAmount));
    final cartItems = useState(<CartItem>[]);
    final userName = TextEditingController();
    final userEmail = TextEditingController();

    Future<void> getPaymentMethods() async {
      loading.value = true;
      try {
        user.value = await getUserDetails();

        final userx = await getUserDetails();

        final resp1 =
            await api().get('payments_methods?admin_id=${userx.admin_id}');
        // debugPrint('${resp1.data}');
        log("-----------------------$resp1");
        var list = (resp1.data['result'] as List? ?? [])
            .map((e) => PaymentMethodModel.fromMap(e))
            .toList();
        list.removeWhere((person) => person.name == "Pay By Terminal");
        paymentMethods.value = list;

        loading.value = false;
      } catch (e) {
        loading.value = false;
        Get.back();
        showError(context, e);
        debugPrint('$e');
      }
    }

    void getCart() async {
      cartLoading.value = true;
      user.value = await getUserDetails();

      try {
        final resp = await api().post(
          'get_cart',
          data: {
            "token": user.value?.token,
            "user_id": user.value?.id,
          },
        );
        // debugPrint('${resp.data}');
        cartItems.value = (resp.data['result'] as List? ?? [])
            .map((e) => CartItem.fromMap(e))
            .toList();
        totalAmount.value =
            double.tryParse('${resp.data['total_amount']}') ?? 0.0;
        cartLoading.value = false;
      } catch (e) {
        cartLoading.value = false;
        showError(context, e);
        debugPrint('$e');
      }
    }

    useEffect(() {
      getPaymentMethods();
      getCart();
      return;
    }, []);

    Future<void> continueCryptoPayment() async {
      loading.value = true;
      try {
        final resp1 = await api().post(
          'add_coinbase_charge',
          data: {
            "token": user.value?.token,
            "user_id": user.value?.id,
            "description":
                'Payment for: ${cartItems.value.map((e) => e.item_name).join(', ')}',
            "amount": totalAmount.value,
            "currency": "USD",
            "id": user.value?.id,
            "name": userName.text,
            "customer_email": userEmail.text,
          },
        );
        // debugPrint('${resp1.data}');
        if (resp1.data?['result']?['data']?['hosted_url'] is String) {
          final hostedUrl =
              resp1.data['result']['data']['hosted_url'] as String;
          final successUrl =
              resp1.data['result']['data']['redirect_url'] as String;
          final errorUrl = resp1.data['result']['data']['cancel_url'] as String;
          final data = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WebViewPayment(url: hostedUrl)));
          if (data == true) {
            final type = paymentMethods.value
                .firstWhereOrNull((element) => element.id == '3');
            if (type != null) {
              /*     Get.to(PaymentWaitingScreen(
                type: type,
                total: widget.totalAmount,
                IuvTax: widget.IUVTax,
                StateTax: widget.StateTax,
                subtotal: widget.subTotal,
              ));*/
            }
          }
        } else {
          showError(context, "Payment failed");
        }

        loading.value = false;
      } catch (e) {
        loading.value = false;
        Get.back();
        showError(context, e);
        debugPrint('$e');
      }
    }

    Future<void> cryptoPayment() async {
      continueCryptoPayment();
    }

    Future<void> athmovil(
        BuildContext context, PaymentMethodModel value) async {
      const url = 'https://orkiosk.com/admin/ath.html';
      // const url = 'https://flutter.dev';
      print("cartItems.value---------${cartItems.value.toString()}");
      print(
          "cartItems.value--cartid-------${cartItems.value.map((e) => e?.cart_id).join(', ')}");
      print(
          "cartItems.value---itemid------${cartItems.value.map((e) => e?.item_id).join(',')}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(
                  StateTax: widget.StateTax,
                  model: value,
                  total: widget.totalAmount,
                  order_id: '',
                  name: userName.text,
                  user_id: user.value!.id!,
                  des:
                      'Payment for: ${cartItems.value.map((e) => e.item_name).join(', ')}',
                  quantity: cartItems.value.map((e) => e.quantity).join(', '),
                  sub_total: widget.subTotal,
                  tax: widget.IUVTax,
                  token: user.value!.token!,
                  cart_id: cartItems.value.map((e) => e.cart_id).join(', '),
                  item_id: cartItems.value.map((e) => e.item_id).join(','),
                  type: GetStorage().read('type') ?? '',
                  app_order_status: OrderType,
                  cartItems: cartItems.value)));

      /*if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url),
        mode: LaunchMode.inAppWebView);
      } else {
        _showMyDialog();
        throw 'Could not launch $url';

      }*/

      // final Uri url = Uri.parse('https://flutter.dev');
      // if (!await launchUrl(url)) {
      //   throw Exception('Could not launch $url');
      // }
      // _launchURL(context);
      // Navigator.push(context, MaterialPageRoute(builder: (context)
      // =>WebViewScreen(total:totalAmount.value.toString(), order_id: '', name: userName.text,
      //   user_id: user.value!.id, des:'Payment for: ${cartItems.value.map((e) => e.item_name).join(', ')}', quantity: '',
      //   sub_total: '', tax: '',))) ;
      // loading.value = true;
      // try {
      //   final resp1 = await api().get(
      //     'ATH',
      //     queryParameters: {
      //       'total': totalAmount.value,
      //       'subtotal': totalAmount.value,
      //       'tax': 0,
      //       'user_id': user.value?.id,
      //     },
      //   );
      //   debugPrint('${resp1.data}');
      //
      //   loading.value = false;
      // } catch (e) {
      //   loading.value = false;
      //   showError(context, e);
      //   debugPrint('$e');
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sbh((30 / 3.75).w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (20 / 3.75).w),
              child: Text("Select Payment Method",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: CC.blackPurple)),
            ),
            sbh((20 / 3.75).w),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (loading.value)
                      const Center(child: CircularProgressIndicator.adaptive())
                    else
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: (SDP.width! - (SDP.width! / 2.99 * 2)) / 3,
                        // spacing: 10.w,
                        children: [
                          for (int i = 0; i < paymentMethods.value.length; i++)
                            if (paymentMethods.value[i].status.toString() ==
                                "Active")
                              SizedBox(
                                width: SDP.width! / 2.99,
                                height: SDP.width! / 2.99,
                                child: InkWell(
                                  onTap: () => paymentMethods.value[i].name ==
                                          'Pay by Cryptocurency'
                                      ? cryptoPayment()
                                      : paymentMethods.value[i].name ==
                                              'Pay by ATH Móvil'
                                          ? athmovil(
                                              context, paymentMethods.value[i])
                                          : paymentMethods.value[i].name ==
                                                  'Pay by Card'
                                              ? Get.to(AddCard(
                                                  totalAmount:
                                                      totalAmount.value,
                                                  user: user.value?.id ?? '',
                                                  type: paymentMethods.value[i],
                                                  IuvTax: double.parse(
                                                      widget.IUVTax),
                                                  StateTax: double.parse(
                                                      widget.StateTax),
                                                  subtotal: widget.subTotal,
                                                ))
                                              : Get.to(PaymentWaitingScreen(
                                                  type: paymentMethods.value[i],
                                                  total: widget.totalAmount,
                                                  IuvTax: widget.IUVTax,
                                                  StateTax: widget.StateTax,
                                                  subtotal: widget.subTotal,
                                                )),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: CC.themeGradient,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                    // padding: EdgeInsets.symmetric(horizontal: (20 / 3.75).w, vertical: (15 / 3.75).w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            [
                                              'assets/icons/swipe_card.png',
                                              'assets/icons/counter_cash.png',
                                              'assets/icons/counter_cash.png',
                                              'assets/icons/counter_cash.png'
                                            ][i % 4],
                                            height: (55 / 3.75).w,
                                            width: (55 / 3.75).w),
                                        sbh((5 / 3.75).w),
                                        Text(
                                          paymentMethods
                                                  .value[i].name.capitalize ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: CC.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            sbh((20 / 3.75).w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AppButton(onTap: () {}, text: 'Cancel Order')],
            ),
            sbh((30 / 3.75).w),
          ],
        ),
      ),
    );
  }
}
