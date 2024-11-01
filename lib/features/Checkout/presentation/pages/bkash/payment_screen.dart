import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/models/bkash/payment_status.dart';



class PaymentScreen extends StatefulWidget {
  final String bkashURL;
  final String successCallbackURL;
  final String failureCallbackURL;
  final String cancelledCallbackURL;

  const PaymentScreen({
    super.key,
    required this.bkashURL,
    required this.successCallbackURL,
    required this.failureCallbackURL,
    required this.cancelledCallbackURL,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    // _controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //     ..addJavaScriptChannel('Print', onMessageReceived: (JavaScriptMessage message) {
    //       //This is where you receive message from
    //       //javascript code and handle in Flutter/Dart
    //       //like here, the message is just being printed
    //       //in Run/LogCat window of android studio
    //       Logger().i(message.message);
    //     })
    //   ..setBackgroundColor(Colors.transparent)


    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onWebResourceError: (WebResourceError error) {
          //   return Navigator.of(context).pop(PaymentStatus.failed);
          // },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://www.bkash.com/")) {
              return NavigationDecision.navigate;
            }
            if (request.url.startsWith(widget.successCallbackURL)) {
              Navigator.of(context).pop(PaymentStatus.success);
              // Logger().w();
            } else if (request.url.startsWith(widget.failureCallbackURL)) {
              Navigator.of(context).pop(PaymentStatus.failed);
            } else if (request.url.startsWith(widget.cancelledCallbackURL)) {
              Navigator.of(context).pop(PaymentStatus.canceled);
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.bkashURL));
    super.initState();


  }

  @override
  void dispose() {
    _controller.clearCache();
    _controller.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          await _controller.goBack();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("bKash Checkout"),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(PaymentStatus.canceled),
          ),
        ),
        body: WebViewWidget(
            controller: _controller,
        ),
      ),
    );
  }
}
