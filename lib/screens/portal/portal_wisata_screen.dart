import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortalWisataScreen extends StatefulWidget {
  const PortalWisataScreen({super.key});

  @override
  State<PortalWisataScreen> createState() => _PortalWisataScreenState();
}

class _PortalWisataScreenState extends State<PortalWisataScreen> {
  late final WebViewController controller;


  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://indonesia.travel/gb/en/home.html'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
