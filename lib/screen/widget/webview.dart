import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  final String title, url;
  const WebViewWidget({Key key, this.title, this.url}) : super(key: key);

  @override
  createState() => _WebViewState();
}

class _WebViewState extends State<WebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text(widget.title)),
        body: Builder(builder: (BuildContext context) {
      return WebView(
          initialUrl: widget.url, javascriptMode: JavascriptMode.unrestricted);
    }));
  }
}
