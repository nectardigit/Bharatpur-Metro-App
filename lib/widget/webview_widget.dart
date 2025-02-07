import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatelessWidget {
  WebviewWidget({Key? key, required this.url, required this.title})
      : super(key: key);
  final String url;
  final String title;
  final _key = UniqueKey();

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(title),
        body: Obx(
          () => Column(
            children: [
              controller.webviewLoading.value
                  ? const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
              Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (finish) {
                      controller.webviewLoading(false);
                    },
                    initialUrl: url),
              ),
            ],
          ),
        ));
  }
}
