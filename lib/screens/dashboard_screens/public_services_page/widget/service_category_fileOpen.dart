import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import 'package:gandakimun/model/public_service.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:html/dom.dart' as dom;

class PublicServiceFileOpen extends StatelessWidget {
  PublicServiceFileOpen(
      {Key? key, required this.publicSericeHeadingModel, required this.text});
  final PublicSericeHeadingModel publicSericeHeadingModel;
  final String text;
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(text),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
            ),
            child: Text(
              publicSericeHeadingModel.createdAt.toString(),
              textScaleFactor: 1,
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          publicSericeHeadingModel.details != null
              ? HtmlWidget(
                  publicSericeHeadingModel.details!.toString(),
                )
              : const SizedBox(),
          // publicSericeHeadingModel.files!.endsWith('.pdf')
          //     ? Expanded(
          //         flex: 6,
          //         child: SfPdfViewer.network(
          //           "$publicSericeHeadingModel.files}",
          //         ),
          //       )
          //     : Expanded(
          //         child:
          //             Image.network(publicSericeHeadingModel.files.toString())),
        ],
      ),
    );
  }
}
