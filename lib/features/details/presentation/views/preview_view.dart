import 'package:clean_arch_bookly_app/core/base_fuctions/convert_http_to_https.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Preview")),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(convertHttpToHttps(url))),
      ),
    );
  }
}
