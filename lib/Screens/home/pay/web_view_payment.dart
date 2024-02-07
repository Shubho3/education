import 'package:flutter/material.dart';

class WebViewPayment extends StatefulWidget {
  final String url;
  const WebViewPayment({super.key, required this.url});

  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  // late final controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.contains('admin/success')) {
  //           Navigator.of(context).pop(true);
  //           // return NavigationDecision.prevent;
  //         } else if (request.url.contains('admin/cancel')) {
  //           Navigator.of(context).pop();
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse(widget.url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
  //    body: WebViewWidget(
    //    controller: controller,
    //  ),
    );
  }
}
